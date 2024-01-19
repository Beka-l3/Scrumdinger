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
        
        ZStack {
            
            scrum.theme.mainColor
                .ignoresSafeArea()
            
            Text(scrum.title)
                .font(.title)
                .foregroundColor(scrum.theme.accentColor)
            
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
