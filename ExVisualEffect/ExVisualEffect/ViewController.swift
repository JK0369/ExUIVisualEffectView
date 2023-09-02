//
//  ViewController.swift
//  ExVisualEffect
//
//  Created by 김종권 on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    let backgroundImageView = {
        let backgroundImageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }()
    let label = {
        let titleLabel = UILabel()
        titleLabel.text = "iOS 앱 개발 알아가기 Blur 효과"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.sizeToFit()
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = view.bounds
        
        setLightBlur(blurEffectStyle: .light)
        setColorEffect(blurEffectStyle: .dark)
    }
    
    private func setLightBlur(blurEffectStyle: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: blurEffectStyle)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = view.bounds
        
        backgroundImageView.addSubview(effectView)
        effectView.contentView.addSubview(label)
        label.center = view.center
    }
    private func setColorEffect(blurEffectStyle: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: blurEffectStyle)
        let colorEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let effectView = UIVisualEffectView(effect: colorEffect)
        effectView.frame = view.bounds
        
        backgroundImageView.addSubview(effectView)
        effectView.contentView.addSubview(label)
        label.center = view.center
    }
}
