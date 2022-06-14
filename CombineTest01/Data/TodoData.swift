//
//  TodoData.swift
//  CombineTest01
//
//  Created by KimJongHee on 2022/06/14.
//

import Foundation


struct Todo: Codable {
    let userID: Int
    let id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
        case completed
    }
}


