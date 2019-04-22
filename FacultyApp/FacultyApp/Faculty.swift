//
//  Faculty.swift
//  FacultyApp
//
//  Created by MacLab on 2/19/19.
//  Copyright © 2019 MacLab. All rights reserved.
//

import UIKit

class Faculty: Decodable {
    var category:String
    var userName:String
    var middleName:String
    var degree:String
    var firstName:String
    var lastName:String
    var title:String
    var bio:String
    
    
    init() {
        self.category = ""
        self.userName = ""
        self.middleName = ""
        self.degree = ""
        self.firstName = ""
        self.lastName = ""
        self.title = ""
        self.bio = ""
    }

    init(category:String, userName:String, middleName:String, degree:String, firstName:String, lastName:String, title:String, bio:String) {
        self.category = category
        self.userName = userName
        self.middleName = middleName
        self.degree = degree
        self.firstName = firstName
        self.lastName = lastName
        self.title = title
        self.bio = bio
    }

}

class FacultyJSONResponse : Decodable {
    var faculty: [Faculty]
    
    init() {
        faculty = [Faculty]()
    }
}
