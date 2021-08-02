//
//  UserDefaults.swift
//  iExpense
//
//  Created by albik on 29.07.2021.
//

import SwiftUI

struct UserDef: View {
    
    struct User: Codable {
        var firstName: String
        var lastName: String
    }
    
    @State private var tapCount =
        UserDefaults.standard.integer(forKey: "Tap")
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                self.tapCount += 1
                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                
            }.padding()
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
    }
}

struct UserDefault_Previews: PreviewProvider {
    static var previews: some View {
        UserDef()
    }
}

