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
    
    func fetchWeather(_ city: String) -> String {
        print("\(weatherURL)\(city)&units=metric")
        return "\(weatherURL)\(city)&units=metric"
    }
}
