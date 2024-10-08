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
                Section("Habits") {
                    ForEach($myHabits.habits) { $habit in
                        NavigationLink(destination: HabitDetails(habit: $habit)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habit.name).font(.headline)
                                    Text(habit.description)
                                }
                                Spacer()
                                Text("\(habit.streak)")
                            }
                        }
                    }.onDelete(perform: removeHabit)
                }
            }
            .navigationTitle("SlackerWhacker")
            .toolbar {
                NavigationLink("Add habit") {
                    HabitForm(myHabits: myHabits)
                }
            }
        }
        .environmentObject(myHabits)
    }
    func removeHabit(offset: IndexSet) {
        myHabits.habits.remove(atOffsets: offset)
    }
}


#Preview {
    ContentView()
        .environmentObject(Habits())  // Provide a mock instance for preview
}
