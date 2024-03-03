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
    
    // MARK: - Private Properties
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - View Body
    
    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") { dismiss() }
                }
            }
        }
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
