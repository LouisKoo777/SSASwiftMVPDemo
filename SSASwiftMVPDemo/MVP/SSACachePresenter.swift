//
//  SSACachePresenter.swift
//  SSASwiftMVPDemo
//
//  Created by GuJunBing on 2020/3/7.
//  Copyright © 2020 GuJunBing. All rights reserved.
//

import Foundation

struct SSACachePresenter<U> where U: SSACacheProtocol {
  
  var view: U?
  mutating func initial(_ view: U) {
    self.view = view
    self.httpService = SSAHTTPService(handle: self)
  }
  
  var httpService: SSAHTTPService?
  init() {}
  
  typealias Value = Int
  func getCache(by integer: Value) {
    // 网络请求 ...
    self.httpService?.get(url: "http://httpbin.org/cache/\(integer)")
  }
}

extension SSACachePresenter: SSAHTTPServiceResponseProtocol {
  func onSuccess(object: Dictionary<String, Any>) {
    view?.onGetCacheSuccess(model: SSACacheModel.fromJSON(object))
  }
  
  func onFailure(error: Error) {
    print(error)
  }
}
