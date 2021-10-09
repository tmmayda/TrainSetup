//
//  TrainFormViewController.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 20/09/21.
//

import UIKit
import MUIKit

class TrainFormViewController: UIViewController {
    
    private var calenvarVC = MUICalendarViewController()
    
    var textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Give some Name"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var formView: TrainFormView = {
        let view = TrainFormView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        // Do any additional setup after loading the view.
        addView()
        pairDelegate()
    }
    
    func addView() {
        view.addSubview(formView)
        
        NSLayoutConstraint.activate([
            formView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            formView.leadingAnchor.constraint(equalTo: view.leadingAnchor,   constant: 15),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            formView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
        ])
        
        formView.departureStation.delegate = self
        
    }
    
    func pairDelegate() {
        formView.departureStation.delegate = self
        formView.departureDate.delegate = self
        formView.passengerInput.delegate = self
        
        formView.swapStationNameView.addTarget(self, action: #selector(didTappedSwapStation(_:)), for: .touchUpInside)
        
        formView.switchButton.addTarget(self, action: #selector(didTappedIsRoundTrip), for: .valueChanged)
    }
    
    @objc
    func didTappedSwapStation(_ sender: MUIButton) {
        print("Swap")
        formView.swapDepartureAndArrivalStationName()
    }
    
    @objc
    func didTappedIsRoundTrip(_ event: UIControl.Event) {
        formView.addOrRemoveArrivalDate()
    }
}

extension TrainFormViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Inside Tapped")
        if textField == formView.departureStation.textField {
            return true
        } else if textField == formView.departureDate.textField {
            calenvarVC.calendarViewControllerType = .selectOneDate
            calenvarVC.selectedDate = nil
            calenvarVC.isDraggingEnable = true
            present(calenvarVC, animated: true, completion: nil)
        } else if textField == formView.passengerInput.textField {
            print("Did tapped passenger")
            let presentedVC = TrainPassengerSelectionViewController(viewModel: TrainPassengerViewModel(maxPassengers: 5))
            presentedVC.view.translatesAutoresizingMaskIntoConstraints = false
            let vc = MUITrayViewController(title: "Passenger", subtitle: "Adults & Infants", contentViewController: presentedVC, isFullScreen: false)
            present(vc, animated: true, completion: nil)
        }
        return false
    }
}
