//
//  Habit.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-07.
//

import Foundation

struct Habit: Identifiable {
    let name: String
    let description: String
    let id = UUID()
}

class Habits {
    let habits: [Habit]
    init() {
        self.habits = [
            Habit(name: "Shower", description: "Take shower everyday"),
            Habit(name: "Exercise", description: "Exercise 4 times a week")
        ]
    }
}
