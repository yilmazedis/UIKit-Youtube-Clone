//
//  HomeTableViewCell.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 8.06.2022.
//

import TinyConstraints
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    let profileImageHight: CGFloat = 40

    private lazy var videoImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "homeVideoImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var profileImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "homeProfile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = profileImageHight / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var videoTitle: UILabel = {
       let label = UILabel()
        label.text = "How To win a game with just one kill"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var videoDetail: UILabel = {
       let label = UILabel()
        label.text = "Dota - 19k views - 1 day ago"
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private lazy var videoDuration: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "0:37"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(videoImage)
        addSubview(profileImage)
        addSubview(videoTitle)
        addSubview(videoDetail)
        addSubview(videoDuration)
        
        videoImage.edgesToSuperview(excluding: .bottom)
        videoImage.height(260)
        
        profileImage.topToBottom(of: videoImage, offset: 15)
        profileImage.left(to: self, offset: 15)
        profileImage.height(profileImageHight)
        profileImage.width(profileImageHight)
        
        videoTitle.topToBottom(of: videoImage, offset: 10)
        videoTitle.leftToRight(of: profileImage, offset: 15)
        
        videoDetail.topToBottom(of: videoTitle, offset: 5)
        videoDetail.leftToRight(of: profileImage, offset: 15)
        
        videoDuration.right(to: videoImage, offset: -5)
        videoDuration.bottom(to: videoImage, offset: -5)
        videoDuration.width(40)
        videoDuration.height(30)
    }
    
    public func configure() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
