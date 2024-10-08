//
//  Habit.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-07.
//

import Foundation
import SwiftUI

struct Habit: Identifiable, Hashable, Codable {
    var name: String
    var description: String
    var streak: Int = 0
    var lastCompletionDate: Date? = nil
    var id: UUID = UUID()
    
    mutating func markAsDone() {
        streak += 1
        lastCompletionDate = Date()
    }
}

class Habits: ObservableObject {
    @Published var habits: [Habit] = []

    @AppStorage("habitsData") private var habitsData: Data = Data()

    init() {
        if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: habitsData), !habitsData.isEmpty {
            self.habits = decodedHabits
        } else {
            self.habits = [
                Habit(name: "Shower", description: "Take a shower everyday"),
                Habit(name: "Exercise", description: "Exercise 4 times a week")
            ]
        }
    }

    func addHabit(name: String, description: String) {
        habits.append(Habit(name: name, description: description))
        saveHabits()
    }

    func removeHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
        saveHabits()
    }

    func markHabitAsDone(habitId: UUID) {
        if let index = habits.firstIndex(where: { $0.id == habitId }) {
            habits[index].markAsDone()
            saveHabits()
        }
    }

    private func saveHabits() {
        if let encoded = try? JSONEncoder().encode(habits) {
            habitsData = encoded
        } else {
            print("Failed to encode habits")
        }
    }
}
