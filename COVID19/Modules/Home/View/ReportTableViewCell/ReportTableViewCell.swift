//
//  ReportTableViewCell.swift
//  COVID19
//
//  Created by Mohamed Shemy on Mon 16 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell, Configurable
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    func configure(_ report: ReportValue, at indexPath: IndexPath)
    {
        titleLabel.text = "\(report.title):"
        valueLabel.text = report.value.asString
        progressView.progress = report.progress
    }
}
