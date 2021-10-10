//
//  TrainCalendarPickerViewController.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 10/10/21.
//

import UIKit

class TrainCalendarPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        view = thisView
    }

    let thisView = TrainCalendarPickerView()
}
