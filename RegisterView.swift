//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    let dataManager = DataManager.shared
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(changeTextColor())
                    .opacity(0.6)
                    .font(.system(size: 16))
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(name.count < 3)
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
            dataManager.saveUser(user: name)
        }
        
    }
    private func changeTextColor() -> Color {
        var color = Color.red
        if name.count >= 3 {
            color = Color.green
        } else {
            color = Color.red
        }
        return color
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
