//
//  browse.swift
//  Foreign
//
//  Created by Aditya Bose on 4/21/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import UIKit
import Firebase
//import Moltin
class browse: UIViewController{
    static let showWelcome = "showWelcome"
    var name: String = ""
    var firstName: String = ""
    var prodSize: String = "No Size"
    var prodSize2: String = "No Size"
    var prodSize3: String = "BRUH"
    var work: String = "NS"
    var appUser = AppUser()
    var currentUser = UserAPI()
    var PrintCart: [Product] = []
    //let userDefaults = UserDefaults.standard
    //let moltin = Moltin(withClientID: "Qx4mVagIT5SYsPEjnN5arFBGnCmMCvzA05RDNsf4pZ")
    //let user = User()
    //var productsarray: [Product]? = []
    //override var prefersStatusBarHidden: Bool {return true}
    override var preferredStatusBarStyle : UIStatusBarStyle {
        //return UIStatusBarStyle.lightContent
        return UIStatusBarStyle.default   // Make dark again
    }
    
    //Outlets
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var menuOutlet: UIButton!
    @IBOutlet weak var menuOutlet2: UIButton!
    @IBOutlet var menuItemsOutlets: [UIButton]!
    @IBOutlet var menuItemsOutlet2: [UIButton]!
    
    //Actions
    @IBAction func menuAction(_ sender: UIButton) {
        menuItemsOutlets.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func menuItemsActions(_ sender: UIButton) {
        let printString = sender.titleLabel?.text ?? "BRUH"
        print("HELLO IM HERE BITCH")
        print("HELLO IM HERE BITCH")
        print("HELLO IM HERE BITCH")
        print("HELLO IM HERE BITCH")
        print("HELLO IM HERE BITCH")
        print("HELLO IM HERE BITCH")
        print("HELLO IM HERE BITCH")
        print("HELLO IM HERE BITCH")
        print(printString)
        print(printString)
        print(printString)
        print(printString)
        self.prodSize2 = printString
        let titleString = "   " + self.prodSize2
        menuOutlet.titleLabel?.text = titleString
        menuItemsOutlets.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func menuAction2(_ sender: UIButton) {
        menuItemsOutlet2.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func menuItemsAction(_ sender: UIButton) {
        let printString = sender.titleLabel?.text ?? "No Size"
        print(printString)
        self.work = printString
        let titleString = "   " + (sender.titleLabel?.text)!
        menuOutlet2.titleLabel?.text = titleString
        menuItemsOutlet2.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    //Body
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        //one-time sign-in
        Auth.auth().addStateDidChangeListener({(auth, user) in
            if user != nil {
                //User did login
                print("Inside Browse, Stay!")
                //if(user != nil){
                    //print("DONT MOVE")
                //}
                //let user = AppUser(uid: "", fullname: "", email: "")
                self.currentUser = UserAPI(inputtedUser: self.appUser)
                self.currentUser.loadUser()
                self.name = self.currentUser.getUser().fullname
                print("Current user: ", self.currentUser.getUser().fullname)
                print("Current user: ", self.currentUser.getUser().fullname)
                self.displayName()
                //let UserItem = UserAPI(inputtedUser: user)
                //UserItem.loadUser()
                //print("DID IT: ", UserItem.getUser().fullname)
                //print(userToLoad.getUser().fullname)
            }
            else{
                //User hasn't logged in
                print("Inside Browse, going away")
                self.performSegue(withIdentifier: browse.showWelcome, sender: nil)
            }
        })
    }
    
    @IBAction func cartTapped(_ sender: UIButton) {
        print("IN CART", self.work)
        print("IN CART", self.work)
        print("IN CART", self.work)
        let classicTeeToAdd = ClassicTee(borw: true, inputtedSize: self.work)
        self.currentUser.getUser().modCart(inputtedProduct: classicTeeToAdd)
        let productString = classicTeeToAdd.getName()+"//"+self.work
        self.currentUser.getUser().modOrders(inputtedProductString: productString)
        var newUser = AppUser()
        newUser = self.currentUser.getUser()
        let newAPI = UserAPI(inputtedUser: newUser)
        newAPI.saveUser()
        
        //NOT SAVING ENOUGH DATA!!!!!
        //self.currentUser.saveUser()
        print("User saved to defaults")
        self.PrintCart = newAPI.getUser().getCart()
        print(PrintCart)
        createAlert(title: "Added to cart!", message: "Item successfully added to cart")
    }
    @IBAction func cartTappedWhite(_ sender: UIButton) {
        let classicTeeToAdd = ClassicTee(borw: false, inputtedSize: self.prodSize2)
        self.currentUser.getUser().modCart(inputtedProduct: classicTeeToAdd)
        let productString = classicTeeToAdd.getName()+"//"+self.prodSize2
        self.currentUser.getUser().modOrders(inputtedProductString: productString)
        var newUser = AppUser()
        newUser = self.currentUser.getUser()
        let newAPI = UserAPI(inputtedUser: newUser)
        newAPI.saveUser()
        
        //NOT SAVING ENOUGH DATA!!!!!
        //self.currentUser.saveUser()
        print("User saved to defaults")
        self.PrintCart = newAPI.getUser().getCart()
        print(PrintCart)
        createAlert(title: "Added to cart!", message: "Item successfully added to cart")
    }
    func displayName(){
            var ref:DatabaseReference?
            ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref?.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                //let value = snapshot.value as? NSDictionary
                //let username = value?["fullname"] as? String ?? ""
                //print(username)
                //self.Label.text = username
                let fullNameArr = self.name.components(separatedBy: " ")
                self.firstName = "Welcome " + fullNameArr[0]
                print(self.firstName)
                self.Label.text = self.name
                
                
                // ...
            }) { (error) in
                print(error.localizedDescription)
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("INLOAD")
        
        //let product = self.products?[0]
        //print(product as Any)
        //moltin.product.all { result in
            //switch result {
            //case .success(let response):
                //print(response)
            //case .failure(let error):
                //print(error)
            //}
        //}
        //moltin.product.get(forID: "181718d8-74b7-4290-8c22-0c2c3ec2c7b9") { result in
            //switch result {
            //case .success(let response):
                //print(response)
            //case .failure(let error):
                //print(error)
            //}
        //}
        //Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func logOutTapped(_ sender: UIButton) {
        print("LOGGING OUT RN")
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: browse.showWelcome, sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

