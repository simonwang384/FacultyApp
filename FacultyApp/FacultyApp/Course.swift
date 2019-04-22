//
//  Course.swift
//  FacultyApp
//
//  Created by MacLab on 2/19/19.
//  Copyright © 2019 MacLab. All rights reserved.
//

import UIKit

class Course: Decodable {
    var name:String
    var shortDesc:String
    var longDesc:String
    
    init() {
        self.name = ""
        self.shortDesc = ""
        self.longDesc = ""
    }
    
    init(name:String, shortDesc:String, longDesc:String) {
        self.name = name
        self.shortDesc = shortDesc
        self.longDesc = longDesc
    }
}


class CourseJSONResponse:Decodable {
    var courses: [Course]
    
    init() {
        courses = [Course]()
    }
}
