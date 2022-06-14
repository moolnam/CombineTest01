//
//  APIService.swift
//  CombineTest01
//
//  Created by KimJongHee on 2022/06/14.
//

import Foundation
import SwiftUI
import Combine


enum API {
    case fetchTodo
    case fetchPost
    case fetchAlbum
    
    var url: URL {
        switch self {
        case .fetchTodo:
            return URL(string: "https://jsonplaceholder.typicode.com/todos")!
        case .fetchPost:
            return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        case .fetchAlbum:
            return URL(string: "https://jsonplaceholder.typicode.com/albums")!
        }
    }
}

enum APIService {
    static func fetchTodos() -> AnyPublisher<[Todo], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchTodo.url)
            .map { $0.data }
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func fetchPosts() -> AnyPublisher<[Post], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchPost.url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func fetchAlbums() -> AnyPublisher<[Albums], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchAlbum.url)
            .map { $0.data }
            .decode(type: [Albums].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func fetchTodoAndPostAtTheSameTime() -> AnyPublisher<([Todo], [Post]), Error> {
        let fetchTodo = fetchTodos()
        let fetchPost = fetchPosts()
        
        return Publishers
            .CombineLatest(fetchTodo, fetchPost)
            .eraseToAnyPublisher()
        
    }
    
    static func fetchTodoAndPostAndAlbums() -> AnyPublisher<([Todo], [Post], [Albums]), Error> {
        let fetchTodo = fetchTodos()
        let fetchPost = fetchPosts()
        let fetchAlbum = fetchAlbums()
        
        return Publishers
            .CombineLatest3(fetchTodo, fetchPost, fetchAlbum)
            .eraseToAnyPublisher()
    }
}
