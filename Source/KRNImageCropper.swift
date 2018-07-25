//
//  KRNImageCropper.swift
//  KRNImageCropper
//
//  Created by Julian Drapaylo on 22/07/2018.
//  Copyright © 2018 Julian Drapaylo. All rights reserved.
//

import UIKit

open class KRNImageCropper {
    open func crop(image : UIImage, rect : CGRect) -> UIImage?  {
        guard let imageRef = image.cgImage?.cropping(to: rect) else {return nil}
        return UIImage(cgImage: imageRef)
    }
    
    open func crop(image : UIImage, origin : CGPoint, size : CGSize) -> UIImage? {
        let rect = CGRect.init(x: origin.x, y: origin.y, width: size.width, height: size.height)
        return crop(image: image, rect: rect)
    }
    
    //MARK: Crop image part from every side
    open func cropFromTopToBottom(image : UIImage, height : CGFloat) -> UIImage? {
        return crop(image: image, rect: CGRect(x: 0, y: 0, width: image.size.width, height: height))
    }
    
    open func cropFromBottomToTop(image : UIImage, height : CGFloat) -> UIImage? {
        return crop(image: image, rect: CGRect(x: 0, y: image.size.height - height, width: image.size.width, height: height))
    }
    
    open func cropFromLeftToRight(image : UIImage, width : CGFloat) -> UIImage? {
        return crop(image: image, rect: CGRect(x: 0, y: 0, width: width, height: image.size.height))
    }
    
    open func cropFromRightToLeft(image : UIImage, width : CGFloat) -> UIImage? {
        return crop(image: image, rect: CGRect(x: image.size.width - width, y: 0, width: width, height: image.size.height))
    }
    
    //MARK: Crop rectangle where start is center of the image
    
    open func cropRectangleFromCenter(image : UIImage, width : CGFloat, height : CGFloat) -> UIImage? {
        let centerPoint = CGPoint.init(x: image.size.width / 2, y: image.size.height / 2)
        
        let startX = centerPoint.x - width / 2
        let startY = centerPoint.y - height / 2
        
        return crop(image: image, rect: CGRect(x: startX, y: startY, width: width, height: height))
    }
    
    open func cropSquareFromCenter(image : UIImage, squareSide : CGFloat) -> UIImage? {
        return cropRectangleFromCenter(image: image, width: squareSide, height: squareSide)
    }
    
    //MARK: Crop image from sides
    open func cropSides(image : UIImage, top : CGFloat = 0.0, right : CGFloat = 0.0, left : CGFloat = 0.0, bottom : CGFloat = 0.0) -> UIImage? {
        let x = left
        let y = top
        let width = image.size.width - (left + right)
        let height = image.size.height - (top + bottom)
        
        return crop(image: image, rect: CGRect(x: x,
                                               y: y,
                                               width: width,
                                               height: height))
    }
}

