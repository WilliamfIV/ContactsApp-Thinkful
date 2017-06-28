//
//  ContactsTableViewController.swift
//  Contacts.tableviewapp
//
//  Created by William H Fulton IV on 6/23/17.
//  Copyright © 2017 IVdev. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
   
    var contacts:[Contact] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contacts.append(Contact(name: "Jil", phoneNumber: "7033047095"))
        self.contacts.append(Contact(name: "Jason", phoneNumber: "70403049304"))
        self.contacts.append(Contact(name: "Robby", phoneNumber: "6969696996969"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
   
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
        //Creates a row for each contact... Uses the count PROPERTY of the array.
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let contact = self.contacts[indexPath.row]
        
       
        if let name = contact.name {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "no name"
        }
        
        return cell
        
    // This populates each cell with a contact name..... "cellForRowAt indexPath"
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        let destination = segue.destination as! DetailViewController
        destination.contact = contact
        
    }
}

    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.















