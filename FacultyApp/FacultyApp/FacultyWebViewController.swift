//
//  FacultyWebViewController.swift
//  FacultyApp
//
//  Created by MacLab on 2/19/19.
//  Copyright © 2019 MacLab. All rights reserved.
//

import UIKit
import WebKit
class FacultyWebViewController: UIViewController {
    
    var userName:String?
    
    @IBOutlet weak var websiteView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "https://www.nova.edu/~" + userName!
        
        if let url = URL(string: str) {
            let request = URLRequest(url: url)
            websiteView.load(request)
        }
        
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
