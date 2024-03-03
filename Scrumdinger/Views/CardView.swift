//
//  CardView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import SwiftUI


struct CardView: View {
    
    // MARK: - Internal Properties
    
    let scrum: DailyScrum
    
    // MARK: - View Body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.triangleIcon)
            }
            .font(.caption)
        }
        .frame(height: 60)
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
    
}


// MARK: - Preview

fileprivate let scrum = DailyScrum.sampleData.randomElement()!

#Preview {
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
}
