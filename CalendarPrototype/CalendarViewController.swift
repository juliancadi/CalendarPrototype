//
//  CalendarViewController.swift
//  CalendarPrototype
//
//  Created by Julian Caicedo on 16.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit
import FSCalendar

protocol DateRangePickerDelegate {
  func didSelect(dateRange: (start: Date, end: Date))
}

class CalendarViewController: UIViewController {
  
  @IBOutlet weak var calendar: FSCalendar!
  
  // MARK: - Initialization
  
  private let locale: Locale
  private var pivotDate: Date?
  var delegate: DateRangePickerDelegate?
  
  init(locale: Locale) {
    self.locale = locale
    super.init(nibName: String(describing: "CalendarViewController"), bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.locale = Locale.current
    super.init(coder: aDecoder)
  }
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    calendar.locale = locale
    calendar.today = nil
  }
  
  @IBAction func readyButtonTapped(_ sender: UIButton) {
    if let startDate = calendar.selectedDates.first,
      let endDate = calendar.selectedDates.last {
      delegate?.didSelect(dateRange: (startDate, endDate))
    }
    dismiss(animated: true, completion: nil)
  }
  
}

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
  
  // MARK:- FSCalendarDelegate
  
  func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
    pivotDate = date
    calendar.deselectAll(except: date)
    return false
  }
  
  func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
    return !date.hasPassed
  }
  
  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    guard let pivot = pivotDate else {
      pivotDate = date
      calendar.deselectAll(except: date)
      return
    }
    calendar.select(from: pivot, to: date)
    pivotDate = nil
  }
  
  func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
    if date.hasPassed {
      cell.titleLabel.textColor = UIColor.black.withAlphaComponent(0.05)
    }
  }
  
}
