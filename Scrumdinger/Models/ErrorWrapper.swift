//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Bekzhan Talgat on 03.03.2024.
//

import Foundation

struct ErrorWrapper: Identifiable {
    
    // MARK: - Internal Properties
    
    let id: UUID
    let error: Error
    let guidance: String
    
    // MARK: - Initializers
    
    init(id: UUID = .init(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
}
