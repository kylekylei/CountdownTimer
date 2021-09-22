//
//  ViewController.swift
//  CountdownTimer
//
//  Created by Kyle Lei on 2021/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goalInfoView: UIView! {
        didSet {
            goalInfoView.layer.cornerRadius = 16
        }
    }
    @IBOutlet weak var goalButton: UIButton!
    @IBOutlet weak var mthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hrsLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
     
    @IBOutlet weak var goalField: UITextField!
    @IBOutlet weak var goalSettingView: UIView! {
        didSet {
            goalSettingView.layer.cornerRadius = 32
            goalSettingView.isHidden = true
        }
    }
    
    @IBOutlet weak var modalBackground: UIView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
        
    @IBOutlet weak var okayButton: UIButton!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                   
        modalBackground.backgroundColor = .black
        modalBackground.layer.opacity = 0.8
        modalBackground.isHidden = true
        okayButton.isEnabled = false
     
    }
    
    override func viewDidDisappear(_ animated: Bool) {
            if timer != nil {
                timer?.invalidate()
            }
        }

    @IBAction func settingGoal(_ sender: Any) {
        goalSettingView.isHidden = false
        modalBackground.isHidden = false
   
    }
    
    @IBAction func settingOkay(_ sender: Any) {
        
        let goal = goalField.text!
        goalButton.setTitle(goal, for: .normal)
        
        let dueDate = dueDatePicker.date
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] (_) in
            
            let interval = Int(dueDate.timeIntervalSinceNow)
            let mth = interval / (60 * 60 * 24 * 30)
            let day = interval / (60 * 60 * 24) % 30
            let hrs = interval / (60 * 60) % 24   
            let min = interval / 60 % 60
            let sec = interval % 60
            
            let numberFormatter = NumberFormatter()
            numberFormatter.formatWidth = 2
            numberFormatter.paddingCharacter = "0"
            
            mthLabel.text = numberFormatter.string(from: NSNumber(value: mth))
            dayLabel.text = numberFormatter.string(from: NSNumber(value: day))
            hrsLabel.text = numberFormatter.string(from: NSNumber(value: hrs))
            minLabel.text = numberFormatter.string(from: NSNumber(value: min))
            secLabel.text = numberFormatter.string(from: NSNumber(value: sec))
            
            }
     
        view.endEditing(true)
        goalSettingView.isHidden = true
        modalBackground.isHidden = true
    }
   
    @IBAction func inputGoal(_ sender: UITextField) {
        okayButton.isEnabled = true
    }
    
    
    @IBAction func settingCancel(_ sender: Any) {
        goalSettingView.isHidden = true
        modalBackground.isHidden = true
    }
        
}

