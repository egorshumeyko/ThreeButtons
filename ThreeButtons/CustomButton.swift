//
//  CustomButton.swift
//  ThreeButtons
//
//  Created by Егор Шумейко on 06.05.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        backgroundColor = .systemBlue
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        imageView?.tintColor = .white
        semanticContentAttribute = .forceRightToLeft
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tintColorDidChange() {
        if tintAdjustmentMode == .dimmed {
            backgroundColor = .gray
        } else {
            backgroundColor = .systemBlue
        }
    }
}
