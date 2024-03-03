//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 26.01.2024.
//

import SwiftUI


struct NewScrumSheet: View {
    
    // MARK: - Internal Properties
    
    @Binding var isPresentingNewScrumSheet: Bool
    @Binding var scrums: [DailyScrum]
    
    // MARK: - Private Properties
    
    @State private var newScrum: DailyScrum = .emptyScrum
    
    // MARK: - View Body
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewScrumSheet = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumSheet = false
                        }
                    }
                }
        }
    }
    
}


// MARK: - Preview

#Preview {
    NewScrumSheet(isPresentingNewScrumSheet: .constant(true), scrums: .constant(DailyScrum.sampleData))
}
