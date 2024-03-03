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
    
    @State private var errorWrapper: ErrorWrapper?
    @StateObject private var store = ScrumStore()
    
    // MARK: - View Body
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do { try await store.save(scrums: store.scrums) }
                    catch { errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.") }
                }
            }
            .task {
                do { try await store.load() }
                catch { errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.") }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
    
}
