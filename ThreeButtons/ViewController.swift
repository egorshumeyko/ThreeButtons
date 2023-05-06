//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Егор Шумейко on 06.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let firstButton = CustomButton(title: "First Button")
    
    private let secondButton = CustomButton(title: "Second Middle Button")
    
    private let thirdButton = CustomButton(title: "Third Button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(presentModal), for: .touchUpInside)
        setUpConstraits()
    }

    @objc func presentModal() {
        let modalVC = UIViewController()
        modalVC.view.backgroundColor = .white
        present(modalVC, animated: true)
    }
        
    @objc func tappedButton(sender: CustomButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
            sender.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        } completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
                sender.transform = CGAffineTransform.identity
            }
        }
    }
    
    func  setUpConstraits() {
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

