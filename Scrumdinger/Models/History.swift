//
//  History.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 02.03.2024.
//

import Foundation

struct History: Identifiable, Codable {
    
    // MARK: - Internal Properties
    
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var transcript: String?
    
    // MARK: - Initializer
    
    init(id: UUID = .init(), date: Date = .init(), attendees: [DailyScrum.Attendee], transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.transcript = transcript
    }
}
