//
//  IncidentViewModel.swift
//  SwiftFieldReporter
//
//  Created by Bastihan on 08-08-26.
//

import SwiftUI

@Observable
class IncidentViewModel {
    var incidents: [Incident] = []
    
    // Función para datos de prueba
    func addMockIncident() {
        let newIncident = Incident(
            title: "Incidente de prueba",
            description: "Esto es una descripción del incidente."
        )
        incidents.append(newIncident)
    }
    
    // Función para simular el toggle de sincronización
    func toggleSync(for incidentID: UUID) {
        if let index = incidents.firstIndex(where: { $0.id == incidentID }) {
            incidents[index].isSynced.toggle()
        }
    }
}
