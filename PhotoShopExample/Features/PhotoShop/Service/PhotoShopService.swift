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
        // 
    }
}

protocol IPhotoShopService {
    func fetchAllDatas(response: @escaping ([Photo]?) -> Void)
}

struct PhotoShopService: IPhotoShopService{
    func fetchAllDatas(response: @escaping ([Photo]?) -> Void) {
        AF.request(PhotoShopServiceEndPoint.photoPath()).responseDecodable(of: PhotoShopModell.self){
            (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.photo)
        }
    
        
    }
}
