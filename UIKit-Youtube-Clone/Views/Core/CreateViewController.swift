//
//  CreateViewController.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 2.06.2022.
//

import UIKit
import TinyConstraints

class CreateViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var lineView_1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private lazy var lineView_2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    private lazy var lineView_3: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private lazy var lineView_4: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
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
        
        let containerViews = [lineView_1, lineView_2, lineView_3, lineView_4]
        
        // 12 is 4 containerViews multiply lastHeight division
        // 4 * 3 = 12
        // 10 is - 20 top and bottom equal 40. so there are four subview. then divide by 4.
        // (20 * 2) / 4 = 10
        containerView.stack(containerViews, axis: .vertical, height: view.frame.height/12 - 10, spacing:0)
    }
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
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
        
        return CGRect(x: 0, y: frame.height - lastHeight, width: frame.width, height: lastHeight)
    }
}
