//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import Foundation


struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(id: UUID(), name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}


extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}


extension DailyScrum {
    
    static let sampleData: [DailyScrum] = [
        .init(title: "Design", attendees: ["Beka", "Aida", "Daph39", "WLOP"], lengthInMinutes: 10, theme: .yellow),
        .init(title: "App Dev", attendees: ["Beka", "Kamilqa", "Gapa", "Danik"], lengthInMinutes: 5, theme: .purple),
        .init(title: "Web Dev", attendees: ["Danat", "Yezik", "Assanali"], lengthInMinutes: 5, theme: .poppy),
    ]
    
}
