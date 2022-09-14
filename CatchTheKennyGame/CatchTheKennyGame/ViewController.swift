//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Ahmet Ozkan on 14.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var hightScore: UILabel!
    
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    var scoreValue = 0
    var timerValue = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScoreValue = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let storedHighScore =  UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScoreValue = 0
            hightScore.text = "HighScore : \(highScoreValue)"
        }
        if let newScore = storedHighScore as? Int{
            highScoreValue = newScore
            hightScore.text = "HighScore : \(highScoreValue)"
        }
        
        score.text = "Score : \(scoreValue)"
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
  

        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny6,kenny7,kenny8,kenny9]

        
        
        counter = 10
        timer.text = String(counter)
        
        timerValue = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        hideKenny()
    }
    
    @objc func hideKenny(){
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        
        let randomKenny = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[randomKenny].isHidden = false
    }
    
    @objc func increaseScore(){
        scoreValue += 1
        score.text = "Score : \(scoreValue)"
        
    }
    
    @objc func countDown(){
        counter -= 1
        timer.text = String(counter)
        
        if counter == 0 {
            timerValue.invalidate()
            hideTimer.invalidate()
            for kenny in kennyArray{
                kenny.isHidden = true
            }
            
            if self.scoreValue > self.highScoreValue{
                self.highScoreValue = self.scoreValue
                hightScore.text = "HightScore : \(self.highScoreValue)"
                UserDefaults.standard.set(self.highScoreValue, forKey: "highscore")
            }
            
            let alert = UIAlertController(title: "Time's up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay function
                self.scoreValue = 0
                self.score.text = "Score: \(self.scoreValue)"
                self.counter = 10
                self.timer.text = String(self.counter)
            
                
                self.timerValue = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            
            self.present(alert, animated: true, completion: nil)
        }

    }
}

