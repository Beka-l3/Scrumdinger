//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 04.03.2024.
//

import SwiftUI

struct SpeakerArc: Shape {
    
    // MARK: - Internal Properties
    
    let speakerIndex: Int
    let totalSpeakers: Int
    
    // MARK: - Private Properties
    
    private var degreesPerSpeaker: Double { 360.0 / Double(totalSpeakers) }
    private var startAngle: Angle { Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0) }
    private var endAngle: Angle { Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0) }
    
    // MARK: - View Path
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        return Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle, clockwise: false
            )
        }
    }
    
}


// MARK: - Preview

#Preview {
    SpeakerArc(speakerIndex: 3, totalSpeakers: 5)
}
