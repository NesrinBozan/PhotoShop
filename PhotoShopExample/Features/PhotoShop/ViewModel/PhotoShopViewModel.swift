//
//  PhotoShopViewModel.swift
//  PhotoShopExample
//
//  Created by Nesrin Bozan on 26.09.2022.
//

import Foundation

protocol IPhotoShopViewModel{
    func fetchItems()
    func changeLoading()
    
    var photosShopPhoto: [Photo]{ get set}
    var photoShopService: IPhotoShopService{ get }
    
    var photoShopOutput: PhotoShopOutPut? { get }
    func setDelegate(output: PhotoShopOutPut)
    
}


final class PhotoShopViewModel: IPhotoShopViewModel {
    var photoShopOutput: PhotoShopOutPut?
    
    func setDelegate(output: PhotoShopOutPut) {
        photoShopOutput = output
    }
    
    var photosShopPhoto: [Photo]
    private var isLoading = false
    let photoShopService: IPhotoShopService
    
    init() {
        photoShopService = PhotoShopService()
        
    }
    
    func fetchItems() {
        photoShopService.fetchAllDatas{[weak self](response) in
            self?.changeLoading()
            self?.photosShopPhoto = response ?? []
            self?.photoShopOutput?.saveDatas(values: self?.photosShopPhoto ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        photoShopOutput?.changeLoading(isLoad: isLoading)
    }
    

    
    

}
