//
//  CoinImageService.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 05/04/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService{
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin:CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private var imageName: String
    
    init(coin: CoinModel){
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage(){
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName){
            image = savedImage
        }
        else{
            downloadCoinImage()
        }
    }
    private func downloadCoinImage(){
        guard let url = URL(string: coin.image) else {return}
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({  (data) -> UIImage?  in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedImage) in
                guard let self = self, let downloadingImage = returnedImage else {return}
                self.image = downloadingImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadingImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
