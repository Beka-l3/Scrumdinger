//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 19.01.2024.
//

import SwiftUI


struct DetailView: View {
    
    let scrum: DailyScrum
    
    
    var body: some View {
        
        List {
            
            Section {
                Label(scrum.title, systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                    
                }
                .accessibilityElement(children: .combine)
                
            } header: {
                Text("Scrum Info")
            }
            
            
            Section {
                
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
                
            } header: {
                Text("Attendees")
            }
            
        }
        
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            
            DetailView(scrum: DailyScrum.sampleData[0])
            
        }
    }
}
