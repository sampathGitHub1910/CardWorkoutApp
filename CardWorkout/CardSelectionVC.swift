//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by RPS on 05/06/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var CardImageView: UIImageView!
    @IBOutlet var Btns: [UIButton]!
    
    var timer: Timer!
    var cards: [UIImage] = Card.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        for btn in Btns {
            btn.layer.cornerRadius = 8
        }
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(showRandomImage),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    @objc func showRandomImage() {
        CardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    @IBAction func stopBtn(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
