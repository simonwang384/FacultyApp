//
//  FacultyDetailViewController.swift
//  FacultyApp
//
//  Created by MacLab on 2/19/19.
//  Copyright © 2019 MacLab. All rights reserved.
//

import UIKit

class FacultyDetailViewController: UIViewController {
    
    @IBOutlet weak var facultyImageView: UIImageView!
    var faculty:Faculty?
    
    @IBOutlet weak var facultyBioLabel: UILabel!
    @IBOutlet weak var facultyNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let f = faculty {
            facultyNameLabel.text = f.firstName + " " + f.lastName
            facultyBioLabel.text = f.bio
            facultyImageView?.image = UIImage(named: f.userName.lowercased())
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! FacultyWebViewController
        dvc.userName = faculty?.userName
    }
    

}
