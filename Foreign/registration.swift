//
//  registration.swift
//  Foreign
//
//  Created by Aditya Bose on 4/15/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
class registration: UIViewController{
    @IBOutlet weak var label: UILabel!
    var fullnameRec = ""
    var emailRec = ""
    var passwordRec = ""
    static let browseVC = "browseVC"
    //override var prefersStatusBarHidden: Bool {return true}
    let databaseRef = Database.database().reference(fromURL: "https://foreign-a0fee.firebaseio.com/")
    override var preferredStatusBarStyle : UIStatusBarStyle {
        //return UIStatusBarStyle.lightContent
        return UIStatusBarStyle.default   // Make dark again
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HI BRO")
        //Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBAction func go(_ sender: Any) {
        self.name.resignFirstResponder()
        self.email.resignFirstResponder()
        self.pass.resignFirstResponder()
    }
    @IBAction func goSignUp(_ sender: UIButton) {
        if(email.text != "" && pass.text != ""){
            //print("HIHIHIHI")
            fullnameRec = self.name.text!
            emailRec = self.email.text!
            passwordRec = self.pass.text!
            Auth.auth().createUser(withEmail: self.emailRec, password: self.passwordRec, completion: {(firUser, error) in
                if error != nil{
                    print(error!)
                    print("HIHIHIHI")
                }
                else if let firUser = firUser{
                //Save User Info
                    //let newUser = User(uid: (firUser.uid), fullname: fullname, email: email)
                    //newUser.save()
                    print(self.email)
                    //let newUser = User(uid: (firUser.uid), fullname: self.fullnameRec, email: self.emailRec)
                    //newUser.save()
                    let newUser = AppUser(uid: (firUser.uid), fullname: self.fullnameRec, email: self.emailRec)
                    newUser.save()
                    let userToDefault = UserAPI(inputtedUser: newUser)
                    userToDefault.saveUser()
                    //let userToDefault = UserAPI(inputtedUser: newUser)
                    //userToDefault.saveUser()
                    //UserDefaults.standard.synchronize()
                    //print("IN REGISTER FULL = ", userToDefault.getUser().fullname)
                    Auth.auth().signIn(withEmail: self.emailRec, password: self.passwordRec, completion: {(firUser, error) in
                        if let error = error{
                            print("ERRORRORORORO: ", error)
                        }
                        else{
                            print("In Register, about to dismiss")
                            //self.dismiss(animated: true, completion: nil)
                            self.performSegue(withIdentifier: "tvc", sender: self)
                            //print("Performed segue or not")
                        }
                    })
                //SUCCESSFUL SIGN UP
                //print("HIHIHIHI")
                }
            })
        }
        //if(email.text != "" && pass.text != ""){
            //Auth.auth().createUser(withEmail: email.text!, password: pass.text!, completion: {(user, error) in
                //if(user != nil){
                    //print("SUCCESS")
                    //guard let uid = user?.uid else{
                        //return
                    //}
                    //let userReference = self.databaseRef.child("users").child(uid)
                    //let values = ["Name": self.name.text!, "Email": self.email.text!]
                    //userReference.updateChildValues(values, withCompletionBlock: {(error, ref) in
                        //if error != nil{
                            //print(error as Any)
                            //return
                        //}
                        //self.dismiss(animated: true, completion: nil)
                        //})
                    //self.performSegue(withIdentifier: "browseVC", sender: self)
                //}
                //else{
                    //if let myError = error?.localizedDescription{
                        //print(myError)
                    //}
                    //else{
                        //print("ERROR")
                   // }
                //}
            //})
        //}
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
//}
