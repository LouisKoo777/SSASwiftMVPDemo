//
//  SSAHTTPService.swift
//  SSASwiftMVPDemo
//
//  Created by GuJunBing on 2020/3/7.
//  Copyright © 2020 GuJunBing. All rights reserved.
//

import Foundation

struct SSAHTTPService {
//  typealias Paramters = Dictionary<String, Any>
  var responseHandle: SSAHTTPServiceResponseProtocol?
  
  init(handle: SSAHTTPServiceResponseProtocol?) {
    self.responseHandle = handle
  }
  
  func get(url: String) {
    let session = URLSession(configuration: URLSessionConfiguration.default)
    let request = URLRequest(url: URL(string: url)!)
    session.dataTask(with: request, completionHandler: {
      data, response, error in
      if error == nil {
        if let da = data,
          let any = try? JSONSerialization.jsonObject(with: da, options: .mutableContainers),
          let dict = any as? [String: Any] {
          self.responseHandle?.onSuccess(object: dict)
        }
      } else {
        self.responseHandle?.onFailure(error: error!)
      }
    }).resume()
  }
}
