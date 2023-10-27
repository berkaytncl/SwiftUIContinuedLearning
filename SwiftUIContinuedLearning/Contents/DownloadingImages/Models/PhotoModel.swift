//
//  PhotoModel.swift
//  SwiftUIContinuedLearning
//
//  Created by Berkay Tuncel on 27.10.2023.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
