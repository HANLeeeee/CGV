//
//  MoviesAPI.swift
//  CGV
//
//  Created by 최하늘 on 2022/08/01.
//

import Foundation
import Alamofire
import SwiftyJSON

enum valueError: String, Error {
    case noValue = "검색 결과 없음"
}

class MoviesAPI {
    
    func getMovieChart(targetDt: String, completion: @escaping (Result<[Movie], valueError>) -> Void) {
        
        let MovieURL: String = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        let key: String = "c20d1320dcf9f1f3cf250d6e01afcfac"
        
        AF.request("\(MovieURL)?key=\(key)&targetDt=\(targetDt)", method: .get)
            .validate()
            .response(completionHandler: { response in
                
                guard let responseValue = response.value else {
                    return
                }
                
                var moviesArray = [Movie]()
                let responseJson = JSON(responseValue!)
                let jsonArray = responseJson["boxOfficeResult"]["dailyBoxOfficeList"]
                for (_, subJson): (String, JSON) in jsonArray {
                    guard let rank = subJson["rank"].string,
                          let movieNm = subJson["movieNm"].string,
                          let openDt = subJson["openDt"].string else {
                        return
                    }
                    let movieValue = Movie(rank: rank, movieNm: movieNm, openDt: openDt)
                     
                    moviesArray.append(movieValue)
                }
                if moviesArray.count > 0 {
                    completion(.success(moviesArray))
                } else {
                    completion(.failure(.noValue))
                }
            })
        

    }
}
