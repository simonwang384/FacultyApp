//
//  FacultyTableViewController.swift
//  FacultyApp
//
//  Created by MacLab on 2/19/19.
//  Copyright © 2019 MacLab. All rights reserved.
//

import UIKit

class FacultyTableViewController: UITableViewController {
    
    var facultyResponse = FacultyJSONResponse()
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Faculties"
        processJSON()
    }
    
    func processJSON() {
        do {
            if let url = Bundle.main.url(forResource: "FacultyData", withExtension: "json") {
                print("Working")
                let data = try Data(contentsOf: url)
                facultyResponse = try decoder.decode(FacultyJSONResponse.self, from: data)
            }
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return facultyResponse.faculty.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacultyCell", for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        let faculty = facultyResponse.faculty[row]
        cell.textLabel?.text = faculty.firstName + " " + faculty.lastName
        cell.detailTextLabel?.text = faculty.category
        cell.imageView?.image = UIImage(named: faculty.userName.lowercased())
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! FacultyDetailViewController
        let indexPath = tableView.indexPathForSelectedRow
        let faculty = facultyResponse.faculty[(indexPath?.row)!]
        dvc.faculty = faculty
    }
    

}
