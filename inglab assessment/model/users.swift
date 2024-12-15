//
//  users.swift
//  inglab assessment
//
//  Created by Farhana Azman on 14/12/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let users = try? JSONDecoder().decode(Users.self, from: jsonData)

import Foundation
//import OptionallyDecodable // https://github.com/idrougge/OptionallyDecodable

// MARK: - User
struct User: Codable {
    let avatar: String?
    let name : String?
    let phone: String?
    let email: String?
    let address: String?
    let isActive: Bool?
    let index: Int?
}

typealias Users = [User]
