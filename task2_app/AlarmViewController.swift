//
//  ViewController.swift
//  task2_app
//
//  Created by Tolgahan Sonmez on 28.08.2023.
//

import UIKit
import UserNotifications

class AlarmViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    private var viewModel: AlarmViewModel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AlarmViewModel()
        UNUserNotificationCenter.current().delegate = viewModel
    }
    
    @IBAction func setAlarmButtonTapped(_ sender: UIButton) {
        let selectedDate = datePicker.date

        viewModel.selectedDate = selectedDate
        
        viewModel.setAlarm { success in
            if success {
                DispatchQueue.main.async {
                              let alertController = UIAlertController(title: "Success", message: "Alarm has been set successfully!", preferredStyle: .alert)
                              let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                              alertController.addAction(okAction)
                              self.present(alertController, animated: true, completion: nil)
                          }
            } else {
                DispatchQueue.main.async {
                                let alertController = UIAlertController(title: "Error", message: "Failed to set alarm.", preferredStyle: .alert)
                                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                alertController.addAction(okAction)
                                self.present(alertController, animated: true, completion: nil)
                            }
            }
        }
    }
    

}

