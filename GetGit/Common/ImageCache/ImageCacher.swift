//
//  ImageCacher.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ImageCacher: ImageProvider {
    static var shared = ImageCacher()
    
    private init() {
    }
    
    private let imageDownloader: ImageDownloader = {
        return ImageDownloader(
            configuration: ImageDownloader.defaultURLSessionConfiguration(),
            downloadPrioritization: .fifo,
            maximumActiveDownloads: 8,
            imageCache: AutoPurgingImageCache()
        )
    }()
    
    func getImage(forUrl urlString: String, completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: urlString) else {
            debugPrint("Warning: wrong url for image.")
            return
        }
    
        let urlRequest = URLRequest(url: url)
        imageDownloader.download(urlRequest) { response in
            if let image = response.result.value {
                completion(image)
            }
        }
    }

}
