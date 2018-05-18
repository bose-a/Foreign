//
//  AppUser.swift
//  Foreign
//
//  Created by Aditya Bose on 5/2/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import Firebase
class AppUser: NSObject, NSCoding{
    var uid = ""
    var fullname = ""
    var email = ""
    var cart: [Product] = []
    var orders: [String] = []
    var shippingAddress = ""
    init(uid: String, fullname: String, email: String){
        self.uid = uid
        self.fullname = fullname
        self.email = email
        self.cart = []
        self.shippingAddress = "No Shipping Address"
        self.orders = ["No Items Ordered"]
    }
    override init(){
        self.uid = ""
        self.fullname = ""
        self.email = ""
    }
    required init?(coder aDecoder: NSCoder) {
        self.uid = aDecoder.decodeObject(forKey: "uid") as? String ?? ""
        self.fullname = aDecoder.decodeObject(forKey: "fullname") as? String ?? ""
        self.email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        self.cart = aDecoder.decodeObject(forKey: "cart") as? [Product] ?? []
        self.shippingAddress = aDecoder.decodeObject(forKey: "shippingAddress") as? String ?? ""
        self.orders = aDecoder.decodeObject(forKey: "orders") as? Array ?? []
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(fullname, forKey: "fullname")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(cart, forKey: "cart")
        aCoder.encode(shippingAddress, forKey: "shippingAddress")
        aCoder.encode(orders, forKey: "orders")
    }
    func save(){
        let ref = DatabaseReferenceFile.users(uid: uid).reference()
        ref.setValue(toDictionary())
        print("User saved to firebase")
    }
    func getCart() -> Array<Product>{
        return cart
    }
    func modCart(inputtedProduct: Product){
        self.cart.append(inputtedProduct)
    }
    func modOrders(inputtedProductString: String){
        self.orders.append(inputtedProductString)
    }
    func setAddress(inputtedAddress: String){
        self.shippingAddress = inputtedAddress
    }
    func removeFromCart(inputtedIndex: Int){
        self.cart.remove(at: inputtedIndex)
    }
    func removeFromOrders(inputtedIndex: Int){
        self.orders.remove(at: inputtedIndex)
    }
    func getUID() -> String{
        return self.uid
    }
    func toDictionary() -> [String: Any]{
        return[
            "uid" : uid,
            "fullname" : fullname,
            "email" : email,
            //"cart" : cart,
            "shippingAddress" : shippingAddress,
            "orders" : orders
        ]
    }
}
