//
//  SSAPresenter.swift
//  SSASwiftMVPDemo
//
//  Created by GuJunBing on 2020/3/7.
//  Copyright © 2020 GuJunBing. All rights reserved.
//

import Foundation

protocol SSAPresenter {
  associatedtype T
  var view: T? { get set }
  mutating func initial(_ view: T)
}

extension SSACachePresenter: SSAPresenter {}

