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
    func setupImageInButton(imagePosition: ContentPosition? = nil,
                            imageOffset: ContentOffset? = nil,
                            textPosition: ContentPosition? = nil,
                            textOffset: ContentOffset? = nil) {
        guard let imageViewFrame = imageView?.frame, let labelFrame = titleLabel?.frame else {
                return
        }
        
        let imagePosition = imagePosition ?? (.center, .center)
        let imageOffset = imageOffset ?? (0, 0)
        let textPosition = textPosition ?? (.center, .center)
        let textOffset = textOffset ?? (0, 0)
        
        contentHorizontalAlignment = .left
        contentVerticalAlignment = .top

        let buttonWidth = bounds.width
        let buttonHeight = bounds.height
        
        switch imagePosition.horizontal {
        case .left:
            imageEdgeInsets = UIEdgeInsetsMake(0, CGFloat(imageOffset.horizontal), 0, 0)
        case .right:
            let imageViewXOrigin = buttonWidth - imageViewFrame.width
            imageEdgeInsets = UIEdgeInsetsMake(0, imageViewXOrigin - CGFloat(imageOffset.horizontal), 0, 0)
        case .center:
            let imageViewXOrigin = (buttonWidth - imageViewFrame.width) / 2.0
            imageEdgeInsets = UIEdgeInsetsMake(0, imageViewXOrigin, 0, 0)
        }
        
        switch imagePosition.vertical {
        case .top:
            imageEdgeInsets = UIEdgeInsetsMake(CGFloat(imageOffset.vertical),imageEdgeInsets.left, 0, imageEdgeInsets.right)
        case .bottom:
            let imageViewYOrigin = buttonHeight - imageViewFrame.height
            imageEdgeInsets = UIEdgeInsetsMake(imageViewYOrigin - CGFloat(imageOffset.vertical), imageEdgeInsets.left, 0, imageEdgeInsets.right)
        case .center:
            let imageViewYOrigin = (buttonHeight - imageViewFrame.height) / 2.0
            imageEdgeInsets = UIEdgeInsetsMake(imageViewYOrigin, imageEdgeInsets.left, 0, imageEdgeInsets.right)
        }
        
        switch textPosition.horizontal {
        case .left:
            let textXOrigin = -imageViewFrame.width + CGFloat(textOffset.horizontal)
            titleEdgeInsets = UIEdgeInsetsMake(0, textXOrigin, 0, 0)
        case .center:
            let textXOrigin = ((buttonWidth - labelFrame.width) / 2.0) - imageViewFrame.width
            titleEdgeInsets = UIEdgeInsetsMake(0, textXOrigin, 0, 0)
        case .right:
            let textXOrigin = (buttonWidth - labelFrame.width - CGFloat(textOffset.horizontal) - imageViewFrame.width)
            titleEdgeInsets = UIEdgeInsetsMake(0, textXOrigin, 0, 0)
        }
        
        switch textPosition.vertical {
        case .top:
            titleEdgeInsets = UIEdgeInsetsMake(CGFloat(textOffset.vertical), titleEdgeInsets.left, 0, titleEdgeInsets.right)
        case .center:
            let textYOrigin = (buttonHeight - labelFrame.height) / 2.0
            titleEdgeInsets = UIEdgeInsetsMake(textYOrigin, titleEdgeInsets.left, 0, titleEdgeInsets.right)
        case .bottom:
            let textYOrigin = buttonHeight - labelFrame.height - CGFloat(textOffset.vertical)
            titleEdgeInsets = UIEdgeInsetsMake(textYOrigin, titleEdgeInsets.left, 0, titleEdgeInsets.right)
        }
    }
}
