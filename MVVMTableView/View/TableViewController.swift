//
//  TableViewController.swift
//  MVVMTableView
//
//  Created by Vasilii on 15.10.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //var profiles:[Profile]!
    private var viewModel: TableViewViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
/*
        profiles = [
            Profile(name: "Nessy", secondname: "Masdam", age: 17),
            Profile(name: "Alber", secondname: "Pastushov", age: 34),
            Profile(name: "John", secondname: "Smith", age: 12),
        ]
        */
        viewModel = ViewModel()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell

        guard let tableViewCell = cell,
        let viewModel = viewModel  else { return UITableViewCell() }
        
        // получаем значения
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        // передаем по VM ячейки и срабатывает блок willSet 
        tableViewCell.viewModel = cellViewModel
        
//        let pofile = viewModel.profiles[indexPath.row]
//        tableViewCell.ageLabel.text = "\(pofile.age)"
//        tableViewCell.fullnameLabel.text = "\(pofile.name) " + "\(pofile.secondname)"

        return tableViewCell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectedRow(atIndexPath: indexPath)
        
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifire = segue.identifier, let viewModel = viewModel else { return }
        
        if identifire == "detailSegue" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.viewModel = viewModel.viewModelForSelectedRow()
            }
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    
    

}
