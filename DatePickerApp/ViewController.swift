//
//  ViewController.swift
//  DatePickerApp
//
//  Created by Mac on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var datelabel: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var timerPicker: UIDatePicker!
    
    @IBOutlet var fireTimer: UIButton!
    
    var counter = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.calendar = .autoupdatingCurrent
        datePicker.preferredDatePickerStyle = .wheels
        
        timerPicker.locale = Locale(identifier: "ru_RU")
        
        fireTimer.layer.cornerRadius = 10
    }

    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let date = dateFormatter.string(from: sender.date)
        
        datelabel.text = date
    }
    
    @IBAction func fireTimerButtonTapped() {
        counter = Int(timerPicker.countDownDuration)
        timerPicker.countDownDuration = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.counter -= 1
            self.timerLabel.text =  "Осталось \(self.counter) секунд"
            
            if self.counter == 0 {
                timer.invalidate()
            }
        }
    }

    
}

