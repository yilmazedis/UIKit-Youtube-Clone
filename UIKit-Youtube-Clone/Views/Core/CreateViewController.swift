//
//  CreateViewController.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 2.06.2022.
//

import UIKit
import TinyConstraints

class CreateViewController: UIViewController {
    
    // MARK: - Container & Stack Views -
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var createView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private lazy var shortView: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemRed
        btn.tag = CreateViewLine.shortView.rawValue
        btn.addTarget(self, action: #selector(linesTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var uploadView: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemOrange
        btn.tag = CreateViewLine.uploadView.rawValue
        btn.addTarget(self, action: #selector(linesTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var goLiveView: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.tag = CreateViewLine.createImage.rawValue
        btn.addTarget(self, action: #selector(linesTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Line Views -
    
    // MARK: - Create
    private lazy var createImage: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "multiply"), for: .normal)
        btn.tintColor = .label
        btn.addTarget(self, action: #selector(createImageTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private lazy var createLabel: UILabel = {
       let label = UILabel()
        label.text = "Create"
        return label
    }()
    
    // MARK: - Short
    private lazy var shortImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Shorts")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var shortLabel: UILabel = {
       let label = UILabel()
        label.text = "Create Short Video"
        return label
    }()
    
    // MARK: - Upload
    private lazy var uploadImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.up.to.line")
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var uploadLabel: UILabel = {
       let label = UILabel()
        label.text = "Upload Video"
        return label
    }()
    
    // MARK: - Go Live
    private lazy var goLiveImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "GoLive")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var goLiveLabel: UILabel = {
       let label = UILabel()
        label.text = "Go Live"
        return label
    }()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        transitioningDelegate = self
        modalPresentationStyle = .custom
        view.backgroundColor = .systemBackground
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self,
                                                         action: #selector(handleDismiss)))
        
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true

        //UIView Set up border
        view.layer.borderColor = UIColor.systemYellow.cgColor
        view.layer.borderWidth = 3.0
        
        setConstraints()
    }
    
    private func setConstraints() {
        view.addSubview(containerView)
        containerView.edgesToSuperview(insets: .top(20) + .left(20) + .bottom(20) + .right(20))
        
        let containerViews = [createView, shortView, uploadView, goLiveView]
        
        // 12 is 4 containerViews multiply lastHeight division
        // 4 * 3 = 12
        // 10 is - 20 top and bottom equal 40. so there are four subview. then divide by 4.
        // (20 * 2) / 4 = 10
        
        let viewHeight = view.frame.height / 12 - 10
        containerView.stack(containerViews,
                            axis: .vertical,
                            height: viewHeight)
        
        // CreateView constraints
        createView.addSubview(createLabel)
        createView.addSubview(createImage)
        createLabel.edgesToSuperview(excluding: .right, insets: .left(viewHeight / 4))
        createImage.edgesToSuperview(excluding: .left, insets: .right(viewHeight / 4))
        
        // ShortView constraints
        shortView.addSubview(shortLabel)
        shortView.addSubview(shortImage)
        shortImage.top(to: shortView, offset: viewHeight / 4)
        shortImage.left(to: shortView, offset: viewHeight / 4)
        shortImage.bottom(to: shortView, offset: -viewHeight / 4)
        
        shortLabel.top(to: shortView, offset: viewHeight / 4)
        shortLabel.left(to: shortImage, offset: viewHeight / 2)
        shortLabel.bottom(to: shortView, offset: -viewHeight / 4)
        
        // UploadView constraints
        uploadView.addSubview(uploadLabel)
        uploadView.addSubview(uploadImage)
        uploadImage.top(to: uploadView, offset: viewHeight / 4)
        uploadImage.left(to: uploadView, offset: viewHeight / 4)
        uploadImage.bottom(to: uploadView, offset: -viewHeight / 4)
        
        uploadLabel.top(to: uploadView, offset: viewHeight / 4)
        uploadLabel.left(to: uploadImage, offset: viewHeight / 2)
        uploadLabel.bottom(to: uploadView, offset: -viewHeight / 4)
        
        // GoLiveView constraints
        goLiveView.addSubview(goLiveLabel)
        goLiveView.addSubview(goLiveImage)
        goLiveImage.top(to: goLiveView, offset: viewHeight / 4)
        goLiveImage.left(to: goLiveView, offset: viewHeight / 4)
        goLiveImage.bottom(to: goLiveView, offset: -viewHeight / 4)
        
        goLiveLabel.top(to: goLiveView, offset: viewHeight / 4)
        goLiveLabel.left(to: goLiveImage, offset: viewHeight / 2)
        goLiveLabel.bottom(to: goLiveView, offset: -viewHeight / 4)
        
        
    }
    
    @objc private func createImageTouchUpInside() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func linesTouchUpInside(sender:UIButton) {
        
        switch sender.tag {
        case CreateViewLine.shortView.rawValue:
            print(sender.tag)
        case CreateViewLine.shortView.rawValue:
            print(sender.tag)
        case CreateViewLine.shortView.rawValue:
            print(sender.tag)
            
        default:
            print(sender.tag)
        }
        
        
    }
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    @objc private func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 200 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
}

extension CreateViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        MPController(delegate: self,
                     presentedViewController: presented,
                     presenting: presenting)
    }
}

extension CreateViewController: MPControllerDelegate {
    func updateFrame(with frame: CGRect) -> CGRect {
        
        // use in containerView
        let lastHeight = frame.height/3
        
        return CGRect(x: 0,
                      y: frame.height - lastHeight,
                      width: frame.width,
                      height: lastHeight)
    }
}
