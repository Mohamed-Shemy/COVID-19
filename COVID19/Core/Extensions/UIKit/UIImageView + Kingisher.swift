//
//  UIImageView + Kingisher.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Kingfisher

extension UIImageView
{
    func setImage(from path: String, placeholder: UIImage? = nil)
    {
        let url = URL(string: path)
        kf.indicatorType = .activity
        
        var options: KingfisherOptionsInfo? = nil
        if path.lowercased().hasSuffix(".svg")
        {
            options = [.processor(SVGImgProcessor())]
        }
        
        kf.setImage(with: url, placeholder: placeholder, options: options)
    }
}
