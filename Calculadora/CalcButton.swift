//
//  CalcButton.swift
//  Calculadora
//
//  Created by Alexandre Dimas on 26/11/25.
//

import SwiftUICore
import SwiftUI


struct CalcButton: View {
    var label: String
    var bgColor: Color = Color(red: 45/255, green: 45/255, blue: 45/255)
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 32))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(bgColor)
                .cornerRadius(40)
        }
    }
}

