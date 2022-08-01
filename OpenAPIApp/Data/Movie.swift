//
//  dataManager.swift
//  OpenAPIApp
//
//  Created by 최하늘 on 2022/08/01.
//

import Foundation
import UIKit

struct Movie: Codable {
    var rank: String
    var movieNm: String
    var openDt: String
}

struct MovieDetail: Codable {
    let title: String
    let image: String
    let rank: String
}

var moviesDetailArray = [MovieDetail]()
