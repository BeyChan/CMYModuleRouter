//
//  TestAModuleAPI.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit



class TestAModuleAPI: NSObject {
    
    deinit {
        print("deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
    public static var shared: TestAModuleAPI = TestAModuleAPI()
    
    private override init() {
        super.init()
        self.registerNotification()
    }
    
    /// 跳转到A详情
    var jumpADetailBlock:((String,UINavigationController) -> Void)?
    
    /// 获取A控制器
    var aController: UIViewController {
        get {
            return TestAViewController()
        }
    }
    
    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(jumpADetail(_:)), name: .kShowTestADetail, object: nil)
    }
    
    @objc func jumpADetail(_ noti: NSNotification) {
        guard let info = noti.object as? [String: AnyObject] else {return}
        guard let currentNav = info["currentNav"] as? UINavigationController else { return }
        guard let name = info["name"] as? String else { return }
        
        self.jumpADetailBlock?(name,currentNav)
    }
    
    func getTestADetailController(_ name: String) -> UIViewController{
        let controller = TestADetialViewController()
        controller.name = name
        return controller
    }
    
    
}
