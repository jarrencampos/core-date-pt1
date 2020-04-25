//
//  EntriesTableViewController.swift
//  Journal
//
//  Created by Jarren Campos on 4/22/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryController.entries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as? EntryTableViewCell else { return UITableViewCell() }
        
        let entry = entryController.entries[indexPath.row]
        
        cell.entry = entry
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = entryController.entries[indexPath.row]
            
            entryController.delete(entry: entry)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "AddEntry":
            guard let destinationVC = segue.destination as? CreateEntryViewController else { return }
            
            destinationVC.entryController = entryController
            
        case "ViewEntry":
            guard let destinationVC = segue.destination as? CreateEntryViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            destinationVC.entry = entryController.entries[indexPath.row]
            destinationVC.entryController = entryController
            
        default:
            break
        }
        
    }
    
    let entryController = EntryController()
    
}

