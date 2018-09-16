//
//  FSCalendar+Selection.swift
//  CalendarPrototype
//
//  Created by Julian Caicedo on 16.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import FSCalendar

extension FSCalendar {
  
  func select(from startDate: Date, to endDate: Date) {
    let range = startDate.rangeTo(date: endDate)
    deselectAll()
    for dateInBetween in range {
      select(dateInBetween)
    }
  }
  
  func deselectAll() {
    selectedDates.forEach {
      deselect($0)
    }
  }
  
  func deselectAll(except date: Date) {
    selectedDates.filter { $0 != date }.forEach {
      deselect($0)
    }
  }
  
  func deselectBefore(date: Date) {
    selectedDates.filter { $0 < date }.forEach {
      deselect($0)
    }
  }
  
}
