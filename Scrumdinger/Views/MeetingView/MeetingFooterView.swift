//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 26.01.2024.
//

import SwiftUI

struct MeetingFooterView: View {
    
    // MARK: - Internal Properties
    
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
    
}

extension MeetingFooterView {
    
    // MARK: - Private Properties
    
    private var isLastSpeaker: Bool { speakers.dropLast().allSatisfy { $0.isCompleted } }
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
}


// MARK: - Preview

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers) { }
        .previewLayout(.sizeThatFits)
}
