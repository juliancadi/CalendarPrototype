//
//  ViewController.swift
//  CalendarPrototype
//
//  Created by Julian Caicedo on 16.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    show(CalendarViewController(locale: Locale.current), sender: nil)
  }
}
