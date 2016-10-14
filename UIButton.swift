//
//  UIButton.swift
//  ImagePosition
//
//  Created by Bohdan Savych on 10/1/16.
//  Copyright © 2016 BBB. All rights reserved.
//

import Foundation
import UIKit

typealias twoDimensionalPosition = (horizontalPostion: HorizontalPosition, vericalPostion: VerticalPosition)
typealias twoDimensionalOffset = (horizontalOffset: Double, veticalOffset: Double)

enum HorizontalPosition {
    case Left,
    Right,
    Center
}

enum VerticalPosition {
    case Top,
    Bottom,
    Center
}

extension UIButton {
    func setupImageInButton(withPosition imagePosition: twoDimensionalPosition?,
                                         imageOffset: twoDimensionalOffset?,
                                         textPosition: twoDimensionalPosition?,
                                         textOffset: twoDimensionalOffset?) {
        guard let imageViewFrame = imageView?.frame, labelFrame = titleLabel?.frame else {
                return
        }
        
        let unwrappedImagePosition = imagePosition ?? (.Center, .Center)
        let unwrappedImageOffset = imageOffset ?? (0, 0)
        let unwrappedTextPosition = textPosition ?? (.Center, .Center)
        let unwrappedTextOffset = textOffset ?? (0, 0)
        
        contentHorizontalAlignment = .Left
        contentVerticalAlignment = .Top

        let buttonWidth = bounds.width
        let buttonHeight = bounds.height
        
        switch unwrappedImagePosition.horizontalPostion {
        case .Left:
            imageEdgeInsets = UIEdgeInsetsMake(0, CGFloat(unwrappedImageOffset.horizontalOffset), 0, 0)
        case .Right:
            let imageViewXOrigin = buttonWidth - imageViewFrame.width
            imageEdgeInsets = UIEdgeInsetsMake(0, imageViewXOrigin - CGFloat(unwrappedImageOffset.horizontalOffset), 0, 0)
        case .Center:
            let imageViewXOrigin = (buttonWidth - imageViewFrame.width) / 2.0
            imageEdgeInsets = UIEdgeInsetsMake(0, imageViewXOrigin, 0, 0)
        }
        
        switch unwrappedImagePosition.vericalPostion {
        case .Top:
            imageEdgeInsets = UIEdgeInsetsMake(CGFloat(unwrappedImageOffset.veticalOffset),imageEdgeInsets.left, 0, imageEdgeInsets.right)
        case .Bottom:
            let imageViewYOrigin = buttonHeight - imageViewFrame.height
            imageEdgeInsets = UIEdgeInsetsMake(imageViewYOrigin - CGFloat(unwrappedImageOffset.veticalOffset), imageEdgeInsets.left, 0, imageEdgeInsets.right)
        case .Center:
            let imageViewYOrigin = (buttonHeight - imageViewFrame.height) / 2.0
            imageEdgeInsets = UIEdgeInsetsMake(imageViewYOrigin, imageEdgeInsets.left, 0, imageEdgeInsets.right)
        }
        
        switch unwrappedTextPosition.horizontalPostion {
        case .Left:
            let textXOrigin = -imageViewFrame.width + CGFloat(unwrappedTextOffset.horizontalOffset)
            titleEdgeInsets = UIEdgeInsetsMake(0, textXOrigin, 0, 0)
        case .Center:
            let textXOrigin = ((buttonWidth - labelFrame.width) / 2.0) - imageViewFrame.width
            titleEdgeInsets = UIEdgeInsetsMake(0, textXOrigin, 0, 0)
        case .Right:
            let textXOrigin = (buttonWidth - labelFrame.width - CGFloat(unwrappedTextOffset.horizontalOffset) - imageViewFrame.width)
            titleEdgeInsets = UIEdgeInsetsMake(0, textXOrigin, 0, 0)
        }
        
        switch unwrappedTextPosition.vericalPostion {
        case .Top:
            titleEdgeInsets = UIEdgeInsetsMake(CGFloat(unwrappedTextOffset.veticalOffset), titleEdgeInsets.left, 0, titleEdgeInsets.right)
        case .Center:
            let textYOrigin = (buttonHeight - labelFrame.height) / 2.0
            titleEdgeInsets = UIEdgeInsetsMake(textYOrigin, titleEdgeInsets.left, 0, titleEdgeInsets.right)
        case .Bottom:
            let textYOrigin = buttonHeight - labelFrame.height - CGFloat(unwrappedTextOffset.veticalOffset)
            titleEdgeInsets = UIEdgeInsetsMake(textYOrigin, titleEdgeInsets.left, 0, titleEdgeInsets.right)
        }
    }
    
    func setupImageInButton(withPosition imagePosition: twoDimensionalPosition?,
                                         imageOffset: twoDimensionalOffset?) {
        setupImageInButton(withPosition: imagePosition, imageOffset: imageOffset, textPosition: nil, textOffset: nil)
    }
    
    func setupTextInButton(withPosition textPosition: twoDimensionalPosition?,
                                        textOffset: twoDimensionalOffset?) {
        setupImageInButton(withPosition: nil, imageOffset: nil, textPosition: textPosition, textOffset: textOffset)
    }
}