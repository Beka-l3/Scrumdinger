//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 04.03.2024.
//

import SwiftUI

struct MeetingTimerView: View {
    
    // MARK: - Internal Properties
    
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    // MARK: - Private Properties
    
    private var currentSpeaker: String { speakers.first { !$0.isCompleted }?.name ?? "Someone" }
    
    // MARK: - View Body
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if
                        speaker.isCompleted,
                        let index = speakers.firstIndex(where: { $0.id == speaker.id })
                    {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(.init(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
    
}


// MARK: - Preview

fileprivate let mockSpeakers: [ScrumTimer.Speaker] = [
    ScrumTimer.Speaker(name: "Beka", isCompleted: true),
    ScrumTimer.Speaker(name: "Kamil", isCompleted: false),
    ScrumTimer.Speaker(name: "Zhandos", isCompleted: false),
]

#Preview {
    MeetingTimerView(speakers: mockSpeakers, theme: .yellow)
}
