//
//  Movie.swift
//  MediaProject
//
//  Created by 홍석평 on 6/12/24.
//

import Foundation

// 구조체 구조 중요
struct BoxOffice: Decodable{
    let boxOfficeResult: Movie
}

struct Movie: Decodable{
    let boxofficeType: String
    let showRange: String
    var dailyBoxOfficeList: [MovieDetail]
}
struct MovieDetail: Decodable{
    let rank: String
    let movieNm: String  // 영화 이름
    let openDt: String   // 상영 일자 
}

