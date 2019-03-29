//
//  TestAViewController.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class TestAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TestA"
        
        view.backgroundColor = .white
        
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 100, y: 200, width: 250, height: 150)
        button.backgroundColor = .orange
        button.setTitle("Go B", for: .normal)
        view.addSubview(button)
        button.add(for: .touchUpInside) {[weak self] in
            let ctrl = TestBModuleAPI.shared.bController
            self?.navigationController?.show(ctrl, sender: nil)
        }
        
        let button2 = UIButton(type: .custom)
        button2.frame = CGRect.init(x: 100, y: 400, width: 250, height: 200)
        button2.backgroundColor = .blue
        button2.setTitle("Go B Detail", for: .normal)
        view.addSubview(button2)
        button2.add(for: .touchUpInside) {[weak self] in
            postShowTestBDetail(self?.navigationController, ID: "372878232")
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
