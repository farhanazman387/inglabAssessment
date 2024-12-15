//
//  SplashScreen.swift
//  inglab assessment
//
//  Created by Farhana Azman on 15/12/2024.
//
import SwiftUI

struct SplashScreenView : View {
    @Binding var opacity : Double
    
    var body: some View {
        VStack{
            Image("loginimage")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .opacity(opacity)
        }
//        .background(
//            Image("background")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//        )
        .edgesIgnoringSafeArea(.all)
    }
}
