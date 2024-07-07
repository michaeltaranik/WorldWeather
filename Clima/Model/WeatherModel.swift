//
//  WeatherModel.swift
//  Clima
//
//  Created by Michael Taranik on 07.07.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

struct WeatherModel {
    
    let name: String
    let conditionID: Int
    let temperature: Int
    
    var temperatureString: String { String(temperature) }
    
    var condition: String {
        if conditionID == 800 {
            return "sun.max"
        }
        switch conditionID / 100 {
        case 2:
            return "cloud.bolt.rain"
        case 3:
            return "cloud.drizzle"
        case 5:
            return "cloud.rain"
        case 6:
            return "cloud.snow"
        case 7:
            return "cloud.fog"
        default:
            return "cloud"
        }
    }
}
