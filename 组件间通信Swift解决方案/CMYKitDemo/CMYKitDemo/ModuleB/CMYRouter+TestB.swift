//
//  CMYRouter+TestB.swift
//  CMYKitDemo
//
//  Created by  MarvinChan on 2019/3/28.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

private let kTargetB_nameSpace = "CMYKitDemo"
private let kTargetB_name = "B"
private let kTargetB_toTestBViewControllAction = "nativeFetchTestBViewController:"
import UIKit
extension CMYRouter {
    public func CMYRouter_viewControllerForTestB(_ name: String) -> UIViewController? {
        
        let controller = self.perform(nameSpace: kTargetB_nameSpace, target: kTargetB_name, action: kTargetB_toTestBViewControllAction, params: ["name":name,"color":"0x217812"])
        return controller as? UIViewController
    }
}

