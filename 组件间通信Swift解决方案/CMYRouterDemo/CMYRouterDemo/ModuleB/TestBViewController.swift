//
//  TestBViewController.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class TestBViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        self.title = "TestB"
        
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 100, y: 200, width: 250, height: 150)
        button.backgroundColor = .orange
        button.setTitle("Go B Detail", for: .normal)
        view.addSubview(button)
        button.add(for: .touchUpInside) {[weak self] in
            let ctrl = TestBDetailViewController()
            ctrl.ID = "8888888"
            self?.navigationController?.show(ctrl, sender: nil)
        }
        
        let button2 = UIButton(type: .custom)
        button2.frame = CGRect.init(x: 100, y: 400, width: 250, height: 200)
        button2.backgroundColor = .gray
        button2.setTitle("Go A Detail", for: .normal)
        view.addSubview(button2)
        button2.add(for: .touchUpInside) {[weak self] in
            postShowTestADetail(self?.navigationController, name: "测试是是是是")
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
