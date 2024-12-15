//
//  login.swift
//  inglab assessment
//
//  Created by Farhana Azman on 14/12/2024.
//

import SwiftUI

@available(iOS 16.0, *)
struct LoginPage: View {
    @State private var username = ""
    @State private var password = ""
    
    @State private var path = NavigationPath()
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $path){
                if #available(iOS 16.0, *) {
                    VStack {
                        Image("loginimage")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Inglab Assessment")
                            .font(.largeTitle)
                        TextField("Username", text: $username)
                            .padding()
                            .border(.gray)
                            .padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 0, trailing: 10.0))
                        TextField("Password", text: $password)
                            .padding()
                            .border(.gray)
                            .padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 0, trailing: 10.0))
                        Spacer()
                        Button (action: {
                            path.append("UserList")
                        }){
                            Text("Login")
                                .padding()
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(EdgeInsets(top: 5.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
                        }
                        .background(Color.blue)
                        .border(Color.blue, width: 2)
                        .cornerRadius(10.0)
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                    )
                    .navigationDestination(for: String.self) { value in
                        if value == "UserList"{
                            UserList().navigationBarBackButtonHidden(true)
                        }
                    }
                } else {
                    LoginPageView()
                }
            }
        } else {
            LoginPageView()
        }
    }
}

struct LoginPage_Preview: PreviewProvider{
    static var previews: some View{
        if #available(iOS 16.0, *) {
            LoginPage()
        } else {
            LoginPageView()
        }
    }
}
