//
//  PhotoShopModel.swift
//  PhotoShopExample
//
//  Created by Nesrin Bozan on 26.09.2022.
//

import Foundation

// MARK: - PhotoShopModel
struct PhotoShopModell: Codable {
    let photos: Photos?
    let stat: String?
    enum CodingKeys: String, CodingKey{
        case photos
        case stat
    }
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?
    
    enum CodingKeys: String, CodingKey{
        case page
        case pages
        case perpage
        case total
        case photo
    }
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    
    enum CodingKeys: String, CodingKey{
        case id
        case owner
        case secret
        case server
        case farm
        case title
        case ispublic
        case isfriend
        case isfamily
    }
    
}
