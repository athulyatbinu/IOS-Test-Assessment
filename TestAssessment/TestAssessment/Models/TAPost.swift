//
//  TAPost.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 29/05/24.
//

import Foundation

struct TAPost: Codable {

var userId : Int?    = nil
var id     : Int?    = nil
var title  : String? = nil
var body   : String? = nil

enum CodingKeys: String, CodingKey {
    
    case userId = "userId"
    case id     = "id"
    case title  = "title"
    case body   = "body"
    
}

init() {
    }
}
