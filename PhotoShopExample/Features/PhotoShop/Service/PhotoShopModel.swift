//
//  PhotoShopService.swift
//  PhotoShopExample
//
//  Created by Nesrin Bozan on 26.09.2022.
//


import Foundation
import Alamofire

enum PhotoShopServiceEndPoint: String {
    case BASE_URL = "https://jsonplaceholder.typicode.com"
    case PATH = "/photos"
    
    static func photoPath() -> String{
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IPhotoShopService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct PhotoShopModel: IPhotoShopService{
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(PhotoShopServiceEndPoint.photoPath()).responseDecodable(of: Photo)
        <#code#>
    }
}
