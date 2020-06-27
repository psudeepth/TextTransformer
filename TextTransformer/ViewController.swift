//
//  ViewController.swift
//  TextTransformer
//
//  Created by Sudeepth Patinjarayil on 26/06/20.
//  Copyright © 2020 Sudeepth Patinjarayil. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {
    @IBOutlet weak var TXT_input: NSTextField!
    @IBOutlet weak var SEG_type: NSSegmentedControl!
    @IBOutlet weak var TXT_output: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TypeChanged(self)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func TypeChanged(_ sender: Any) {
        switch SEG_type.selectedSegment{
        case 0:
            TXT_output.stringValue = rot13(TXT_input.stringValue)
        case 1:
            TXT_output.stringValue = similar(TXT_input.stringValue)
        case 2:
            TXT_output.stringValue = strike(TXT_input.stringValue)
        default:
            TXT_output.stringValue = zalgo(TXT_input.stringValue)
        }
    }
    
    @IBAction func CopyToClipboard(_ sender: Any) {
    }
    
    func controlTextDidChange(_ obj: Notification) {
        TypeChanged(self)
    }
    
    func rot13(_ input: String) -> String{
        return "ROT13: " + input
    }
    
    func similar(_ input: String) -> String{
        return "Similar: " + input
    }
    
    func strike(_ input: String) -> String{
        var output = ""
        
        for each in input{
            output.append(each)
            output.append("\u{0335}")
        }
        
        return output
    }
    
    func zalgo(_ input: String) -> String{
        return "Zalgo: " + input
    }
}

