//
//  login-view.swift
//  inglab assessment
//
//  Created by Farhana Azman on 15/12/2024.
//

import SwiftUI

struct LoginPageView: View{
    @State private var username = ""
    @State private var password = ""
    
    var body: some View{
        NavigationView{
            VStack{
                
                Image("loginimage")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Inglab Assessment")
                TextField("Username", text: $username)
                    .padding()
                    .border(.gray)
                    .padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 0, trailing: 10.0))
                TextField("Password", text: $password)
                    .padding()
                    .border(.gray)
                    .padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 0, trailing: 10.0))
                NavigationLink("Login", destination: UserList().navigationBarBackButtonHidden(true))
                    .background(Color.blue)
                    .border(Color.blue, width: 2)
                    .cornerRadius(10.0)
                    .frame(maxWidth: .infinity)
                
            }
            .background(
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct LoginPageView_Previews : PreviewProvider{
    static var previews: some View{
        LoginPageView()
    }
}
