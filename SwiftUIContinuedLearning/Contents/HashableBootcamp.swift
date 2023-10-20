//
//  HashableBootcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 20.10.2023.
//

import SwiftUI

//struct MyCustomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}

struct MyCustomModel {
    let title: String
    let subtitle: String
}

extension MyCustomModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subtitle: "123"),
        MyCustomModel(title: "TWO", subtitle: "123"),
        MyCustomModel(title: "THREE", subtitle: "123"),
        MyCustomModel(title: "FOUR", subtitle: "123"),
        MyCustomModel(title: "FIVE", subtitle: "123")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
//                ForEach(data) { item in
//                    Text(item.id )
//                    Text(item.title)
//                        .font(.headline)
//                }
                ForEach(data, id: \.self) { item in
                    Text(item.title.hash.description)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
