//
//  CoursesTableViewController.swift
//  FacultyApp
//
//  Created by MacLab on 2/19/19.
//  Copyright © 2019 MacLab. All rights reserved.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    var courseResponse = CourseJSONResponse()
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        self.title = "Courses"
        processJSON()
    }
    func processJSON() {
        do {
            if let url = Bundle.main.url(forResource: "CoursesData", withExtension: "json") {
                print("Working")
                let data = try Data(contentsOf: url)
                courseResponse = try decoder.decode(CourseJSONResponse.self, from: data)
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
        return courseResponse.courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        let course = courseResponse.courses[row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = course.shortDesc
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
        let dvc = segue.destination as! CourseDetailViewController
        let indexPath = tableView.indexPathForSelectedRow
        let course = courseResponse.courses[(indexPath?.row)!]
        dvc.course = course
    }
    

}
