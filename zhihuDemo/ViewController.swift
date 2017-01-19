//
//  ViewController.swift
//  zhihuDemo
//
//  Created by tom.zhang on 17/1/18.
//  Copyright © 2017年 tom.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ZZHLog.warning("hello log test")
        ZZHLog.error("error test")
        ZZHLog.error("log test ...")
        ZZHLog.debug("log test ...")
        ZZHLog.warning("log test ...")
//        ZZHLog.severe("log test ...")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

