//
//  WeatherManager.swift
//  Clima
//
//  Created by Michael Taranik on 06.07.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithAnError(_ error: Error)
}

struct WeatherManager {
    
    let keyAPI = "4c57eabae615847140dc51f3ea882895"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4c57eabae615847140dc51f3ea882895&"
    
    
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(_ city: String) {
        let urlString = "\(weatherURL)q=\(city)&units=metric"
        self.performRequest(with: urlString)
    }
    
    func fetchWeather(latitude lat: Double, longitude lon: Double) {
        let urlString = "\(weatherURL)lat=\(lat)&lon=\(lon)&units=metric"
        self.performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithAnError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
            
        }
    }
    
    
    func parseJSON(_ climaRecords: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ClimaRecords.self, from: climaRecords)
            
            let name = decodedData.name
            let temp = Int(decodedData.main.temp)
            let id = decodedData.weather[0].id
            let country = decodedData.sys.country
            let description = decodedData.weather[0].description
            
            let weatherModel =
            WeatherModel(name: name, conditionID: id, temperature: temp, description: description, country: country)
            return weatherModel
        } catch {
            self.delegate?.didFailWithAnError(error)
            return nil
        }
    }
    
    
}
