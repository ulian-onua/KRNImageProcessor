//
//  KRNImageResizer.swift
//  KRNImageCropper
//
//  Created by Julian Drapaylo on 22/07/2018.
//  Copyright © 2018 Julian Drapaylo. All rights reserved.
//

import UIKit

open class KRNImageResizer {
    //image scale will be used if scale is nil.
    //we have to be careful with scale because it sometimes can be a reason of logical errors
    open func resize(image : UIImage, to newSize : CGSize, scale : CGFloat? = nil, opaque : Bool = false) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, opaque, scale ?? image.scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        guard let newImage : UIImage = UIGraphicsGetImageFromCurrentImageContext() else {return nil}
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // height will be resized proportionally to width
    open func resizeProportionaly(image : UIImage, width : CGFloat) -> UIImage? {
        let coeff = image.size.width / width
        let newHeight = image.size.height / coeff
        return resize(image: image, to: CGSize(width: width, height: newHeight))
    }
    
    // width will be resized proportionally to height
    open func resizeProportionaly(image : UIImage, height : CGFloat) -> UIImage? {
        let coeff = image.size.height / height
        let newWidth = image.size.width / coeff
        return resize(image: image, to: CGSize(width: newWidth, height: height))
    }
}
