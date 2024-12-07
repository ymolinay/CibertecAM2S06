//
//  LoginView.swift
//  Session06
//
//  Created by DAMII on 3/12/24.
//

import SwiftUI

struct LoginView : View {
    @State private var correo = ""
    @State private var clave = ""
    @State private var isLoggedIn = true
    
    var body: some View {
        if isLoggedIn {
            TareaListaView()
        } else {
            VStack {
                CustomTextField(placeholder: "Correo", text: $correo)
                CustomTextField(placeholder: "Contraseña", text: $clave)
                    .textContentType(.password)
                    .keyboardType(.default)
                Button("Ingresar") {
                    isLoggedIn = true
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
            }
        }
    }
}
