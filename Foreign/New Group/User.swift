//
//  User.swift
//  Foreign
//
//  Created by Aditya Bose on 4/24/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//
import Foundation
import Firebase
class User{
    var uid: String
    var fullname: String
    var email: String
    //var orders: Int
    //var address: String
    init(uid: String, fullname: String, email: String){
        self.uid = uid
        self.fullname = fullname
        self.email = email
        //self.orders = 0
        //self.address = "No Address"
    }
    //Default Constructor
    init(){
        self.uid = "_"
        self.fullname = "_"
        self.email = "_"
        //self.orders = 0
        //self.address = "_"
    }
    init(coder aDecoder: NSCoder!) {
        self.uid = aDecoder.decodeObject(forKey: "uid") as! String
        self.fullname = aDecoder.decodeObject(forKey: "fullname") as! String
        self.email = aDecoder.decodeObject(forKey: "email") as! String
        //self.orders = aDecoder.decodeObject(forKey: "Orders") as! Int
        //self.address = aDecoder.decodeObject(forKey: "Address") as! String
    }
    
    func initWithCoder(aDecoder: NSCoder) -> User {
        self.uid = aDecoder.decodeObject(forKey: "uid") as! String
        self.fullname = aDecoder.decodeObject(forKey: "fullname") as! String
        self.email = aDecoder.decodeObject(forKey: "email") as! String
        //self.orders = aDecoder.decodeObject(forKey: "orders") as! Int
        //self.address = aDecoder.decodeObject(forKey: "address") as! String
        return self
    }
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(fullname, forKey: "fullname")
        aCoder.encode(email, forKey: "email")
        //aCoder.encode(orders, forKey: "orders")
        //aCoder.encode(address, forKey: "address")
    }
    func save(){
        let ref = DatabaseReferenceFile.users(uid: uid).reference()
        ref.setValue(toDictionary())
        print("User saved to firebase")
    }
    //func getName() -> String{
        //return self.fullname
    //}
    //func addOrders(number: Int){
        //self.orders = self.orders+number
    //}
    //func getOrders() -> Int{
        //return self.orders
    //}
    //func getAddress() -> String{
        //return self.address
    //}
    //func setAddress(inputAddress: String){
        //self.address = inputAddress
    //}
    func toDictionary() -> [String: Any]{
       return[
        "uid" : uid,
        "fullname" : fullname,
        "email" : email
        //"address" : address
        //"orders" : orders
        ]
    }
}
