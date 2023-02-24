//
//  ViewController.swift
//  Rikkun
//
//  Created by Yuki Kuwashima on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    let originalImage: UIImage = UIImage(named: "image")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = originalImage
    }
    
    @IBAction func onSliderChange(_ slider: UISlider) {
        imageView.image = ImageFilter.blur(image: originalImage, blurSize: slider.value)
    }
}
