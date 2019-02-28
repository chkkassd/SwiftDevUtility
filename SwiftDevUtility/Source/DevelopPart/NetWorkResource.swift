//
//  NetWorkResource.swift
//  WeBoard
//
//  Created by 赛峰 施 on 2017/3/31.
//  Copyright © 2017年 赛峰 施. All rights reserved.
//

/*
import Foundation
import Alamofire

///The struct describe the process of network and the most importnt thing is it decouple the net work ,parser and completion handler.
struct SSFNetworkResource<T> {
    let path: URL//The url of net work
    let parser: (Any) -> T//The method of translating the json object to the data modle
    let header: HTTPHeaders?
}

extension SSFNetworkResource {
    func asyncLoad(parameterDic: [String:Any]? ,completionHandler: @escaping (Result<T>) -> Void) {
        Alamofire.request(path, method: .post, parameters: parameterDic, encoding: JSONEncoding.default, headers: header)
                 .validate()
                 .responseJSON { dataResponse in
                    switch dataResponse.result {
                    case .success(let value):
                        completionHandler(Result.success(self.parser(value)))
                    case .failure(let error):
                        completionHandler(Result.failure(error))
                    }
        }
    }
}
*/
