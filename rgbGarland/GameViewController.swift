//
//  GameViewController.swift
//  rgbGarland
//
//  Created by Evgeniy Opryshko on 17.11.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    var blu: BluetoothSerial?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    
    @IBAction func game(_ sender: Any) {
        let msg = Action.text(text: "TEST").msg
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction func pause(_ sender: Any) {
        let msg = Action.pause.msg
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction private func forwardAct(_ sender: Any) {
        let msg = Action.forward.msg
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction private func rightAct(_ sender: Any) {
        let msg = Action.right.msg
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction private func backAct(_ sender: Any) {
        let msg = Action.back.msg
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction private func leftAct(_ sender: Any) {
        let msg = Action.left.msg
        blu?.sendMessageToDevice(msg)
    }
    
}
