//
//  PostData.swift
//  CombineTest01
//
//  Created by KimJongHee on 2022/06/14.
//

import Foundation

struct Post: Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
        case body
    }
}


