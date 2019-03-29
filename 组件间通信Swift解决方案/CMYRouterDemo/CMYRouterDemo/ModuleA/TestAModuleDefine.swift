//
//  Notification.Name.Extension.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

public extension Notification.Name {
    static let kShowTestADetail = Notification.Name("kShowTestADetail")
}

func postShowTestADetail(_ currentNav: UINavigationController?,name: String?) {
    guard let currentNav = currentNav else { return }
    guard let name = name else { return }
    
    let object = ["currentNav":currentNav,"name": name] as [String : Any]
    NotificationCenter.default.post(name: .kShowTestADetail, object: object)
}
