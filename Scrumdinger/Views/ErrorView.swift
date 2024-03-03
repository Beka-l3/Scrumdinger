//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 03.03.2024.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: - Internal Properties
    
    let errorWrapper: ErrorWrapper
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            Text("An error has occurred!")
                .font(.title)
                .padding(.bottom)
            
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            
            Text(errorWrapper.guidance)
                .font(.caption)
                .padding(.top)
            
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}


// MARK: - Preview

fileprivate enum SampleError: Error {
    case errorRequired
}

fileprivate var wrapper: ErrorWrapper {
    ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error.")
}

#Preview {
    ErrorView(errorWrapper: wrapper)
}
