//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 18.01.2024.
//

import SwiftUI


struct TrailingIconLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            configuration.title
            configuration.icon
            
        }
    }
    
}


extension LabelStyle where Self == TrailingIconLabelStyle {
    
    static var triangleIcon: Self { Self() }
    
}
