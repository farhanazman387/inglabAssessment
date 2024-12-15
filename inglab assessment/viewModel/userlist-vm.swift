//
//  userlist-vm.swift
//  inglab assessment
//
//  Created by Farhana Azman on 14/12/2024.
//
import Alamofire

class UserListViewModel: ObservableObject{
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMsg: String? = nil
    
    @Published var searchText = "" {
            didSet {
                filterItems()
            }
        }
    private var allItems : [User] = []
//    @Published var filteredItem : [User] = []
    
    private let networkservice : NetworkServiceProtocol
    
    init(networkservice: NetworkServiceProtocol = NetworkService()){
        self.networkservice = networkservice
    }
    
    func fetchUsers(){
        isLoading = true
        networkservice.fetchUsers{ [weak self] result in
            DispatchQueue.main.async{
                self?.isLoading = false
                switch result{
                case .success(let users):
                    self?.users = users
                    self?.allItems = users
                case .failure(let error):
                    self?.errorMsg = error.localizedDescription
                }
            }
        }
    }
    
    // Filter items based on searchText
    private func filterItems() {
        if searchText.isEmpty {
            users = allItems
        } else {
            
            users = allItems.filter{ $0.name!.lowercased().contains(searchText.lowercased()) }
        }
    }
}
