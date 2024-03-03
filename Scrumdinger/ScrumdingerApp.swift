//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import SwiftUI


@main
struct ScrumdingerApp: App {
    
    // MARK: - Private Properties
    
    @State private var scrums = DailyScrum.sampleData
    
    // MARK: - View Body
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
    
}
