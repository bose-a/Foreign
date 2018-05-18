//
//  Checkout.swift
//  Foreign
//
//  Created by Aditya Bose on 5/8/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import UIKit
import Firebase
class Checkout: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func shippingUpdateTapped(_ sender: UIButton) {
        if(addressField.text != nil || addressField.text != "" || addressField.text != " "){
            updateAddress()
            print("UPdated ADDRESS")
            print("UPdated ADDRESS")
            print("UPdated ADDRESS")
            print("UPdated ADDRESS")
            print("UPdated ADDRESS")
            print("UPdated ADDRESS")
        }
        else{
            print("Nothing entered in text field")
            print("Nothing entered in text field")
            print("Nothing entered in text field")
            print("Nothing entered in text field")
            print("Nothing entered in text field")
        }
    }
    func updateAddress(){
        var ref:DatabaseReference?
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref?.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let updatedShippingAddress = self.addressField.text
            let cleanUser = AppUser()
            let currentUser = UserAPI(inputtedUser: cleanUser)
            currentUser.loadUser()
            let userID = Auth.auth().currentUser?.uid
            currentUser.getUser().setAddress(inputtedAddress: self.addressField.text ?? "Still no address")
            ref?.child("users").child(userID!).updateChildValues(["shippingAddress": (updatedShippingAddress ?? "Still no address")])
            var newUser = AppUser()
            newUser = currentUser.getUser()
            let newAPI = UserAPI(inputtedUser: newUser)
            newAPI.saveUser()
            self.createAlert(title: "Address Updated in Firebase!", message: "Good work")
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    @IBAction func updateFirCart(_ sender: UIButton) {
        var ref:DatabaseReference?
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref?.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let cleanUser = AppUser()
            let currentUser = UserAPI(inputtedUser: cleanUser)
            currentUser.loadUser()
            let updatedOrders = currentUser.getUser().orders
            let userID = Auth.auth().currentUser?.uid
            currentUser.getUser().setAddress(inputtedAddress: self.addressField.text ?? "Still no address")
            ref?.child("users").child(userID!).updateChildValues(["orders": (updatedOrders)])
            var newUser = AppUser()
            newUser = currentUser.getUser()
            let newAPI = UserAPI(inputtedUser: newUser)
            newAPI.saveUser()
            self.createAlert(title: "Updated Orders in Firebase!", message: "Good Work")
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
