//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 19.01.2024.
//

import SwiftUI


struct ScrumsView: View {
    
    // MARK: - Internal Properties
    
    @Binding var scrums: [DailyScrum]
    let saveAction: () -> Void
    
    // MARK: - Private Properties
    
    @State private var isPresentingNewScrumView: Bool = false
    @Environment(\.scenePhase) private var scenePhase
    
    // MARK: - View Body
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    isPresentingNewScrumView = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(isPresentingNewScrumSheet: $isPresentingNewScrumView, scrums: $scrums)
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
    
}


// MARK: - Preview

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData)) { }
}
