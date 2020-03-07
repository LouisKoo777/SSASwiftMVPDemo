//
//  SSAHTTPServiceResponseProtocol.swift
//  SSASwiftMVPDemo
//
//  Created by GuJunBing on 2020/3/7.
//  Copyright © 2020 GuJunBing. All rights reserved.
//

import Foundation

protocol SSAHTTPServiceResponseProtocol {
  
  func onSuccess(object: Dictionary<String, Any>)
  func onFailure(error: Error)
}
