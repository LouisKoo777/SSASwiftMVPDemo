//
//  SSACacheModel.swift
//  SSASwiftMVPDemo
//
//  Created by GuJunBing on 2020/3/7.
//  Copyright © 2020 GuJunBing. All rights reserved.
//  模型

import Foundation

struct SSACacheModel {
  var origin: String?
  var url: String?
  
  init() {
    
  }
  
  static func fromJSON(_ dictionary: [String: Any]?) -> SSACacheModel? {
    if let json = dictionary {
      var cm = SSACacheModel()
      cm.origin = json["origin"] as? String
      cm.url = json["url"] as? String
      return cm
    }
    return nil
  }
}
