//
//  UserAPI.swift
//  Foreign
//
//  Created by Aditya Bose on 5/1/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
class UserAPI{
    var user = AppUser(uid: "", fullname: "", email: "")
    var users = [AppUser]()
    //let userDefaults = UserDefaults.standard
    init(inputtedUser: AppUser){
        self.user = inputtedUser
        users.append(self.user)
    }
    init(){
        self.user = AppUser()
        self.users = []
    }
    func saveUser(){
        //let encodeduid = NSKeyedArchiver.archivedData(withRootObject: self.user.uid)
        //let encodedfullname = NSKeyedArchiver.archivedData(withRootObject: self.user.fullname)
        //let encodedemail = NSKeyedArchiver.archivedData(withRootObject: self.user.email)
        //let encodedorders = NSKeyedArchiver.archivedData(withRootObject: self.user.orders)
        //let encodedaddress = NSKeyedArchiver.archivedData(withRootObject: self.user.address)
        //let encodedArray: [NSData] = [encodeduid as NSData, encodedfullname as NSData]
        //userDefaults.set(encodedArray, forKey: "UserItem")
        //userDefaults.synchronize()
        //println("saved")
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: users)
        UserDefaults.standard.set(encodedData, forKey: "users")
    }
    func loadUser(){
        //var UserDataEncoded: [NSData] = userDefaults.object(forKey: "UserItem") as! [NSData]
        //let unpackeduid: String = NSKeyedUnarchiver.unarchiveObject(with: (UserDataEncoded[0] as NSData) as Data) as! String
        //let unpackedfullname: String = NSKeyedUnarchiver.unarchiveObject(with: (UserDataEncoded[1] as NSData) as Data) as! String
        //let unpackedemail: String = NSKeyedUnarchiver.unarchiveObject(with: (UserDataEncoded[2] as NSData) as Data) as! String
        //let unpackedorders: Int = NSKeyedUnarchiver.unarchiveObject(with: (UserDataEncoded[3] as NSData) as Data) as! Int
        //let unpackedaddress: String = NSKeyedUnarchiver.unarchiveObject(with: (UserDataEncoded[4] as NSData) as Data) as! String
        //self.user = User()
        //self.user.uid = unpackeduid
        //self.user.fullname = unpackedfullname
        //self.user.orders = unpackedorders
        //self.user.address = unpackedaddress
        //print(self.user.fullname)
        //print(self.user.email)
        //print(self.user.uid)
        if let data = UserDefaults.standard.data(forKey: "users"), let usersList = NSKeyedUnarchiver.unarchiveObject(with: data) as? [AppUser]{
            if(usersList.isEmpty){
                print("User array is empty.")
            }
            else{
                self.user = usersList[0]
                print(usersList)
            }
        }
    }
    func getUser() -> AppUser{
        return self.user
    }
}
