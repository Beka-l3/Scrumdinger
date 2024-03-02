//
//  History.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 02.03.2024.
//

import Foundation

struct History: Identifiable {
    
    // MARK: - Internal Properties
    
    let id: UUID
    let date: Date
    let attendee: [DailyScrum.Attendee]
    
    // MARK: - Initializer
    
    init(id: UUID = .init(), date: Date = .init(), attendee: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendee = attendee
    }
}
