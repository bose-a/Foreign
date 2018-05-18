//
//  ViewController.swift
//  Foreign
//
//  Created by Aditya Bose on 3/20/18.
//  Copyright © 2018 Adi Bose. All rights reserved.
//

import UIKit
import Lottie
import Firebase
import FirebaseDatabase
class ViewController: UIViewController {
    //override var prefersStatusBarHidden: Bool {return true}
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener({(auth, user) in
            if user != nil{
                print("in First, trying to dismiss")
                //self.dismiss(animated: false, completion: nil)
                self.performSegue(withIdentifier: "browsepl", sender: self)
            }
            else{
                print("The user is nill, in first")
            }
        })
        showAnimation()
        //Do any additional setup after loading the view, typically from a nib.
    }
    func showAnimation(){
        let animationView = LOTAnimationView(name: "forani")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        animationView.play();
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

