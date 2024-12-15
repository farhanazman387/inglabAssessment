//
//  ContentView.swift
//  inglab assessment
//
//  Created by Farhana Azman on 14/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var opacity = 1.0
    var body: some View {
        ZStack{
            if isActive{
                if #available(iOS 16.0, *) {
                    LoginPage()
                        .transition(.opacity)
                } else {
                    LoginPageView()
                        .transition(.opacity)
                }
            }
            else {
                SplashScreenView(opacity: $opacity)
                    .onAppear(){
                        withAnimation(.easeInOut(duration: 1.5)){
                            opacity = 0
                        }
                    }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                withAnimation(){
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
