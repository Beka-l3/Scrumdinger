//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import SwiftUI


@main
struct ScrumdingerApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            ScrumsView(scrums: DailyScrum.sampleData)
            
        }
        
    }
    
}
