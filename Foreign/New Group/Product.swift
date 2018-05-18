//
//  Product.swift
//  Foreign
//
//  Created by Aditya Bose on 5/3/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import UIKit
class Product: NSObject, NSCoding{
    
    private var productName = "_"
    private var price = 0
    private var itemImage: UIImage
    private var size = "No Size"
    override init(){
        self.productName = ""
        self.price = 0
        self.itemImage = UIImage()
        self.size = ""
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(productName, forKey: "productName")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(itemImage, forKey: "itemImage")
        aCoder.encode(size, forKey: "size")
    }
    required init?(coder aDecoder: NSCoder) {
        self.productName = aDecoder.decodeObject(forKey: "productName") as? String ?? " "
        self.price = aDecoder.decodeObject(forKey: "price") as? Int ?? 0
        self.itemImage = aDecoder.decodeObject(forKey: "itemImage") as? UIImage ?? UIImage()
        self.size = aDecoder.decodeObject(forKey: "size")    as? String ?? " "
    }
    func getName() -> String{
        return self.productName
    }
    func getPrice() -> Int{
        return self.price
    }
    func getSize() -> String{
        return self.size
    }
    func setSize(inputtedSize: String){
        self.size = inputtedSize
    }
    func setPrice(inputtedPrice: Int){
        self.price = inputtedPrice
    }
    func setName(inputtedName: String){
        self.productName = inputtedName
    }
    func getImage() -> UIImage {
        return itemImage
    }
}
