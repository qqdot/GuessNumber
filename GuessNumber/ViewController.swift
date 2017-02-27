//
//  ViewController.swift
//  GuessNumber
//
//  Created by clai on 2017/2/27.
//  Copyright © 2017年 clai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var minNum = 0
    var maxNum = 100
    var timer = 5
    var answer = arc4random_uniform(100) + 1
    
    
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var bingoLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func resetButton(_ sender: UIButton) {
        timer = 5
        minNum = 0
        maxNum = 100
        answer = arc4random_uniform(100) + 1
        bingoLabel.isHidden = true
        tipLabel.isHidden = true
        resetButton.isHidden = true
        submitButton.isHidden = false
        numTextField.text = ""
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        
        if numTextField.text == "" || Int(numTextField.text!)! > 100 || Int(numTextField.text!)! < 0{
            bingoLabel.text = "請輸入正確數值"
            bingoLabel.isHidden = false
            tipLabel.isHidden = true
            resetButton.isHidden = true
            submitButton.isHidden = false
        }else{
            if Int(numTextField.text!)! == Int(answer){
                    bingoLabel.text = "Bingo"
                    msgMode()
            }else{
                
                if timer == 0{
                    bingoLabel.text = "YY 沒機會了, 答案是\(answer)"
                    msgMode()
                }else{
                    if Int(numTextField.text!)! > Int(answer){
                        maxNum = Int(numTextField.text!)!
                    }else if Int(numTextField.text!)! < Int(answer){
                        minNum = Int(numTextField.text!)!
                    }
                    tipLabel.text = "提示：\(minNum)~\(maxNum), 剩下\(timer)次機會"
                    timer = timer - 1
                    guessMode()
                }
            }
            
        }
    }
    
    func msgMode(){
        bingoLabel.isHidden = false
        tipLabel.isHidden = true
        resetButton.isHidden = false
        submitButton.isHidden = true
    }
    
    func guessMode(){
        bingoLabel.isHidden = true
        tipLabel.isHidden = false
        resetButton.isHidden = true
        submitButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

