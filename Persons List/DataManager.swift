//
//  DataManager.swift
//  Persons List
//
//  Created by Mac mini on 10.06.2021.
//

import Foundation

class DataManager {
    
    var name: String?
    var surname: String?
    var mail: String?
    var number: String?
    
    init(name: String?, surname: String?, mail: String?, number: String) {
        self.name = name
        self.surname = surname
        self.mail = mail
        self.number = number
    }
    
    func insert(){
        //print("add item")
    }
    
    func delete(){
        //print("remove item")
    }
}
