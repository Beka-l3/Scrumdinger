//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 19.01.2024.
//

import SwiftUI


struct ThemeView: View {
    
    // MARK: - Internal Properties
    
    let theme: Theme
    
    // MARK: - View Body
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
    
}


// MARK: - Preview

#Preview {
    ThemeView(theme: .buttercup)
}
