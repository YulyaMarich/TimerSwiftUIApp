//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let dataManager = DataManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(dataManager.setUser())")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            
            VStack {
                Spacer()
                RoundedColoredButton(title: timer.buttonTitle, color: .red) {
                    self.timer.startTemer()
                }
                Spacer()
                RoundedColoredButton(title: "Log Out", color: .blue) {
                    dismiss()
                }
                .padding(.bottom, 50)
            }
           
        }
    }
    
    func dismiss() {
        user.isRegister = false
        user.name = ""
        dataManager.deleteUser()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserManager())
    }
}

