//
//  ViewController.swift
//  CalendarPrototype
//
//  Created by Julian Caicedo on 16.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var startDateLabel: UILabel!
  @IBOutlet weak var endDateLabel: UILabel!
  
  @IBAction func pickRangeButtonTapped(_ sender: UIButton) {
    let calendarVC = CalendarViewController(locale: Locale.current)
    calendarVC.delegate = self
    present(calendarVC, animated: true, completion: nil)
  }
}

extension ViewController: DateRangePickerDelegate {
  func didSelect(dateRange: (start: Date, end: Date)) {
    let dateFormat: DateFormatter = DateFormatter()
    dateFormat.dateFormat = "dd MMMM yyyy"
    startDateLabel.text = dateFormat.string(from: dateRange.start)
    endDateLabel.text = dateFormat.string(from: dateRange.end)
  }
}
