//
//  Form.swift
//  SlackerWhacker
//
//  Created by Izabela Marcinkowska on 2024-10-08.
//

import SwiftUI

struct HabitForm: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @ObservedObject var myHabits: Habits
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            
        Form {
            TextField("Name", text: $name)
            TextField("Description", text: $description)
            Button("Add habit", action: {
                myHabits.addHabit(name: name, description: description)
                dismiss()
            })
        }
        .navigationTitle("Add new habit")
        .toolbar {
            Button("Cancel") {
                dismiss()
            }
        }
        .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    HabitForm(myHabits: Habits())
}
