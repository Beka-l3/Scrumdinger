//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 07.03.2024.
//

import SwiftUI

struct HistoryView: View {

    // MARK: - Internal Properties

    let history: History

    // MARK: - View Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, content: {
                Divider()
                    .padding(.bottom)

                Text("Attendees")
                    .font(.headline)

                Text(history.attendeeString)

                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)

                    Text(transcript)
                }
            })
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}


// MARK: - Extension

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}


// MARK: - Preview

fileprivate let history: History = .init(
    attendees: [
        DailyScrum.Attendee(name: "Beka"),
        DailyScrum.Attendee(name: "Aida"),
        DailyScrum.Attendee(name: "WLOP"),
    ],
    transcript: "Beka, would you like to start today? Sure, yesterday I reviewed Aida's PR and met with the design team to finalize the UI..."
)

#Preview {
    HistoryView(history: history)
}
