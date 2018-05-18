//
//  CartCell.swift
//  Foreign
//
//  Created by Aditya Bose on 5/4/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var cartItemImage: UIImageView!
    @IBOutlet weak var cartItemTitle: UILabel!
    @IBOutlet weak var cartItemSize: UILabel!
    @IBOutlet weak var cartItemPrice: UILabel!
    
    func setCart(inputtedProduct: Product){
        cartItemImage.image = inputtedProduct.getImage()
        cartItemTitle.text = inputtedProduct.getName()
        print("NAME: ", inputtedProduct.getName())
        print("SIZE: ", inputtedProduct.getSize())
        print("NAME: ", inputtedProduct.getName())
        print("SIZE: ", inputtedProduct.getSize())
        print("NAME: ", inputtedProduct.getName())
        print("SIZE: ", inputtedProduct.getSize())
        cartItemSize.text = inputtedProduct.getSize()
        let stringPrice = String(inputtedProduct.getPrice())
        let fullprice = "$" + stringPrice + ".00"
        print(inputtedProduct.getPrice())
        print(inputtedProduct.getPrice())
        print(inputtedProduct.getPrice())
        print(inputtedProduct.getPrice())
        cartItemPrice.text = fullprice
    }
}
