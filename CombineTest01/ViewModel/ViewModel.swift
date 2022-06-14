//
//  ViewModel.swift
//  CombineTest01
//
//  Created by KimJongHee on 2022/06/14.
//

import Foundation
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    func fetchTodos() {
        APIService.fetchTodos()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("실패: \(err)")
                case .finished:
                    print("성공")
                }
            }, receiveValue: { (todos: [Todo]) in
                print("받아온 Todo 데이터: \(todos.count) ")
            }).store(in: &subscriptions)
    }
    
    func fetchPosts() {
        APIService.fetchPosts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("실패: \(err)")
                case .finished:
                    print("성공")
                }
            }, receiveValue: { (posts: [Post]) in
                print("받아온 Post 데이터: \(posts.count) ")
            }).store(in: &subscriptions)
    }
    
    func fetchTodoAndPostAtTheSameTime() {
        APIService.fetchTodoAndPostAtTheSameTime()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("실패: \(err)")
                case .finished:
                    print("성공")
                }
                
            }, receiveValue: { (todos: [Todo], posts: [Post]) in
                print("성공: \(todos.count), 성공: \(posts.count)")
            }).store(in: &subscriptions)
    }
    
    func fetchTodoAndPostAndAlbums() {
        APIService.fetchTodoAndPostAndAlbums()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("실패: \(err)")
                case .finished:
                    print("성공")
                }
                
            }, receiveValue: { (todos: [Todo], posts: [Post], albums: [Albums]) in
                print("todos: \(todos.count), posts: \(posts.count), albums: \(albums.count)")
                
            }).store(in: &subscriptions)
    }
}
