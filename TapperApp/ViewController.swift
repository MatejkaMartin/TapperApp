//
//  ViewController.swift
//  TapperApp
//
//  Created by Martin Matějka on 06.03.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//OUtlets
    
    @IBOutlet weak var nadpisImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
//Variables
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    @IBAction func onKlikacJeZmacknut(sender: UIButton!)
    {
        currentTaps += 1
        updateTapsLabel()
        
        if isGameOver(){
            restartGame()
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!){
       
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            nadpisImg.hidden = true
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            updateTapsLabel()
            
            
            
        }
        
    }
    
    func updateTapsLabel(){
        tapsLbl.text = "\(currentTaps) Kliků"
    }
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    
}

    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        nadpisImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapsLbl.hidden = true
        tapBtn.hidden = true
        
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}