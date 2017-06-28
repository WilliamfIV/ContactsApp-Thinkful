//
//  Contact.swift
//  Contacts.tableviewapp
//
//  Created by William H Fulton IV on 6/23/17.
//  Copyright © 2017 IVdev. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name: String?
    var phoneNumber: String?
    
    init(name: String? = nil, phoneNumber: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        super.init()
    }
}



//   Since the properties are optionals, your are NOT REQUIRED to have and initializer function...
