//
//  ViewController.swift
//  rgbGarland
//
//  Created by Evgeniy Opryshko on 16.11.2021.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    private var blu: BluetoothSerial?
    
    @IBOutlet private weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blu = BluetoothSerial(delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        blu?.startScan()
    }
    
    @IBAction func routine(_ sender: UISwitch) {
        let startRoutine = Action.startRoutine.msg
        let stopRoutine = Action.stopRoutine.msg
        
        let msg = sender.isOn ? startRoutine : stopRoutine
        blu?.sendMessageToDevice(msg)
    }
    
    @IBAction func didTouchConnect(_ sender: Any) {
        blu?.startScan()
    }
    
    @IBAction func didTouchDisconnect(_ sender: Any) {
        blu?.disconnect()
    }

    @IBAction func didTouchDrawing(_ sender: Any) {
        let drawingViewController = self.storyboard?.instantiateViewController(withIdentifier: "drawingViewController") as! DrawingViewController
        self.navigationController?.pushViewController(drawingViewController, animated: true)
    }
    
    @IBAction func didTouchGame(_ sender: Any) {
        let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameViewController") as! GameViewController
        gameViewController.blu = blu
        self.navigationController?.pushViewController(gameViewController, animated: true)
    }
    
    @IBAction func didTouchText(_ sender: Any) {
        let textViewController = self.storyboard?.instantiateViewController(withIdentifier: "textViewController") as! TextViewController
        textViewController.blu = blu
        self.navigationController?.pushViewController(textViewController, animated: true)
    }
    
    
    
}

// MARK: - BluetoothSerialDelegate

extension ViewController: BluetoothSerialDelegate {
    
    func serialDidChangeState() {
        statusLabel.text = "serialDidChangeState"
        print("serialDidChangeState")
    }
    
    func serialDidDisconnect(_ peripheral: CBPeripheral, error: NSError?) {
        statusLabel.text = "serialDidDisconnect"
        print("serialDidDisconnect")
    }
    
    func serialDidReceiveString(_ message: String) {
        statusLabel.text = "serialDidReceiveString"
        print("serialDidReceiveString")
    }
    
    func serialDidReceiveBytes(_ bytes: [UInt8]) {
        statusLabel.text = "serialDidReceiveBytes"
        print("serialDidReceiveBytes")
    }
    
    func serialDidReceiveData(_ data: Data) {
        statusLabel.text = "serialDidReceiveData"
        print("serialDidReceiveData")
    }
    
    func serialDidReadRSSI(_ rssi: NSNumber) {
        statusLabel.text = "serialDidReadRSSI"
        print("serialDidReadRSSI")
    }
    
    func serialDidDiscoverPeripheral(_ peripheral: CBPeripheral, RSSI: NSNumber?) {
        statusLabel.text = "serialDidDiscoverPeripheral"
        blu?.connectToPeripheral(peripheral)
    }
    
    func serialDidConnect(_ peripheral: CBPeripheral) {
        statusLabel.text = "serialDidConnect"
        print("serialDidConnect")
    }
    
    func serialDidFailToConnect(_ peripheral: CBPeripheral, error: NSError?) {
        statusLabel.text = "serialDidFailToConnect"
        print("serialDidFailToConnect")
    }
    
    func serialIsReady(_ peripheral: CBPeripheral) {
        statusLabel.text = "serialIsReady"
        print("serialIsReady")
    }
    
    
}
