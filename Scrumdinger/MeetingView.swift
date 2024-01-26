//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import SwiftUI


struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer: ScrumTimer = .init()
    
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            
            VStack {
                MeetingHeaderView(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaining: scrumTimer.secondsRemaining,
                    theme: scrum.theme
                )
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
