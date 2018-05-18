//
//  login.swift
//  Foreign
//
//  Created by Aditya Bose on 4/15/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class login: UIViewController{
    var uid = ""
    var fullname = ""
    var emailRecieved = ""
    //var address = ""
    //var orders = 0
    //override var prefersStatusBarHidden: Bool {return true}
    override var preferredStatusBarStyle : UIStatusBarStyle {
        //return UIStatusBarStyle.lightContent
        return UIStatusBarStyle.default   // Make dark again
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    var name = ""
    @IBAction func go(_ sender: Any) {
        self.email.resignFirstResponder()
        self.pass.resignFirstResponder()
    }
    @IBAction func loginTapped(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: email.text!, password: pass.text!, completion: {(user, error) in
            if(user != nil){
                self.workOnUser()
                print("SUCCESS LOGGING IN")
                self.performSegue(withIdentifier: "tvc", sender: self)
            }
            else{
                if let myError = error?.localizedDescription{
                    print(myError)
                    print("NOOOOO")
                }
                else{
                    print("ERROR")
                }
            }
        })
    }
    func workOnUser(){
        var ref:DatabaseReference?
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref?.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.uid = value?["uid"] as? String ?? ""
            self.fullname = value?["fullname"] as? String ?? ""
            self.emailRecieved = value?["email"] as? String ?? ""
            //self.orders = value?["orders"] as? Int ?? 0
            //self.address = value?["address"] as? String ?? ""
            let userForLogin = AppUser(uid: self.uid, fullname: self.fullname, email: self.emailRecieved)
            //let loggingUser = UserAPI(inputtedUser: userForLogin)
            let loggingUser = UserAPI(inputtedUser: userForLogin)
            let productToAdd = ClassicTee(borw: true, inputtedSize: "Small")
            loggingUser.getUser().modCart(inputtedProduct: productToAdd)
            loggingUser.saveUser()
            //userForLogin.orders = self.orders
            //userForLogin.address = self.address
            //let loggedUser = UserAPI(inputtedUser: userForLogin)
            //loggedUser.saveUser()
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    //}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
