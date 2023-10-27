//
//  DownloadingImagesViewModel.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 27.10.2023.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] returnedPhotoModel in
                self?.dataArray = returnedPhotoModel
            }
            .store(in: &cancellables)
    }
}
