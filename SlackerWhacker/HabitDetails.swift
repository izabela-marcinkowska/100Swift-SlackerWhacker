//
//  HabitDetails.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-08.
//

import SwiftUI

struct HabitDetails: View {
    @Binding var habit: Habit
    @Environment(\.dismiss) var dismiss

    var body: some View {
            NavigationStack {
                VStack(alignment: .leading) {
                    Text(habit.description)
                        .padding(.horizontal) // Add horizontal padding to align with the form
                    Form {
                        Text("You have \(habit.streak) streak(s).")
                        Button("I did it today") {
                            habit.markAsDone()
                        }
                        .disabled(isCompletedToday())
                    }
                }
                .navigationTitle(habit.name)
            }
        }
    private func isCompletedToday() -> Bool {
            guard let lastCompletion = habit.lastCompletionDate else {
                return false
            }
            return Calendar.current.isDateInToday(lastCompletion)
        }
}

struct HabitDetails_PreviewWrapper: View {
    @State private var habit = Habit(name: "Shower", description: "Take shower twice a day")
    
    var body: some View {
        HabitDetails(habit: $habit)
    }
}

#Preview {
    HabitDetails_PreviewWrapper()
}
