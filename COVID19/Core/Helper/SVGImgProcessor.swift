//
//  SVGImgProcessor.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Kingfisher
import SVGKit

struct SVGImgProcessor:ImageProcessor
{
    var identifier: String = "com.shemy.Covid19"
    
    func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage?
    {
        switch item
        {
            case .image(let image): return image
                
            case .data(let data):
                let imsvg = SVGKImage(data: data)
                return imsvg?.uiImage
        }
    }
}
