//
//  login.swift
//  inglab assessment
//
//  Created by Farhana Azman on 14/12/2024.
//

import SwiftUI

struct LoginPage: View {
    @State private var username = ""
    @State private var password = ""
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Inglab Assessment")
                TextField("Username", text: $username)
                TextField("Password", text: $password)
                Button ("Login", action: {
                    path.append("UserList")
                })
            }
            .padding()
            .navigationDestination(for: String.self) { value in
                if value == "UserList"{
                    UserList().navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct LoginPage_Preview: PreviewProvider{
    static var previews: some View{
        LoginPage()
    }
}
