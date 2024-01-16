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
            
            Spacer()
            
            HStack {
                
                Label("\(scrum.atendees.count)", systemImage: "person.3")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                
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
