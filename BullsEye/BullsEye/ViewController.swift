//
//  ViewController.swift
//  BullsEye
//
//  Created by Rana on 4/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue :Int = 0
    var score :Int = 0
    var level :Int = 0
    var targetValue :Int = 0

    @IBOutlet var slider :UISlider!
    @IBOutlet var targetLabel :UILabel!
    @IBOutlet var scoreLabel :UILabel!
    @IBOutlet var levelLabel :UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startNewRound(){
        scoreLabel.text = "\(score)"
        levelLabel.text = "\(level)"
        targetValue = 1 + Int(arc4random_uniform(100))
        targetLabel.text = "\(targetValue)"
        
        currentValue = 50
        slider.setValue(Float(currentValue), animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        //if slider.value - targetvalue == 0 then add 100 to score & title = Perfect score
        //if slider.value - targetvalue < 5 then add 50 to score & title = You almost had it!
        //if slider.value - targetvalue < 10 then add nothing to score & title = Pretty good!
        //Else: title = Not even close

        var msg :String = ""
        //100 - diff + bonus
        
        let difference = abs(Int(slider.value) - targetValue)
        var temp = abs(100 - difference)
        if difference == 0 {
            temp += 100
            msg = "Perfect score!"
        }else if difference < 5 {
            temp +=  50
            msg = "You almost had it!"
        }else if difference < 10 {
            msg = "Pretty good!"
        }else{
            msg = "Not even close"
        }
        score += temp
        level += 1
        
        let alert = UIAlertController(title: msg, message: "You scored:  \(temp) points." + "\nYour value is: \(Int(slider.value))" + "\nThe target was: \(targetValue)" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion:  nil)
        
        startNewRound()

    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        
//        print("The Value of the slider is now \(slider.value)")
        currentValue = lroundf(slider.value)
        slider.setValue(Float(currentValue), animated: false)
        
    }
    
    
    @IBAction func startOver(){
        
        score = 0
        level = 0
        startNewRound()
        
    }
    
    

}

