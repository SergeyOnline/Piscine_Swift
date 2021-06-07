//
//  ViewController.swift
//  ex02
//
//  Created by Shira Broderick on 6/6/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import UIKit

let corner: CGFloat = 1

func setButton(_ button: UIButton, label: String, titleColor: UIColor, bcgrndColor: UIColor) {
	button.setTitle(label, for: .normal)
	button.setTitleColor(titleColor, for: .normal)
	button.backgroundColor = bcgrndColor
	button.translatesAutoresizingMaskIntoConstraints = false
	button.titleLabel?.textAlignment = .center
	button.layer.cornerRadius = corner
}

class ViewController: UIViewController {

	private enum Sign: String {
		case addition = "+"
		case substraction = "-"
		case multiplication = "*"
		case division = "/"
		case empty = "0"
	}
	
	private var numOne = 0
	private var numTwo = 0
	private var signLabel: Sign = .empty
	private var resultFlag = false
	private var signFlag: Sign = .empty
	private var statusNum = ""
	
	let display: UILabel = {
		let label = UILabel()
		label.font = label.font.withSize(40)
		label.text = "0"
		label.textAlignment = .right
		label.textColor = .white
		label.adjustsFontSizeToFitWidth = true
		label.numberOfLines = 1
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let numbers: [UIButton] = {
		var arr: [UIButton] = []
		for i in 0..<10 {
			let button = UIButton()
			setButton(button, label: String(i), titleColor: UIColor.black, bcgrndColor: UIColor.systemGray)
			button.tag = i
			button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
			arr.append(button)
		}
		return arr
	}()
	
	let acButton: UIButton = {
		let button = UIButton()
		setButton(button, label: "AC", titleColor: UIColor.black, bcgrndColor: UIColor.systemOrange)
		button.tag = 11
		button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
		return button
	}()
	
	let negButton: UIButton = {
		let button = UIButton()
		setButton(button, label: "NEG", titleColor: UIColor.black, bcgrndColor: UIColor.systemOrange)
		button.tag = 12
		button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
		return button
	}()
	
	let addButton: UIButton = {
		let button = UIButton()
		setButton(button, label: "+", titleColor: UIColor.black, bcgrndColor: UIColor.systemOrange)
		button.tag = 13
		button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
		return button
	}()
	
	let subButton: UIButton = {
		let button = UIButton()
		setButton(button, label: "-", titleColor: UIColor.black, bcgrndColor: UIColor.systemOrange)
		button.tag = 14
		button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
		return button
	}()
	
	let multButton: UIButton = {
		let button = UIButton()
		setButton(button, label: "*", titleColor: UIColor.black, bcgrndColor: UIColor.systemOrange)
		button.tag = 15
		button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
		return button
	}()
	
	let divButton: UIButton = {
		let button = UIButton()
		setButton(button, label: "/", titleColor: UIColor.black, bcgrndColor: UIColor.systemOrange)
		button.tag = 16
		button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
		return button
	}()
	
	let equalButton: UIButton = {
		let button = UIButton()
		setButton(button, label: "=", titleColor: UIColor.black, bcgrndColor: UIColor.systemOrange)
		button.tag = 17
		button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
		return button
	}()
	
	private func solutionTask(sign: Sign) -> Int {
		let result: Int
		switch sign {
		case .addition:
			result = numOne + numTwo
		case .division:
			result = numOne - numTwo
		case .multiplication:
			result = numOne * numTwo
		case .substraction:
			result = numOne / numTwo
		case.empty:
			return 0
		}
		return result
	}
	
	@objc func buttonsAction(_ sender: UIButton) {
		if display.text?.first == "0" && display.text?.count == 1 || display.text == "Error" {
			display.text = ""
		}
		
		if sender.tag > 0 && sender.tag <= 9 {
			if resultFlag == false {
				display.text?.append(String(sender.tag))
			} else {
				resultFlag = false
				display.text = ""
				display.text?.append(String(sender.tag))
			}
		}
		
		switch sender.titleLabel?.text {
		case "AC":
			signLabel = .empty
			display.text = "0"
			statusNum = ""
			numOne = 0
			numTwo = 0
		case "NEG":
			let number = Int(display.text!) ?? 0
			if number != 0 {
				display.text = String(-number)
			} else {
				display.text = "0"
			}
		case "0":
			display.text?.append("0")
		case "+":
			signLabel = .addition
			if statusNum != "" {
				numTwo = Int(display.text!) ?? 0
				numOne = Int(statusNum)!
				statusNum = String(self.solutionTask(sign: signFlag))
				display.text = "0"
				numOne = Int(statusNum)!
				resultFlag = true
			} else {
				numOne = Int(display.text!) ?? 0
				statusNum = String(numOne)
				display.text = "0"
			}
			signFlag = .addition
		case "-":
			signLabel = .division
			if statusNum != "" {
				numTwo = Int(display.text!) ?? 0
				numOne = Int(statusNum)!
				statusNum = String(self.solutionTask(sign: signFlag))
				display.text = "0"
				numOne = Int(statusNum)!
				resultFlag = true
			} else {
				numOne = Int(display.text!) ?? 0
				statusNum = String(numOne)
				display.text = "0"
			}
			signFlag = .addition
		case "*":
			signLabel = .multiplication
			if statusNum != "" {
				numTwo = Int(display.text!) ?? 0
				numOne = Int(statusNum)!
				statusNum = String(self.solutionTask(sign: signFlag))
				display.text = "0"
				numOne = Int(statusNum)!
				resultFlag = true
			} else {
				numOne = Int(display.text!) ?? 0
				statusNum = String(numOne)
				display.text = "0"
			}
			signFlag = .multiplication
		case "/":
			signLabel = .substraction
			if statusNum != "" {
				numTwo = Int(display.text!) ?? 0
				numOne = Int(statusNum)!
				statusNum = String(self.solutionTask(sign: signFlag))
				display.text = "0"
				numOne = Int(statusNum)!
				resultFlag = true
			} else {
				numOne = Int(display.text!) ?? 0
				statusNum = String(numOne)
				display.text = "0"
			}
			signFlag = .substraction
		case "=":
			numTwo = Int(display.text!) ?? 0
			if signLabel == .substraction && numTwo == 0 {
				display.text = "Error"
			} else {
				display.text = String(solutionTask(sign: signLabel))
			}
			resultFlag = true
			numOne = 0
			numTwo = 0
			statusNum = ""
			signFlag = .empty
		default:
			break
		}
	}
	
	private func setElements() {
		
		let vStackMain = UIStackView()
		vStackMain.axis = .vertical
		vStackMain.spacing = 6
		vStackMain.distribution = .fillEqually
		vStackMain.translatesAutoresizingMaskIntoConstraints = false
		
		let vStackView = UIStackView()
		vStackView.axis = .horizontal
		vStackView.spacing = 6
		vStackView.distribution = .fillProportionally
		vStackView.translatesAutoresizingMaskIntoConstraints = false
		
		let vStackNumbers = UIStackView()
		vStackNumbers.axis = .vertical
		vStackNumbers.spacing = 6
		vStackNumbers.distribution = .fillEqually
		vStackNumbers.translatesAutoresizingMaskIntoConstraints = false
		
		
		var offset = 0;
		
		for _ in 1...3 {
			let hStackView = UIStackView()
			hStackView.axis = .horizontal
			hStackView.spacing = 6
			hStackView.distribution = .fillEqually
			hStackView.translatesAutoresizingMaskIntoConstraints = false
			for i in 1...3 {
				hStackView.addArrangedSubview(numbers[offset + i])
				
			}
			offset += 3
			vStackNumbers.addArrangedSubview(hStackView)
		}
		
		let vStackOther = UIStackView()
		vStackOther.axis = .vertical
		vStackOther.spacing = 6
		vStackOther.distribution = .fillEqually
		vStackOther.translatesAutoresizingMaskIntoConstraints = false
		
		offset = 0
		
		for i in 1...3 {
			let hStackView = UIStackView()
			hStackView.axis = .horizontal
			hStackView.spacing = 6
			hStackView.distribution = .fillEqually
			hStackView.translatesAutoresizingMaskIntoConstraints = false
			switch i {
			case 1:
				hStackView.addArrangedSubview(acButton)
				hStackView.addArrangedSubview(negButton)
			case 2:
				hStackView.addArrangedSubview(addButton)
				hStackView.addArrangedSubview(multButton)
			case 3:
				hStackView.addArrangedSubview(subButton)
				hStackView.addArrangedSubview(divButton)
			default:
				break
			}
			offset += 3
			vStackOther.addArrangedSubview(hStackView)
		}
		vStackNumbers.addArrangedSubview(numbers[0])
		vStackOther.addArrangedSubview(equalButton)
		
		vStackView.addArrangedSubview(vStackNumbers)
		vStackView.addArrangedSubview(vStackOther)
			
		vStackMain.addArrangedSubview(display)
		vStackMain.addArrangedSubview(vStackView)
	
		view.addSubview(vStackMain)
		vStackMain.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		vStackMain.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		vStackMain.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
		vStackMain.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9).isActive = true
	}
	
    override func viewDidLoad() {
		
        super.viewDidLoad()
		self.view.backgroundColor = .darkGray
		
		setElements()
    }
    


}
