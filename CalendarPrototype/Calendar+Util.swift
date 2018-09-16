//
//  Calendar+Util.swift
//  CalendarPrototype
//
//  Created by Julian Caicedo on 16.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import Foundation

extension Date {
  
  public var day: Date {
    let calendar = Calendar.current
    return calendar.startOfDay(for: self)
  }
  
  public var today: Date {
    return Date()
  }
  
  public var yesterday: Date {
    return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
  }
  
  public var tomorrow: Date {
    return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
  }
  
  public var noon: Date {
    return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
  }
  
  public var hasPassed: Bool {
    return self.day < today.day ? true : false
  }
  
  public func rangeTo(date: Date) -> ClosedRange<Date> {
    return self > date ? date...self : self...date
  }

}

extension Date: Strideable {
  public func advanced(by n: Int) -> Date {
    return Calendar.current.date(byAdding: .day, value: n, to: self) ?? self
  }
  
  public func distance(to other: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: other, to: self).day ?? 0
  }
}
