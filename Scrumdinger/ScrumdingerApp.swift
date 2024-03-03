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
    
    @StateObject private var store = ScrumStore()
    
    // MARK: - View Body
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do { try await store.save(scrums: store.scrums) }
                    catch { fatalError(error.localizedDescription) }
                }
            }
            .task {
                do { try await store.load() }
                catch { fatalError(error.localizedDescription) }
            }
        }
    }
    
}
