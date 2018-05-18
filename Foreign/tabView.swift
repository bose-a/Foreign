//
//  tabView.swift
//  Foreign
//
//  Created by Aditya Bose on 4/21/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
class tabView: UITabBarController{
    //override var prefersStatusBarHidden: Bool {return true}
    override var preferredStatusBarStyle : UIStatusBarStyle {
        //return UIStatusBarStyle.lightContent
        return UIStatusBarStyle.default   // Make dark again
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
    }
}

