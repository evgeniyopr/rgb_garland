//
//  DrawingViewController.swift
//  rgbGarland
//
//  Created by Evgeniy Opryshko on 16.11.2021.
//

import UIKit

class DrawingViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    //@IBOutlet private weak var stackView: UIStackView!
    
    // MARK: - Private properties
    
    private var x = 10
    private var y = 10
    let leftSwipeButton = UISwipeGestureRecognizer(target: self, action:#selector(leftSwipeButtonAction))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createStack()
        
        view.addGestureRecognizer(leftSwipeButton)
    }
    

    @objc func leftSwipeButtonAction(recognizer:UITapGestureRecognizer) {
        //You could access to sender view
        print(recognizer.view)
    }
    
    func createStack() {
        
        let view = UIView()
        view.backgroundColor = .red
        
        let list = [["A", "B", "C", "D", "E"], ["F", "G", "H", "I", "J"], ["K","L", "M", "N", "O"], ["P", "Q","R", "S", "T"], ["U", "V", "W","X", "Y"], ["Z"]]
        var groups = [UIStackView]()
        
        for i in list {
            let group = createButtons(named: i)
            let subStackView = UIStackView(arrangedSubviews: group)
            subStackView.axis = .horizontal
            subStackView.distribution = .fillEqually
            subStackView.spacing = 1
            groups.append(subStackView)
        }
        
        let stackView = UIStackView(arrangedSubviews: groups)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint (equalTo: self.view.leadingAnchor,  constant: 0).isActive = true
        stackView.topAnchor.constraint     (equalTo: self.view.topAnchor,      constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint  (equalTo: self.view.bottomAnchor,   constant: 0).isActive = true
    }
    
    func createButtons(named: [String]) -> [UIButton] {
        return named.map { letter in
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(letter, for: .normal)
            button.backgroundColor = .green
            button.setTitleColor( .blue , for: .normal)
            //button.addTarget(self, action:#selector(buttonClicked), for: .touchDragExit)
            button.addTarget(self, action:#selector(buttonClicked), for: .touchDragEnter)
            
            
            
//            button.cancelsTouchesInView = true
//            button.delaysTouchesBegan = true
            return button
        }
    }
    
    @objc func buttonClicked(sender: UIButton) {

        print(sender.titleLabel?.text)
    }
    
    
    
}

