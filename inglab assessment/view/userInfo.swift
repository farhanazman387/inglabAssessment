//
//  userInfo.swift
//  inglab assessment
//
//  Created by Farhana Azman on 14/12/2024.
//

import SwiftUI

struct UserInfo: View {
    let userInfo: User
    var body: some View {
        let url = userInfo.avatar ?? ""
        let combine = "https://nextjs-boilerplate-ten-olive-60.vercel.app" + url
        let imageURL = URL(string: combine)
        ScrollView(){
            VStack(alignment: .center){
                Text(userInfo.name ?? "No Name")
                    .font(.headline)
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        // Placeholder while loading
                        ProgressView()
                            .scaleEffect(1.5)
                            .padding()
                    case .success(let image):
                        // Render the successfully loaded image
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    case .failure:
                        // Display error state
                        Image(systemName: "exclamationmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                    @unknown default:
                        // Handle unexpected cases
                        EmptyView()
                    }
                }
                HStack{
                    Image("icon_call")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.tint)
                        .padding()
                    Text(userInfo.phone ?? "No Phone")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 5.0, leading: 100.0, bottom: 20.0, trailing: 30.0))
                }
                .border(Color.blue, width: 2.0)
                .frame(maxWidth: .infinity)
//                .padding(.horizontal)
                HStack{
                    Image("icon_email")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.tint)
                        .padding()
                    Text(userInfo.email ?? "No Email")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 5.0, leading: 100.0, bottom: 20.0, trailing: 30.0))
                }
                .border(Color.blue, width: 2.0)
                .frame(maxWidth: .infinity)
//                .padding(.horizontal)
                Text(userInfo.address ?? "No address")
                    .padding()
                    .lineLimit(nil) // Allows unlimited lines
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(Color.white)
//                    .padding(EdgeInsets(top: 5.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
            }
            .padding(.horizontal, 50)
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

