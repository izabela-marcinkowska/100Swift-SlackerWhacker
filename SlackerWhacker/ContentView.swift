//
//  ContentView.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-06.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var myHabits = Habits()
    
     var body: some View {
         NavigationStack {
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
             .navigationTitle("SlackerWhacker")
             .toolbar {
                 NavigationLink("Add habit") {
                     HabitForm(myHabits: myHabits)
                 }
             }
         }
         
    }
}

#Preview {
    ContentView()
}
