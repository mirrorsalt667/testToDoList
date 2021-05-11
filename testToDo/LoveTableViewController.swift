//
//  LoveTableViewController.swift
//  testToDo
//
//  Created by 黃肇祺 on 2021/5/6.
//

import UIKit

class LoveTableViewController: UITableViewController, LTableViewCellDelegate {
    
    var number = 0
    
    func lTableViewCell(_ cell: LTableViewCell, didSelect point: CGPoint, checkBool: Bool) {
        
        doingLists = cell.doingLists!
        number = cell.indexP!
        print(number)
        
        doingLists[number].checked = checkBool
        print(checkBool)
        tableView.reloadData()
        
    }
    
    //定義array
    var doingLists:  [doingList] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func unwindToLoveWay(_ unwindSegue: UIStoryboardSegue) {
        if let source = unwindSegue.source as? SecondTableViewController,
           let doingList = source.doingLists {
            if let indexP = tableView.indexPathForSelectedRow {
                doingLists[indexP.row] = doingList
                tableView.reloadRows(at: [indexP], with: .automatic)
            } else {
                doingLists.insert(doingList, at: 0)
                let indexP = IndexPath(row: 0, section: 0)
                tableView.insertRows(at: [indexP], with: .automatic)
            }
            
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doingLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "LoveCell", for: indexPath) as! LTableViewCell
        cell.titleLabel.text = doingLists[indexPath.row].title
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.doingLists = doingLists
        return cell
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SecondTableViewController,
           let row = tableView.indexPathForSelectedRow?.row {
            controller.doingLists = doingLists[row]
        }
    }
}

struct doingList {
    var title = ""
    var checked = false
    }
