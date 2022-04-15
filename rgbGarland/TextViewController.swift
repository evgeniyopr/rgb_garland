//
//  TextViewController.swift
//  rgbGarland
//
//  Created by Evgeniy Opryshko on 17.11.2021.
//

import UIKit


class TextViewController: UIViewController {
    
    // MARK: - Public properties
    
    var blu: BluetoothSerial?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    
    @IBAction func sendAct(_ sender: Any) {
        guard let text = textField.text else { return }
        
        let msg = Action.text(text: text).msg
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction func startAct(_ sender: Any) {
        let msg = Action.textControl(act: .start).msg
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction func stopAct(_ sender: Any) {
        let msg = Action.textControl(act: .stop).msg
        blu?.sendMessageToDevice(msg)
    }
    
}
