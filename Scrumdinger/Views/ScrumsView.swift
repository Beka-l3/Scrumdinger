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
    
    // MARK: - Private Properties
    
    @State private var isPresentingNewScrumView: Bool = false
    
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
        }
    }
    
}


// MARK: - Preview

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
