//
//  ContentView.swift
//  JSONfromAPI
//
//  Created by Tomislav Tomic on 04.02.2021..
//

import SwiftUI

struct ContentView: View {
    
    @State var user = [User]()
    
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
                Section {
                    List {
                        ForEach(0 ..< user.count, id: \.self) { kek in
                            Text(user[kek].name)
                        }
                    }
                }
                Section {
                    Button("Show") {
                        self.getJSON()
                    }
                }
                Section {
                    NavigationLink(destination: Blinking()) {
                        Text("Go")
                    }
                }
                Section {
                    List {
                        ForEach(0 ..< results.results.count, id: \.self) { kik in
                            HStack {
                                Text(results.results[kik].trackName)
                                Text(results.results[kik].collectionName)
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func getJSON() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("WRONG LINK")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let decodedJSON = try? decoder.decode([User].self, from: data) else {
                return
            }
            
            self.user = decodedJSON
        }.resume()
    }
    
//    func getBlink() {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=blink182&limit=5") else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                return
//            }
//
//            let decoder = JSONDecoder()
//
//            guard let decodedBlink = try? decoder.decode(Songs.self, from: data) else {
//                return
//            }
//
//            self.results = decodedBlink
//        }.resume()
//    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//https://jsonplaceholder.typicode.com/users
//https://itunes.apple.com/search?term=blink182&limit=5
