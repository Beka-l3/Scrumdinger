//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 19.01.2024.
//

import SwiftUI


struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView: Bool = false
    
    
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


#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
