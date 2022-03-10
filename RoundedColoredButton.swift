//
//  RoundedColoredButton.swift
//  StateAndDataFlow
//
//  Created by Julia on 08.03.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RoundedColoredButton: View {
    var title: String
    var color: Color
    var action: () -> Void
    
    var body: some View {

        
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct RoundedColoredButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedColoredButton(title: "", color: .blue, action: {})
    }
}
