//
//  ContentView.swift
//  CombineTest01
//
//  Created by KimJongHee on 2022/06/12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                self.viewModel.fetchTodos()
            }, label: {
                Text("버튼")
            })
            .font(.system(size: 50))
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            .padding()
            Button(action: {
                self.viewModel.fetchPosts()
            }, label: {
                Text("버튼")
            })
            .font(.system(size: 50))
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            .padding()
            Button(action: {
                self.viewModel.fetchTodoAndPostAtTheSameTime()
            }, label: {
                Text("버튼")
            })
            .font(.system(size: 50))
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            .padding()
            Button(action: {
                self.viewModel.fetchTodoAndPostAndAlbums()
            }, label: {
                Text("버튼")
            })
            .font(.system(size: 50))
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            .padding()
            Button(action: {}, label: {
                Text("버튼")
            })
            .font(.system(size: 50))
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
