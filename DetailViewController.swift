//
//  DetailViewController.swift
//  Contacts.tableviewapp
//
//  Created by William H Fulton IV on 6/27/17.
//  Copyright © 2017 IVdev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
//A text field calls the methods of its delegate in response to important changes... UITextFieldDelegate must be added as a SuperClass

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.phoneNumberTextField.delegate = self
        
        if let contact = self.contact {
            if let name = contact.name {
               self.nameTextField.text = name
        }
            if let phoneNumber = contact.phoneNumber {
                self.phoneNumberTextField.text = phoneNumber
        }
    }
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



// when a user is done typing in a text field, the text is assignent to the 'contact' object
//the code in the func checks if the text is name or phone number and save it to the appropriate property
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.nameTextField {
            self.contact?.name = textField.text
        } else if textField == self.phoneNumberTextField {
            self.contact?.phoneNumber = textField.text
        }
    }
    
    

}
