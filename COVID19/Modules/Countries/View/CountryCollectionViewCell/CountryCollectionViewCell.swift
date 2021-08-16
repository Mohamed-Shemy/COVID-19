//
//  CountryCollectionViewCell.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell, Configurable
{
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        setupCellAppearance()
    }
    
    func configure(_ country: CountryViewModel, at indexPath: IndexPath)
    {
        flagImageView.setImage(from: country.flag)
        nameLabel.text = country.name
    }
    
    private func setupCellAppearance()
    {
        layer.cornerRadius = 5
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 1
    }
}
