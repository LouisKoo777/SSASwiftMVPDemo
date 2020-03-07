//
//  SSACacheProtocol.swift
//  SSASwiftMVPDemo
//
//  Created by GuJunBing on 2020/3/7.
//  Copyright © 2020 GuJunBing. All rights reserved.
//  

import Foundation

protocol SSACacheProtocol {
  func onGetCacheSuccess(model: SSACacheModel?)
  func onGetCacheFailure(error: Error)
}
