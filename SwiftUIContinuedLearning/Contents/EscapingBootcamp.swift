//
//  EscapingBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 24.10.2023.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedData in
            self?.text = returnedData.data
        }
    }
    
    private func downloadData() -> String {
        return "New data!"
    }
    
    private func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New data!")
    }
    
    private func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New data!")
        }
    }
    
    private func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }   
    
    private func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
