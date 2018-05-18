//
//  CartScreen.swift
//  Foreign
//
//  Created by Aditya Bose on 5/4/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import UIKit
class CartScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var cartItems: [Product] = []
    let currentUser = UserAPI()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalprice: UILabel!
    var comTotal = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.comTotal = 0
        self.currentUser.loadUser()
        UserDefaults.standard.synchronize()
        print("user is, ", currentUser.getUser().fullname)
        print("user is, ", currentUser.getUser().fullname)
        print("user is, ", currentUser.getUser().fullname)
        print("user is, ", currentUser.getUser().fullname)
        cartItems = currentUser.getUser().getCart()
        for cartItem in cartItems {
            self.comTotal += cartItem.getPrice()
        }
        totalprice.text = "$" + String(self.comTotal) + ".00"
        print(cartItems)
        print(cartItems)
        print(cartItems)
        print(cartItems)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.cartItems.count)
        print(self.cartItems.count)
        print(self.cartItems.count)
        print(self.cartItems.count)
        return self.cartItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productInTable = cartItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
        cell.setCart(inputtedProduct: productInTable)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            cartItems.remove(at: indexPath.row)
            self.currentUser.getUser().removeFromCart(inputtedIndex: indexPath.row)
            self.currentUser.getUser().removeFromOrders(inputtedIndex: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            var newUser = AppUser()
            newUser = self.currentUser.getUser()
            let newAPI = UserAPI(inputtedUser: newUser)
            newAPI.saveUser()
            self.comTotal = 0
            for cartItem in cartItems {
                self.comTotal += cartItem.getPrice()
            }
            totalprice.text = "$" + String(self.comTotal) + ".00"
        }
    }
    
}
//extension CartScreen: UITableViewDataSource, UITableViewDelegate{
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.cartItems.count
    //}
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let productInTable = cartItems[indexPath.row]
        //let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
        //cell.setCart(inputtedProduct: productInTable)
        //return cell
    //}
    
    
//}
