//
//  HomeHeaderCollectionViewCell.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 5.06.2022.
//

import UIKit
import TinyConstraints

class HomeHeaderCollectionViewCell: UICollectionViewCell {


    static let identifier = "HomeHeaderCollectionViewCell"

    lazy var headerCellButton: UIButton = {
        
        var filled = UIButton.Configuration.filled()
        filled.buttonSize = .large
        filled.cornerStyle = .capsule
        filled.imagePadding = 3
        
        filled.baseBackgroundColor = .systemGreen
        
        let btn = UIButton(configuration: filled, primaryAction: nil)
        btn.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(headerCellButton)

    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        headerCellButton.frame = contentView.bounds
    }

    public func configure(with model: HomeHeader) {
        headerCellButton.setTitle(model.title, for: .normal)
        headerCellButton.tag = model.tag
        
        if model.title == "Explore" {
            headerCellButton.setImage(UIImage(systemName: "safari"), for: .normal)
        }
        
        headerCellButton.edgesToSuperview()
    }
    
    override func prepareForReuse() {
        // TODO: cell reuse issue didnt fix
        super.prepareForReuse()
    }
    
    @objc private func buttonTouchUpInside(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            print(sender.tag)
        case 1:
            print(sender.tag)
        case 2:
            print(sender.tag)
        case 3:
            print(sender.tag)
        case 4:
            print(sender.tag)
        case 5:
            print(sender.tag)
            
        default:
            print(sender.tag)
        }
        
    }
}
