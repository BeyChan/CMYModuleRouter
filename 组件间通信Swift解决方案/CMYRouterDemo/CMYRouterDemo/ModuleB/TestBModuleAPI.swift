//
//  TestBModuleAPI.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class TestBModuleAPI: NSObject {
    
    public static let shared: TestBModuleAPI = TestBModuleAPI()
    
    deinit {
        print("deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
    private override init() {
        super.init()
        registerNotification()
    }
    
    
    /// 获取B控制器
    var bController: UIViewController {
        get {
            return TestBViewController()
        }
    }
    
    /// 跳转到B详情
    var jumpBDetailBlock:((String,UINavigationController) -> Void)?
    
    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(jumpBDetail(_:)), name: .kShowTestBDetail, object: nil)
    }
    
    @objc func jumpBDetail(_ noti: NSNotification) {
        guard let info = noti.object as? [String: AnyObject] else {return}
        guard let currentNav = info["currentNav"] as? UINavigationController else { return }
        guard let name = info["ID"] as? String else { return }
        
        self.jumpBDetailBlock?(name,currentNav)
    }
    
    func getTestBDetailController(_ ID: String) -> UIViewController{
        let controller = TestBDetailViewController()
        controller.ID = ID
        return controller
    }
}
