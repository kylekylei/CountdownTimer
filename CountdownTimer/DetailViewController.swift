//
//  DetailViewController.swift
//  CountdownTimer
//
//  Created by Kyle Lei on 2021/9/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let mainBounds = UIScreen.main.bounds
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 0, y: mainBounds.height*0.6, width: mainBounds.width, height: mainBounds.height*0.4)
        
        
        */
        
        //dateField.inputView = datePicker
   
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
