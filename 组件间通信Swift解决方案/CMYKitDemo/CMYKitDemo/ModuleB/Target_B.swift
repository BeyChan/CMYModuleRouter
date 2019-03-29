//
//  Target_B.swift
//  CMYKitDemo
//
//  Created by  MarvinChan on 2019/3/28.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class Target_B: NSObject {
        @objc
        func Action_nativeFetchTestBViewController(_ params: [String: AnyObject]) -> UIViewController? {
            let controller = TestBViewController()
            
            if let name = params["name"] {
                controller.title = name as? String
            }
            if let color = params["color"] {
                controller.view.backgroundColor = UIColor(hexString: color as! String)
            }
            
            return controller
        }
}
    
