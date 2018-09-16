//
//  CalendarViewController.swift
//  CalendarPrototype
//
//  Created by Julian Caicedo on 16.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
  
  @IBOutlet weak var calendar: FSCalendar!
  
  // MARK: - Initialization
  
  private let locale: Locale
  private var pivotDate: Date?
  
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
    calendar.allowsMultipleSelection = true
    calendar.appearance.titleDefaultColor = .black
    calendar.appearance.titleTodayColor = .yellow
    calendar.appearance.titlePlaceholderColor = .lightGray
    calendar.appearance.titleWeekendColor = .red
  }
  
}

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
  
  // MARK:- FSCalendarDelegate
  
  func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
    pivotDate = date
    calendar.deselectAll(except: date)
    return false
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
  
  // MARK:- FSCalendarDelegateAppearance
  
  /// !!! Function is supposed to set titleDefaultColor only, but it's also setting titleTodayColor, titlePlaceholderColor and titleWeekendColor !!!
  func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
    if date > Date() && date < Date().tomorrow.tomorrow.tomorrow {
      return .green
    }
    return appearance.titleDefaultColor
  }
  
}
