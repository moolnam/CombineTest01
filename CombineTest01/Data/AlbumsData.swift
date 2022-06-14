//
//  AlbumsData.swift
//  CombineTest01
//
//  Created by KimJongHee on 2022/06/14.
//


import Foundation

// MARK: - Album
struct Albums: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}


