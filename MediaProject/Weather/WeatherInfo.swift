// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct WeatherInfo: Codable {
    let coord: Coord
    let weather: [Weather]
    let wind: Wind
    let sys: Sys
    let name: String
    let main: Main
    
}
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case humidity  // 습도
    }
}

// MARK: - Sys
struct Sys: Codable {
    let country: String
   
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

