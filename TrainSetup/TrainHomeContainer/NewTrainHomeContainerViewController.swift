//
//  NewTrainHomeContainerViewController.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 22/09/21.
//

import UIKit
import MUIKit

class NewTrainHomeContainerViewController: UIViewController {
    
    var thisView = NewTrainFormView()
    var calendarVC = MUICalendarViewController()
    
    override func loadView() {
        view = thisView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pairDelegate()
    }
    
    func pairDelegate() {
        thisView.trainFormView.departureStation.delegate = self
        thisView.trainFormView.departureDate.delegate = self
        thisView.trainFormView.passengerInput.delegate = self
        
        thisView.trainFormView.switchButton.addTarget(self, action: #selector(didTappedIsRoundTrip(_:)), for: .valueChanged)
    }
    
    @objc
    func didTappedIsRoundTrip(_ event: UIControl.Event) {
        thisView.trainFormView.addOrRemoveArrivalDate()
    }

}

extension NewTrainHomeContainerViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Inside Tapped")
        if textField == thisView.trainFormView.departureStation.textField {
            return true
        } else if textField == thisView.trainFormView.departureDate.textField {
            let cvc = CalendarPickerViewController()
            present(cvc, animated: true, completion: nil)
        } else if textField == thisView.trainFormView.passengerInput.textField {
            print("Did tapped passenger")
            let vm = TrainPassengerViewModel(maxPassengers: 5)
            vm.set(numOfAdults: 1)
            vm.set(numOfInfants: 0)
            let presentedVC = TrainPassengerSelectionViewController(viewModel: vm)
            presentedVC.delegate = self
            let vc = MUITrayViewController(title: "Passenger", contentViewController: presentedVC)
            vc.addActionButtons(actions: [
                MUITrayActionButton(title: "Cancel", style: .secondary, handler: {
                    presentedVC.exit()
                }),
                MUITrayActionButton(title: "Done", style: .primary, handler: {
                    presentedVC.didTappedDone()
                })
            ], direction: .horizontal)
            vc.shouldDismissOnActionButtonDidTap = false
            present(vc, animated: true, completion: nil)
        }
        return false
    }
}

extension NewTrainHomeContainerViewController: TrainPassengerSelectionViewControllerDelegate {
    func select(numOfAdults: Int, numOfInfants: Int) {
        print("Selected: adults:\(numOfAdults) infants:\(numOfInfants)")
    }
}
