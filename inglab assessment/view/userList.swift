//
//  userList.swift
//  inglab assessment
//
//  Created by Farhana Azman on 14/12/2024.
//

import SwiftUI

struct UserList: View {
    //get the data list of users
    @StateObject private var userlist_vm = UserListViewModel()
    //display on list tiles
    var body: some View {
        ScrollView{
            Text("IngLab Assessment")
                .font(.headline)
            // Search Box
            TextField("Search", text: $userlist_vm.searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            VStack(alignment: .leading){
                if userlist_vm.isLoading{
                    ProgressView("...Loading... ")
                }
                else if let errorMsg = userlist_vm.errorMsg{
                    Text(errorMsg)
                }
                else{
                    ForEach(userlist_vm.users, id: \.index){ user in
                        if user.isActive ?? false{
                            HStack(alignment:.firstTextBaseline, spacing: 10.0){
                                let url = user.avatar ?? ""
                                let combine = "https://nextjs-boilerplate-ten-olive-60.vercel.app" + url
                                let imageURL = URL(string: combine)
                                NavigationLink(destination: UserInfo(userInfo: user)){
                                    VStack(alignment: .leading) {
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
                                                            .frame(width: 70, height: 70)
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
                                            }
                                    VStack(alignment: .leading){
                                        Text(user.name ?? "Error name")
                                            .font(.headline)
                                        Text(user.phone ?? "Error Phone number")
                                            .font(.subheadline)
                                    }
                                }
                            } //hstack
                            .frame(maxWidth: .infinity)
//                            .frame(maxWidth: 400)
                            .padding()
                            Divider()
                        }
                        else {
                            //do nothing
                        }
                    }
                }
            }//vstack
            .padding()
            .border(Color.gray)
            .background(Color.white)
            .frame(maxWidth: .infinity)
//            .frame(maxWidth: 400)
            .padding(EdgeInsets(top: 0, leading: 30.0, bottom: 30.0, trailing: 30.0))
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear(){
            userlist_vm.fetchUsers()
        }
    }
}
