//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 26.01.2024.
//

import SwiftUI



struct MeetingHeaderView: View {
    
    // MARK: - Internal Properties
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds elapsed")
                        .font(.caption)
                    
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds remaining")
                        .font(.caption)
                    
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.triangleIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
    
}


extension MeetingHeaderView {
    
    // MARK: - Private Properties
    
    private var totalSeconds: Int { secondsElapsed + secondsRemaining }
    private var minutesRemaining: Int { secondsRemaining / 60 }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
}


// MARK: - Preview

#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum)
        .previewLayout(.sizeThatFits)
}
