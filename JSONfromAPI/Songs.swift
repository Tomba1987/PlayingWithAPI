//
//  Songs.swift
//  JSONfromAPI
//
//  Created by Tomislav Tomic on 04.02.2021..
//

import Foundation

struct Songs: Decodable, Identifiable {
    struct Song: Decodable {
        var trackName: String
        var collectionName: String
    }
    
    var id = UUID()
    var results: [Song]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([Song].self, forKey: .results)
    }
}
