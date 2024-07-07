//
//  ClimaRecords.swift
//  Clima
//
//  Created by Michael Taranik on 07.07.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit


struct ClimaRecords: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
}
