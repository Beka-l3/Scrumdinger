//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import Foundation


struct DailyScrum {
    
    let title: String
    
    let atendees: [String]
    
    let lengthInMinutes: Int
    
    let theme: Theme
    
}


extension DailyScrum {
    
    static let sampleData: [DailyScrum] = [
        .init(title: "Design", atendees: ["Beka, Aida, Daph39, WLOP"], lengthInMinutes: 10, theme: .yellow),
        .init(title: "App Dev", atendees: ["Beka, Kamilqa, Gapa, Danik"], lengthInMinutes: 5, theme: .purple),
        .init(title: "Web Dev", atendees: ["Danat, Yezik, Assanali"], lengthInMinutes: 5, theme: .poppy),
    ]
    
}
