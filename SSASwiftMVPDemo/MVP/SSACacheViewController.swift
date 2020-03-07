//
//  SSACacheViewController.swift
//  SSASwiftMVPDemo
//
//  Created by GuJunBing on 2020/3/7.
//  Copyright © 2020 GuJunBing. All rights reserved.
//

import UIKit

class SSACacheViewController: UIViewController {
  private var ssaCachePresenter = SSACachePresenter<SSACacheViewController>()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    
    self.ssaCachePresenter.initial(self)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    reloadData()
  }
  
  func reloadData() {
    // 请求网络
    self.ssaCachePresenter.getCache(by: 2000)
  }
  
}

extension SSACacheViewController: SSACacheProtocol {
  
  // 获取成功
  func onGetCacheSuccess(model: SSACacheModel?) {
    dump(model)
    
    DispatchQueue.main.async {
      self.view.backgroundColor = .white
      let lab = UILabel()
      lab.textColor = .black
      lab.textAlignment = .center
      lab.text = "\(model?.origin ?? "") \n \(model?.url ?? "")"
      lab.numberOfLines = 2
      lab.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200)
      self.view.addSubview(lab)
    }
  }
  
  // 获取失败
  func onGetCacheFailure(error: Error) {
    dump(error)
  }
}
