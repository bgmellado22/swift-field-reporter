//
//  IncidentListView.swift
//  SwiftFieldReporter
//
//  Created by Bastihan on 08-08-26.
//

import SwiftUI

struct IncidentListView: View {
    // Instanciar el viewModel
    @State private var viewModel = IncidentViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.incidents) { incident in
                    IncidentRowView(incident: incident) {
                        viewModel.toggleSync(for: incident.id)
                    }
                }
            }
            .navigationTitle("Reportes en terreno")
            .toolbar {
                // Botón de "+" para agregar un reporte
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.addMockIncident()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            // Mostrar algo cuando no existan reportes
            .overlay {
                if viewModel.incidents.isEmpty {
                    ContentUnavailableView(
                        "Sin reportes",
                        systemImage: "doc.text.magnifyingglass",
                        description: Text("Presiona el + para añadir un reporte")
                    )
                }
            }
        }
    }
}

// Componente
struct IncidentRowView: View {
    var incident: Incident
    var onToggleSync: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(incident.title)
                    .font(.headline)
                Text(incident.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2) // Descripción de máximo 2 líneas
            }
            
            Spacer()
            
            // Botón para simular la sincronización a la nube
            Button(action: onToggleSync) {
                Image(systemName: incident.isSynced ? "cloud.fill" : "cloud") .foregroundStyle(incident.isSynced ? .green : .gray)
                    .font(.title2)
            }
            .buttonStyle(.plain) // Evita que al tocar el botón se seleccione toda la fila
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    IncidentListView()
}
