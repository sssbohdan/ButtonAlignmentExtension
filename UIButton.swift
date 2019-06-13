//
//  UIButton.swift
//  ImagePosition
//
//  Created by Bohdan Savych on 10/1/16.
//  Copyright © 2016 BBB. All rights reserved.
//

import Foundation
import UIKit

typealias ContentPosition = (horizontal: HorizontalPosition, vertical: VerticalPosition)
typealias ContentOffset = (horizontal: Double, vertical: Double)

enum HorizontalPosition {
    case left,
    right,
    center
}

enum VerticalPosition {
    case top,
    bottom,
    center
}

extension UIButton {
    func setupImageInButton(imagePosition: ContentPosition = (.center, .center),
                            imageOffset: ContentOffset = (0, 0),
                            textPosition: ContentPosition = (.center, .center),
                            textOffset: ContentOffset = (0, 0)) {
        guard let imageViewFrame = imageView?.frame, let labelFrame = titleLabel?.frame else {
                return
        }
        
        contentHorizontalAlignment = .left
        contentVerticalAlignment = .top

        let buttonWidth = bounds.width
        let buttonHeight = bounds.height
        
        switch imagePosition.horizontal {
        case .left:
            imageEdgeInsets = UIEdgeInsets.init(top: 0, left: CGFloat(imageOffset.horizontal), bottom: 0, right: 0)
        case .right:
            let imageViewXOrigin = buttonWidth - imageViewFrame.width
            imageEdgeInsets = UIEdgeInsets.init(top: 0, left: imageViewXOrigin - CGFloat(imageOffset.horizontal), bottom: 0, right: 0)
        case .center:
            let imageViewXOrigin = (buttonWidth - imageViewFrame.width) / 2.0
            imageEdgeInsets = UIEdgeInsets.init(top: 0, left: imageViewXOrigin, bottom: 0, right: 0)
        }
        
        switch imagePosition.vertical {
        case .top:
            imageEdgeInsets = UIEdgeInsets.init(top: CGFloat(imageOffset.vertical),left: imageEdgeInsets.left, bottom: 0, right: imageEdgeInsets.right)
        case .bottom:
            let imageViewYOrigin = buttonHeight - imageViewFrame.height
            imageEdgeInsets = UIEdgeInsets.init(top: imageViewYOrigin - CGFloat(imageOffset.vertical), left: imageEdgeInsets.left, bottom: 0, right: imageEdgeInsets.right)
        case .center:
            let imageViewYOrigin = (buttonHeight - imageViewFrame.height) / 2.0
            imageEdgeInsets = UIEdgeInsets.init(top: imageViewYOrigin, left: imageEdgeInsets.left, bottom: 0, right: imageEdgeInsets.right)
        }
        
        switch textPosition.horizontal {
        case .left:
            let textXOrigin = -imageViewFrame.width + CGFloat(textOffset.horizontal)
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left: textXOrigin, bottom: 0, right: 0)
        case .center:
            let textXOrigin = ((buttonWidth - labelFrame.width) / 2.0) - imageViewFrame.width
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left: textXOrigin, bottom: 0, right: 0)
        case .right:
            let textXOrigin = (buttonWidth - labelFrame.width - CGFloat(textOffset.horizontal) - imageViewFrame.width)
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left: textXOrigin, bottom: 0, right: 0)
        }
        
        switch textPosition.vertical {
        case .top:
            titleEdgeInsets = UIEdgeInsets.init(top: CGFloat(textOffset.vertical), left: titleEdgeInsets.left, bottom: 0, right: titleEdgeInsets.right)
        case .center:
            let textYOrigin = (buttonHeight - labelFrame.height) / 2.0
            titleEdgeInsets = UIEdgeInsets.init(top: textYOrigin, left: titleEdgeInsets.left, bottom: 0, right: titleEdgeInsets.right)
        case .bottom:
            let textYOrigin = buttonHeight - labelFrame.height - CGFloat(textOffset.vertical)
            titleEdgeInsets = UIEdgeInsets.init(top: textYOrigin, left: titleEdgeInsets.left, bottom: 0, right: titleEdgeInsets.right)
        }
    }
}
