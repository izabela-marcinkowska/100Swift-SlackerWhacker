//
//  Habit.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-07.
//

import Foundation

class Habit: Identifiable, ObservableObject, Hashable {
    @Published var name: String
    @Published var description: String
    let id = UUID()
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    static func == (lhs: Habit, rhs: Habit) -> Bool {
           lhs.id == rhs.id
       }

       func hash(into hasher: inout Hasher) {
           hasher.combine(id)
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
}
