//
//  Weather.swift
//  MediaProject
//
//  Created by 홍석평 on 6/12/24.
//

import Foundation

struct MainWeather: Decodable{
    
    var weather: [DetailWeather]
    let countryName: sys
    
}
struct DetailWeather: Decodable{
    let id : Int
    let main: String
    let description: String
    let icon: String
}
struct sys: Decodable{
    let country: String
}
