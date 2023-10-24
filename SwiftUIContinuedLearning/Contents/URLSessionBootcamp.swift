//
//  URLSessionBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 24.10.2023.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    private func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadData(fromURL: url) { [weak self] data in
            guard let data = data else { return }
            guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
            DispatchQueue.main.async {
                self?.posts = newPosts
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                error == nil,
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                
                print("Error downloading data.")
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
}

struct URLSessionBootcamp: View {
    
    @StateObject var viewModel = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                LazyVStack(alignment: .leading, spacing: 20) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    URLSessionBootcamp()
}
