//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 19.01.2024.
//

import SwiftUI

struct DetailEditView: View {
    
    // MARK: - Internal Properties
    
    @Binding var scrum: DailyScrum
    
    // MARK: - Private Properties
    
    @State private var newAttendeeName: String = ""
    
    // MARK: - View Body
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
                
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                
                ThemePickerView(selection: $scrum.theme)
            }
            
            Section {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    
                    Button {
                        withAnimation {
                            scrum.attendees.append(DailyScrum.Attendee(name: newAttendeeName))
                            newAttendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
                
            } header: {
                Text("Attendees")
            }
        }
    }
    
}


// MARK: - Preview

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
