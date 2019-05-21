//
//  TableViewController.swift
//  InspiringApp
//
//  Created by Jun Kakeno on 5/20/19.
//  Copyright © 2019 Jun Kakeno. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var sequences = [(String,Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sequence"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sequences.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SequenceCell
        
        cell.sequence.text = sequences[indexPath.row].0
        cell.occurance.text = String(sequences[indexPath.row].1)
        
        return cell
    }
}
