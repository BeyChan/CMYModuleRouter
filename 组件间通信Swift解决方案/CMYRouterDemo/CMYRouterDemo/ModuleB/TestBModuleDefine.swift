//
//  TestBModuleDefine.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

public extension Notification.Name {
    static let kShowTestBDetail = Notification.Name("kShowTestBDetail")
}

func postShowTestBDetail(_ currentNav: UINavigationController?,ID: String?) {
    guard let currentNav = currentNav else { return }
    guard let ID = ID else { return }
    
    let object = ["currentNav":currentNav,"ID": ID] as [String : Any]
    NotificationCenter.default.post(name: .kShowTestBDetail, object: object)
}
