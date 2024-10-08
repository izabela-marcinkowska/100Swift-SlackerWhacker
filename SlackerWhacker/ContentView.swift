//
//  ContentView.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-06.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var myHabits = Habits()
    @State private var name: String = ""
    @State private var description: String = ""
     var body: some View {
         List {
             Section ("Habits") {
                 ForEach(myHabits.habits) { habit in
                     HStack {
                         VStack(alignment: .leading) {
                             Text(habit.name).font(.headline)
                             Text(habit.description)
                         }
                     }
                 }
             }
         }
        Form {
            TextField("Name", text: $name)
            TextField("Description", text: $description)
            Button("Add habit", action: {myHabits.addHabit(name: name, description: description)})
        }
    }
}

#Preview {
    ContentView()
}
