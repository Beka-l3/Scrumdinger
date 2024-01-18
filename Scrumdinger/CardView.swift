//
//  CardView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import SwiftUI


struct CardView: View {
    
    let scrum: DailyScrum
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            
            HStack {
                
                Label("\(scrum.atendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.atendees.count) attendees")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.triangleIcon)
//                    .padding(.trailing, 20)
                
            }
            .font(.caption)
            
        }
        .frame(height: 60)
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .background(scrum.theme.mainColor)
        
    }
    
}



struct CardView_Previews: PreviewProvider {
    
    static var scrum = DailyScrum.sampleData.randomElement()!
    
    static var previews: some View {
        CardView(scrum: scrum)
    }
    
}
