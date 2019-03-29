//
//  TestBDetailViewController.swift
//  CMYRouterDemo
//
//  Created by  MarvinChan on 2019/3/29.
//  Copyright © 2019  MarvinChan. All rights reserved.
//

import UIKit

class TestBDetailViewController: UIViewController {

    var ID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()
        self.title = "TestBDetail"
        
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 20))
        label.text = "ID:\(ID ?? "")"
        label.textColor = .white
        view.addSubview(label)
        // Do any additional setup after loading the view.
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
