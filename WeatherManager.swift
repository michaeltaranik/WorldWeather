//
//  WeatherManager.swift
//  Clima
//
//  Created by Michael Taranik on 06.07.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    
    let keyAPI = "4c57eabae615847140dc51f3ea882895"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4c57eabae615847140dc51f3ea882895&q="
    
    
    var temperature: Int?
    var city: String?
    var condition: String?
    
   func fetchWeather(_ city: String) {
        let urlString = "\(weatherURL)\(city)&units=metric"
        self.performRequest(urlString)
    }
    
   func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(climaRecords: safeData)
                }
            }
            task.resume()
            
        }
    }
    
    
    func parseJSON(climaRecords: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ClimaRecords.self, from: climaRecords)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
}
