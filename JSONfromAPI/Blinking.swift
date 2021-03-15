//
//  Blinking.swift
//  JSONfromAPI
//
//  Created by Tomislav Tomic on 05.02.2021..
//

import SwiftUI

struct Blinking: View {
    
    let results: Songs
    
    init() {
        let url = URL(string: "https://itunes.apple.com/search?term=blink182&limit=5")!
        
        let data = try! Data(contentsOf: url)
        
        let mirko = try! JSONDecoder().decode(Songs.self, from: data)
        
        self.results = mirko
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Songs")) {
                    List {
                        ForEach(0 ..< results.results.count, id: \.self) { kik in
                            Text("\(kik + 1) - \(results.results[kik].trackName)")
                        }
                    }
                }
                Section(header: Text("Albums")) {
                    List {
                        ForEach(0 ..< results.results.count, id: \.self) { kik in
                            Text("\(kik + 1) - \(results.results[kik].collectionName)")
                        }
                    }
                }
            }
        }
    }
}


struct Blinking_Previews: PreviewProvider {
    static var previews: some View {
        Blinking()
    }
}
