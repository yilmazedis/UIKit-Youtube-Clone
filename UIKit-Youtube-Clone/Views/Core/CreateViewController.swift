//
//  CreateViewController.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 2.06.2022.
//

import UIKit

class CreateViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        transitioningDelegate = self
        modalPresentationStyle = .custom
        view.backgroundColor = .lightGray
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self,
                                                         action: #selector(handleDismiss)))
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

protocol MPControllerDelegate: AnyObject {
    func updateFrame(with frame: CGRect) -> CGRect
}

class MPController: UIPresentationController {
    private weak var MPDelegate: MPControllerDelegate!
    
    convenience
    init(delegate: MPControllerDelegate,
         presentedViewController: UIViewController,
         presenting presentingViewController: UIViewController?) {
        
        self.init(presentedViewController: presentedViewController,
                  presenting: presentingViewController)
        self.MPDelegate = delegate
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            MPDelegate.updateFrame(with: super.frameOfPresentedViewInContainerView)
            
        }
    }
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
        CGRect(x: 0, y: frame.height/2, width: frame.width, height: frame.height/2)
    }
}
