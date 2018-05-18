//
//  ClassicTee.swift
//  Foreign
//
//  Created by Aditya Bose on 5/3/18.
//  Copyright © 2018 Aditya Bose. All rights reserved.
//

import Foundation
import UIKit
class ClassicTee: Product{
    private var productName = ""
    private var price = 0
    private var bw: Bool
    private var itemImage: UIImage
    private var size = ""
    init(borw: Bool, inputtedSize: String){
        self.productName = "Classic Tee"
        self.price = 20
        self.size = inputtedSize
        if(borw == true){
            self.bw = true
            self.itemImage = UIImage(named: "clteeB") ?? UIImage()
            let addedColor = "Noir"
            let fullProductName = self.productName + " " + addedColor
            self.productName = fullProductName
        }
        else{
            self.bw = false
            self.itemImage = UIImage(named: "clteeW") ?? UIImage()
            let addedColor = "Blanc"
            let fullProductName = self.productName + " " + addedColor
            self.productName = fullProductName
        }
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        self.productName = aDecoder.decodeObject(forKey: "productName") as? String ?? " "
        self.price = aDecoder.decodeObject(forKey: "price") as? Int ?? 20
        self.itemImage = aDecoder.decodeObject(forKey: "itemImage") as? UIImage ?? UIImage()
        self.size = aDecoder.decodeObject(forKey: "size")    as? String ?? " "
        self.bw = aDecoder.decodeObject(forKey: "bw") as? Bool ?? false
        super.init()
    }
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.productName, forKey: "productName")
        aCoder.encode(self.price, forKey: "price")
        aCoder.encode(self.itemImage, forKey: "itemImage")
        aCoder.encode(self.size, forKey: "size")
        aCoder.encode(self.bw, forKey: "bw")
    }
    override func getPrice() -> Int {
        return 20
    }
    override func getName() -> String {
        return self.productName
    }
    override func getSize() -> String {
        return self.size
    }
    //override func setPrice(inputtedPrice: Int) {
        //self.price = inputtedPrice
    //}
    //override func setName(inputtedName: String) {
        //self.productName = inputtedName
    //}
    override func getImage() -> UIImage {
        return itemImage
    }
    func getBW() -> String{
        if(bw == true){
            return("black")
        }
        else{
            return("white")
        }
    }
}
