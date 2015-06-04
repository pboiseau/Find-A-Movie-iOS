//: Playground - noun: a place where people can play

import UIKit

class Category {
    
    var id: Int
    var name: String
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
}


var categories: [Category] = [Category]()

categories.append(Category(id: 1, name: "Toto"))
categories.append(Category(id: 2, name: "Totoazeeaez"))
categories.append(Category(id: 3, name: "Toeaeazeazto"))
categories.append(Category(id: 4, name: "zeaeaze"))


println(categories[3].id)