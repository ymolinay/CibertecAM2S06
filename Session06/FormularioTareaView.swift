//
//  FormularioTareaView.swift
//  Session06
//
//  Created by DAMII on 3/12/24.
//

import SwiftUI

struct FormularioTareaView : View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var mostrarFormulario: Bool
    
    @State private var titulo: String = ""
    @State private var descripcion: String = ""
    
    var body: some View {
        Form {
            CustomTextField(placeholder: "Título", text: $titulo)
            CustomTextField(placeholder: "Descripción", text: $descripcion)
            Button("Guardar") {
                crearTarea()
            }
        }
    }
    
    private func crearTarea() {
        let nuevaTarea = Tarea(context: viewContext)
        nuevaTarea.id = UUID()
        nuevaTarea.titulo = titulo
        nuevaTarea.descripcion = descripcion
        nuevaTarea.estado = false
        try? viewContext.save()
        mostrarFormulario = false
    }
}
