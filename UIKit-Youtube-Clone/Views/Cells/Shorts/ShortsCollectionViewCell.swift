//
//  ShortsCollectionViewCell.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 9.06.2022.
//

import UIKit
import TinyConstraints

class ShortsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShortsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    func configure() {
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        headerCellButton.frame = contentView.bounds
    }
    
}
