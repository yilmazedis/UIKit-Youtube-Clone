//
//  HomeHeaderUIView.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 5.06.2022.
//

import UIKit

class HomeHeaderUIView: UIView {
    
    private var homeHeader: [HomeHeader] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 40, height: 50)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeHeaderCollectionViewCell.self, forCellWithReuseIdentifier: HomeHeaderCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        applyConstraints()
        configure()
    }
    
    private func applyConstraints() {

        
    }

    func configure() {
        homeHeader.append(HomeHeader(tag: -1, title: "Explore"))
        homeHeader.append(HomeHeader(tag: 0, title: "All"))
        homeHeader.append(HomeHeader(tag: 1, title: "Live"))
        homeHeader.append(HomeHeader(tag: 2, title: "Gaming"))
        homeHeader.append(HomeHeader(tag: 3, title: "Music"))
        homeHeader.append(HomeHeader(tag: 4, title: "Mixes"))
        homeHeader.append(HomeHeader(tag: 5, title: "Dota 2"))
        homeHeader.append(HomeHeader(tag: 6, title: "Swift"))
        homeHeader.append(HomeHeader(tag: 7, title: "iOS"))
        homeHeader.append(HomeHeader(tag: 8, title: "Mobile"))
        homeHeader.append(HomeHeader(tag: 9, title: "Mac"))
        homeHeader.append(HomeHeader(tag: 10, title: "News"))
        
        collectionView.reloadData()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HomeHeaderUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeHeader.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCollectionViewCell.identifier, for: indexPath) as? HomeHeaderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: homeHeader[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = homeHeader[indexPath.row].title
        label.sizeToFit()
        print(label.frame.width)
        
        var finalWidth = label.frame.width + 40
        if indexPath.row == 0 {
            finalWidth = label.frame.width + 70
        }
        
        return CGSize(width: finalWidth, height: 32)
    }
    
    
}

extension HomeHeaderUIView: UICollectionViewDelegateFlowLayout {

    // Distance Between Item Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // Cell Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }

}

