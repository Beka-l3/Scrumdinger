//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 19.01.2024.
//

import SwiftUI

struct DetailEditView: View {
    
    @State private var scrum: DailyScrum = .emptyScrum
    
    
    var body: some View {
        
        Form {
            
            Section {
                
                TextField("Title", text: $scrum.title)
                
                HStack {
                    
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                    
                }
                
            }
            
        }
        
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
