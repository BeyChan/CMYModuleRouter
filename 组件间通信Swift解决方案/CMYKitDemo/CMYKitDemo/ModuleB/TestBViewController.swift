//
//  TestBViewController.swift
//  CMYKitDemo
//
//  Created by  MarvinChan on 2019/3/28.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class TestBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 50, y: 100, width: 100, height: 60)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func clickAction() {
        if let controller = CMYRouter.shared.CMYRouter_viewControllerForTestA("0x138323") {
            self.navigationController?.show(controller, sender: nil)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
