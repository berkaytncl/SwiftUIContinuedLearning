//
//  DownloadingImagesBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 27.10.2023.
//

import SwiftUI

// Codable
// background threads
// weak self
// Combine
// Publishers and Subscribers
// FileManager
// NSCache

struct DownloadingImagesBootcamp: View {
    
    @StateObject var viewModel = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationStack {
                List {
                    ForEach(viewModel.dataArray) { model in
                        DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
