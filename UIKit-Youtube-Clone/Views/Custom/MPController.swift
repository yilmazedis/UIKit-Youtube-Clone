//
//  MPController.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 3.06.2022.
//

import UIKit

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
