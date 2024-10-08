//
//  HabitDetails.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-08.
//

import SwiftUI

struct HabitDetails: View {
    @Binding var habit: Habit
    @EnvironmentObject var myHabits: Habits

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(habit.description)
                    .padding(.horizontal)

                Form {
                    Text("You have \(habit.streak) streak(s).")
                    Button("I did it today") {
                        myHabits.markHabitAsDone(habitId: habit.id)
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
