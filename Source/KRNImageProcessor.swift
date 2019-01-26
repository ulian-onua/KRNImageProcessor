//
//  KRNImageProcessor.swift
//  KRNImageCropper
//
//  Created by Julian Drapaylo on 23/07/2018.
//  Copyright © 2018 Julian Drapaylo. All rights reserved.
//

import UIKit

open class KRNImageProcessor {
    
    // resize and crop image so it will fit to newWidth and newHeight
    // can be used for any UIImageView where we don't want to scale image unproportionally but want image
    // fits full size of UIImageView frame
    
    open func resizeAndCropImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {
        
        let imageResizer = KRNImageResizer()
        let imageCropper = KRNImageCropper()
        
        
        var widthToResize = newWidth
        var heightToResize = newHeight
        
        if UIScreen.main.scale != image.scale {
            widthToResize = newWidth * UIScreen.main.scale
            heightToResize = newHeight * UIScreen.main.scale
        }
        
        guard var image2 = imageResizer.resizeProportionaly(image: image,
                                                            width: widthToResize) else {
            return nil
        }
       
        let oneSide = (image2.size.height - heightToResize) / 2
                
        if let croppedImage = imageCropper.cropSides(image: image2,
                                                     top: oneSide,
                                                     right: 0,
                                                     left: 0,
                                                     bottom: oneSide) {
            image2 = croppedImage
        }
        
        return image2
    }
}
