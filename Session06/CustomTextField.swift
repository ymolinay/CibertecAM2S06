//
//  CustomTextField.swift
//  Session06
//
//  Created by DAMII on 3/12/24.
//

import SwiftUI

struct CustomTextField : View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}
