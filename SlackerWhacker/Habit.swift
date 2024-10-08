//
//  Habit.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-07.
//

import Foundation

struct Habit: Identifiable, Hashable {
    var name: String
    var description: String
    var streak: Int = 0
    var lastCompletionDate: Date? = nil
    let id = UUID()
    
    mutating func markAsDone() {
        streak += 1
        lastCompletionDate = Date()
    }
}


class Habits: ObservableObject {
    @Published var habits: [Habit]
    init() {
        self.habits = [
            Habit(name: "Shower", description: "Take shower everyday"),
            Habit(name: "Exercise", description: "Exercise 4 times a week")
        ]
    }
    func addHabit(name: String, description: String)
    {
        habits.append(Habit(name: name, description: description))
    }
    
    func updateHabit() {
            objectWillChange.send()  // Notify SwiftUI that something inside the list has changed
        }
}
