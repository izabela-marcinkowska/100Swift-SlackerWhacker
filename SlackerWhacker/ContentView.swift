//
//  ContentView.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-06.
//

import SwiftUI

struct ContentView: View {
    let myHabits = Habits()
    var body: some View {
        ForEach(myHabits.habits) { habit in
            Text(habit.name)
            Text(habit.description)
        }
    }
}

#Preview {
    ContentView()
}
