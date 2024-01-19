//
//  ThemePickerView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 19.01.2024.
//

import SwiftUI


struct ThemePickerView: View {
    
    @Binding var selection: Theme
    
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
            
        }
        .pickerStyle(.navigationLink)
    }
}


struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView(selection: .constant(.periwinkle))
    }
}