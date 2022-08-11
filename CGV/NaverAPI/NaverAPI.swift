//
//  Naver.swift
//  CGV
//
//  Created by 최하늘 on 2022/08/01.
//

import Foundation
import Alamofire
import SwiftyJSON


class NaverAPI {
    func getMovieImage(_ param: String, _ rank: String, completion: @escaping (Result<[MovieDetail], valueError>) -> Void) {
        
        let NaverURL: String = "https://openapi.naver.com/v1/search/movie.json"
        let hearders : HTTPHeaders = [
                                        "X-Naver-Client-Id" : "ZFPo56P_61n2bdu0aYjD",
                                        "X-Naver-Client-Secret": "7UQywyETdT"
                                    ]
        
        let parameters: Parameters = [
                                        "query": param,
                                        "display": 1
                                    ]
        
        AF.request(NaverURL, method: .get, parameters: parameters, headers: hearders)
            .validate()
            .response(completionHandler: { response in
                
                guard let responseValue = response.value else {
                    return
                }
                
                let responseJson = JSON(responseValue!)
                let jsonArray = responseJson["items"]
                
                for (_, subJson): (String, JSON) in jsonArray {
                    let image = subJson["image"].string ?? ""
                    let movieImageURL = MovieDetail(title: param, image: image, rank: rank)
                    moviesDetailArray.append(movieImageURL)
                }
                
                if moviesDetailArray.count > 0 {
                    completion(.success(moviesDetailArray))
                } else {
                    completion(.failure(.noValue))
                }
            })
    }
}
