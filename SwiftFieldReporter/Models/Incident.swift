//
//  Incident.swift
//  SwiftFieldReporter
//
//  Created by Bastihan on 08-08-26.
//

import Foundation

struct Incident: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var date: Date
    var isSynced: Bool
    
    init(id: UUID = UUID(), title: String, description: String, date: Date = Date(), isSynced: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.isSynced = isSynced
    }
}
