//
//  ContentView.swift
//  iExpense
//
//  Created by albik on 29.07.2021.
//

import SwiftUI

struct SheetEnvairment: View {
    
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
        VStack {
            List {
                ForEach(numbers, id: \.self) {
                    Text("\($0)")
                }.onDelete(perform: removeRows)
            }
            
            Button("Add Number") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
            Button("Show Sheet") {
                self.showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                SecondView(name: "@alvibik")
            }
            
        }.navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct SecondView: View {
    var name: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SheetEnvairment()
    }
}
