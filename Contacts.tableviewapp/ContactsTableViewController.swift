//
//  ContactsTableViewController.swift
//  Contacts.tableviewapp
//
//  Created by William H Fulton IV on 6/23/17.
//  Copyright © 2017 IVdev. All rights reserved.
//

import UIKit


//class for TableView that contains contacts

class ContactsTableViewController: UITableViewController {
   
    
    //  Array propery for contacts
    
    var contacts:[Contact] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // UIBarButtonItem class - Creating a edit button to rearrange order of contacts
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(ContactsTableViewController.toggleEdit))
        navigationItem.leftBarButtonItem = moveButton
       
      
        
        //  contacts added to the array of contacts
        
        let jenny = Contact(phoneNumber: "867-5309")
        let rich = Contact(name: "Rich", phoneNumber: "888-888-8888")
        let mindy = Contact(name: "Mindy")
        
        self.contacts.append(jenny)
        self.contacts.append(rich)
        self.contacts.append(mindy)
    }

   
    // allow editing contacts
    
    func toggleEdit() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    



    // MARK: - Table view data source
    
    
    // All contacts will be contained in one section
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    
    //Creates a row for each contact... Uses the count property of the array.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
   
   
    
    //This populates each cell with a contact name..... "cellForRowAt indexPath"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let contact = self.contacts[indexPath.row]
       
        if let name = contact.name {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "no name"
        }
        
        return cell
    }
    
   
   
    // Allows cells to be edited
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
    
    
    
    //Deleting contacts and re-ordering cells
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
           
        }   
    }
    
    // Override to support rearranging the table view.
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let contactMoving = contacts.remove(at: fromIndexPath.row)
        contacts.insert(contactMoving, at: to.row)
        
    }
    
    
    
    
    
    
    
    //getting rid of the delete symbol 'minus symbol'
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle{
        if tableView.isEditing {
            return .none
        } else {
            return .delete
        }
    }
    
    //getting rid of indentation in row
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    // MARK: - Navigation
    
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        let destination = segue.destination as! DetailViewController
        destination.contact = contact
    }
}

















