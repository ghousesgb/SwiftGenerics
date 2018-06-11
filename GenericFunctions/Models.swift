//
//  Models.swift
//  GenericFunctions
//
//  Created by Ghouse Basha Shaik on 10/06/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation

struct HomeFeedsVideos: Decodable {
    let videos: [Video]
}

struct Video: Decodable {
    let name: String
    let link: String
    let numberOfViews: Int
}

struct CourseDetails : Decodable {
    let name: String
    let duration: String
}

struct Courses: Decodable {
    let name: String
    let numberOfLessions: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case numberOfLessions = "number_of_lessons"
    }
    
}
