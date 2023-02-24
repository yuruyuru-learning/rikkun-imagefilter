//
//  ImageFilter.swift
//  Rikkun
//
//  Created by Yuki Kuwashima on 2023/02/24.
//

import UIKit
import CoreImage.CIFilterBuiltins

class ImageFilter {
    
    // 新規フィルターのテンプレート
    static func templateFilter(image: UIImage, パラメーター1の名前: Float, パラメーター2の名前: Float) -> UIImage {
        //ここの数行はフィルターごとに変えてね！
        let filter = CIFilter.gaussianBlur()
        filter.inputImage = CIImage(image: image)!
        filter.radius = パラメーター1の名前
        
        //ここの2行はいじらない！
        let resultImage: CIImage! = filter.outputImage
        return generateUIImage(ciimage: resultImage, originalUIImage: image)
    }
    
    static func blur(image: UIImage, blurSize: Float) -> UIImage {
        let filter = CIFilter.gaussianBlur()
        filter.inputImage = CIImage(image: image)!
        filter.radius = blurSize
        
        let resultImage: CIImage! = filter.outputImage
        return generateUIImage(ciimage: resultImage, originalUIImage: image)
    }
    private static func generateUIImage(ciimage: CIImage!, originalUIImage: UIImage!) -> UIImage {
        let cgImage = CIContext().createCGImage(ciimage, from: ciimage.extent)
        let uiImage = UIImage(cgImage: cgImage!, scale: UIScreen.main.scale, orientation: originalUIImage.imageOrientation)
        return uiImage
    }
}
