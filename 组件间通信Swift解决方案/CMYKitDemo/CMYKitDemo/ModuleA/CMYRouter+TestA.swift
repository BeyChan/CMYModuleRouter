//
//  CMYRouter+TestA.swift
//  CMYKitDemo
//
//  Created by  MarvinChan on 2019/3/28.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

private let kTargetA_nameSpace = "CMYKitDemo"
private let kTargetA_name = "A"
private let kTargetA_toTestAViewControllAction = "nativeFetchTestAViewController:"
import UIKit
extension CMYRouter {
    public func CMYRouter_viewControllerForTestA(_ color: String) -> UIViewController? {
        let controller = self.perform(nameSpace: kTargetA_nameSpace, target: kTargetA_name, action: kTargetA_toTestAViewControllAction, params: ["color":color])
        return controller as? UIViewController
    }
}

