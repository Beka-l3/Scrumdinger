//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 26.01.2024.
//

import SwiftUI


struct NewScrumSheet: View {
    
    @Binding var isPresentingNewScrumSheet: Bool
    @Binding var scrums: [DailyScrum]
    
    @State private var newScrum: DailyScrum = .emptyScrum
    
    
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


#Preview {
    NewScrumSheet(isPresentingNewScrumSheet: .constant(true), scrums: .constant(DailyScrum.sampleData))
}
