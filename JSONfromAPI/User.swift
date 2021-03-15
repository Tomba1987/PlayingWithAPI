//
//  User.swift
//  JSONfromAPI
//
//  Created by Tomislav Tomic on 04.02.2021..
//

import Foundation

struct User: Decodable {
    var name: String
    var username: String
    
    enum CodingKeys: String, CodingKey {
        case name, username
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        username = try container.decode(String.self, forKey: .username)
    }
}
