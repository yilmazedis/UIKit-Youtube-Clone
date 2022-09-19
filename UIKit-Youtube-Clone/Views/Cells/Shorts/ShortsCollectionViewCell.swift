//
//  ShortsCollectionViewCell.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 9.06.2022.
//

import UIKit
import TinyConstraints
import AVFoundation

class ShortsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShortsCollectionViewCell"
    
    private lazy var playerView: AVPlayerLayer = {
        let playerView = AVPlayerLayer()
        playerView.videoGravity = .resizeAspectFill
        
        return playerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        
        playerView.frame = bounds
    }
    
    func configure() {
        
        guard let path = Bundle.main.path(forResource: "dendi", ofType: "mp4") else {
            print("Failed to find video")
            return
        }
        
        if VideoPlayer.shared.player == nil {
            VideoPlayer.shared.player  = AVPlayer(url: URL(fileURLWithPath: path))
        } else {
            VideoPlayer.shared.player?.replaceCurrentItem(with: AVPlayerItem(url: URL(fileURLWithPath: path)))
        }
        
        playerView.player = VideoPlayer.shared.player
        
        layer.addSublayer(playerView)
        //VideoPlayer.shared.player?.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        headerCellButton.frame = contentView.bounds
    }
}
