//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 16.01.2024.
//

import SwiftUI


struct MeetingView: View {
    var body: some View {
        
        VStack {
            
            ProgressView(value: 5, total: 15)
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text("Seconds elapsed")
                        .font(.caption)
                    
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds remaining")
                        .font(.caption)
                    
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
                
            }
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack {
                
                Text("Speaker 1 of 3")
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                
            }
            
        }
        .padding()
        
    }
}


struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
