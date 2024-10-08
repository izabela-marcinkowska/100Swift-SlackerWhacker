//
//  HabitDetails.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-08.
//

import SwiftUI

struct HabitDetails: View {
    @ObservedObject var habit : Habit
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
                Text(habit.description)
            }
            .navigationTitle(habit.name)
//            .toolbar {
//                Button("Cancel") {
//                    dismiss()
//                }
//            }
        }
    }
}

#Preview {
    HabitDetails(habit: Habit(name: "Shower", description: "Take shower twice a day"))
}
