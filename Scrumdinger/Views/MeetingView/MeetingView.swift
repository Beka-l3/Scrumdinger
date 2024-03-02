//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import SwiftUI
import AVFoundation


struct MeetingView: View {
    
    // MARK: - Internal Methods
    
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer: ScrumTimer = .init()
    
    // MARK: - Private Properties
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    // MARK: - View Body
    
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
        .onAppear { startScrum() }
        .onDisappear { endScrum() }
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    // MARK: - Private Methods
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        scrumTimer.startScrum()
    }
    
    private func endScrum() {
        scrumTimer.stopScrum()
        let newHistory = History(attendee: scrum.attendees)
        scrum.history.insert(newHistory, at: .zero)
    }
}


#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
