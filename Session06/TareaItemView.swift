//
//  TareaItemView.swift
//  Session06
//
//  Created by DAMII on 3/12/24.
//

import SwiftUI

struct TareaItemView : View {
    let titulo: String
    let descripcion: String
    let estado: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(titulo)
                    .font(.headline)
                if let desc = descripcion, !descripcion.isEmpty {
                    Text(desc)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            let textoEstado = estado ? "Completada" : "Pendiente"
            let colorEstado = estado ? Color.green : Color.orange
            Text(textoEstado)
                .padding(4)
                .background(colorEstado)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()
    }
}
