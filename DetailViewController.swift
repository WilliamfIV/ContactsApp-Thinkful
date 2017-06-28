//
//  DetailViewController.swift
//  Contacts.tableviewapp
//
//  Created by William H Fulton IV on 6/27/17.
//  Copyright © 2017 IVdev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    var contact: Contact?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = self.contact {
            if let name = contact.name {
               self.nameLabel.text = name
        }
            if let phoneNumber = contact.phoneNumber {
                self.phoneNumberLabel.text = phoneNumber
        }
    }
}

  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
