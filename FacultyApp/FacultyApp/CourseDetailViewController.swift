//
//  CourseDetailViewController.swift
//  FacultyApp
//
//  Created by MacLab on 2/19/19.
//  Copyright © 2019 MacLab. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    var course:Course?
    
    @IBOutlet weak var courseLongDescLabel: UILabel!
    @IBOutlet weak var courseShortDescLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let c = course {
            courseNameLabel.text = c.name
            courseShortDescLabel.text = c.shortDesc
            courseLongDescLabel.text = c.longDesc
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
