//
//  ArraysBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 20.10.2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 0, isVerified: false)
        let user3 = UserModel(name: nil, points: 20, isVerified: true)
        let user4 = UserModel(name: "Samantha", points: 50, isVerified: true)
        let user5 = UserModel(name: "Jason", points: 45, isVerified: false)
        let user6 = UserModel(name: "Sarah", points: 23, isVerified: false)
        let user7 = UserModel(name: nil, points: 76, isVerified: true)
        let user8 = UserModel(name: "Steve", points: 45, isVerified: false)
        let user9 = UserModel(name: nil, points: 1, isVerified: false)
        let user10 = UserModel(name: "Amanda", points: 100, isVerified: false)
        
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
    }
    
    func updateFilteredArray() {
        // sort
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        
        // filter
//        filteredArray = dataArray.filter { $0.isVerified }
//        filteredArray = dataArray.filter { $0.points > 50 }
//        filteredArray = dataArray.filter { $0.name.contains("i") }
        
        // map
//        mappedArray = dataArray.map { $0.name }
//        mappedArray = dataArray.compactMap { $0.name }
        
        let sort = dataArray.sorted(by: { $0.points > $1.points })
        let filter = dataArray.filter({ $0.isVerified })
        let map = dataArray.compactMap({ $0.name })
        
        mappedArray = dataArray
                        .sorted(by: { $0.points > $1.points })
                        .filter({ $0.isVerified })
                        .compactMap({ $0.name })
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var viewModel = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.headline)
                }
//                ForEach(viewModel.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
