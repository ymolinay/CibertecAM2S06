//
//  TareaListaView.swift
//  Session06
//
//  Created by DAMII on 3/12/24.
//

import SwiftUI

struct TareaListaView : View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Tarea.titulo, ascending: true)],
        animation: .default
    ) private var tareas: FetchedResults<Tarea>
    
    @State private var mostrarFormulario = false
    @State private var tareaEliminar: Tarea?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tareas) { item in
                        HStack {
                            TareaItemView(
                                titulo: item.titulo ?? "Sin título",
                                descripcion: item.descripcion ?? "",
                                estado: item.estado)
                            Spacer()
                            Button(action: {
                                item.estado.toggle()
                                guardarCambios()
                            }) {
                                let icon = item.estado ? "checkmark.circle.fill" : "circle"
                                let colorIcon = item.estado ? Color.green : Color.gray
                                Image(systemName: icon).foregroundColor(colorIcon)
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                tareaEliminar = item
                            } label: {
                                Label("Eliminar", systemImage: "trash")
                            }
                        }
                        .alert(item: $tareaEliminar) { tarea in
                            Alert(
                                title: Text("Eliminar Tarea"),
                                message: Text("¿Estás seguro de eliminar?"),
                                primaryButton: .destructive(Text("Eliminar")) {
                                    eliminarTarea(tarea)
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    }
                }
            }
            .navigationTitle("Tareas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        mostrarFormulario = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarFormulario) {
                FormularioTareaView(mostrarFormulario: $mostrarFormulario)
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }
    
    private func guardarCambios() {
        try? viewContext.save()
    }
    
    private func eliminarTarea(_ tarea: Tarea) {
        viewContext.delete(tarea)
        guardarCambios()
    }
}
