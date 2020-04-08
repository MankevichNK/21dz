//
//  ViewController.swift
//  21dz
//
//  Created by Пользователь on 4/8/20.
//  Copyright © 2020 Пользователь. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var graySwitch: UISwitch!
    @IBOutlet weak var blurSwitch: UISwitch!
    @IBOutlet weak var sliderChange: UISlider!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func refreshButton(_ sender: Any) {
        let url = generateURL()
        imageView.sd_setImage(with: url, placeholderImage: nil, options: .fromLoaderOnly)
    }
    private func generateURL() -> URL {
        var stringURL = "https://picsum.photos/1920/1080?"
        if graySwitch.isOn {
            stringURL.append("grayscale")
        }
        
        if blurSwitch.isOn {
            let blurValue = Int(sliderChange.value)
            if graySwitch.isOn {
                stringURL.append("&")
            }
            stringURL.append("blur=\(blurValue)")
        }
        let url = URL(string: stringURL)!
        return url
    }
}

