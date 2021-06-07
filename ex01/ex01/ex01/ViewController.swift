//
//  ViewController.swift
//  ex01
//
//  Created by Shira Broderick on 6/6/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let label: UILabel = {
		let label = UILabel()
		label.text = "Hello World !"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		return label
	}()
	
	let button: UIButton = {
		let button = UIButton()
		button.setTitle("Click me", for: .normal)
		button.setTitleColor(UIColor.systemBlue, for: .normal)
		button.setTitleColor(UIColor.red, for: .highlighted)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.titleLabel?.textAlignment = .center
		button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		return button
	}()
	
	
	@objc private func buttonAction(sender: UIButton!) {
		print("Hello World !")
	}
	private func setLayout() {
		
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 10
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.addArrangedSubview(label)
		label.widthAnchor.constraint(equalToConstant: 100).isActive = true
		label.heightAnchor.constraint(equalToConstant: 20).isActive = true
		
		stackView.addArrangedSubview(button)
		button.widthAnchor.constraint(equalToConstant: 100).isActive = true
		button.heightAnchor.constraint(equalToConstant: 20).isActive = true
		
		
		view.addSubview(stackView)
		stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		
		setLayout()
    }
}
