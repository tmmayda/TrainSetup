//
//  TrainFormView.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 20/09/21.
//

import UIKit
import MUIKit

class TrainFormView: UIView {
    
    private var formStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16.0
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var departureStation: MUIInput = {
       let input = MUIInput()
        input.placeholder = "Departure Station"
        input.text = "Hansun Station"
        input.setLeftIcon(image: UIImage(systemName: "chevron.up"))
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    var swapStationNameView: MUIButton = {
        let view = MUIButton()
        view.backgroundColor = .red
        view.layer.cornerRadius = 4.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var arrivalStation: MUIInput = {
       let input = MUIInput()
        input.placeholder = "Departure Station"
        input.text = "Nobuyama Station"
        input.setLeftIcon(image: UIImage(systemName: "chevron.down"))
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    var departureDate: MUIInput = {
       let input = MUIInput()
        input.placeholder = "Departure Date"
        input.text = "21 September 2021"
        input.setLeftIcon(image: UIImage(systemName: "calendar"))
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private var arrivalDate: MUIInput = {
       let input = MUIInput()
        input.placeholder = "Arrival Date"
        input.text = "23 September 2021"
        input.setLeftIcon(image: UIImage(systemName: "calendar"))
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    var switchButton: MUISwitch = {
        let switchUI = MUISwitch()
        switchUI.translatesAutoresizingMaskIntoConstraints = false
        return switchUI
    }()
    
    var passengerInput: MUIInput = {
       let input = MUIInput()
        input.placeholder = "Num of passenger"
        input.text = "1 Adults"
        input.setLeftIcon(image: UIImage(systemName: "chair"))
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private var searchButton: MUIButton = {
       let button = MUIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 6.0
        button.setTitle("Search", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var isRoundTrip = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addToStackView()
        addSwitchDepartureAndArrivalStation()
        addIsRoundTripSwitch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(formStackView)
        
        NSLayoutConstraint.activate([
            formStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            formStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            formStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            formStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    func addToStackView() {
        formStackView.addArrangedSubview(departureStation)
        formStackView.addArrangedSubview(arrivalStation)
        formStackView.addArrangedSubview(departureDate)
        formStackView.addArrangedSubview(arrivalDate)
        arrivalDate.isHidden = !isRoundTrip
        formStackView.addArrangedSubview(passengerInput)
        formStackView.addArrangedSubview(searchButton)
    }
    
    func addSwitchDepartureAndArrivalStation() {
        departureStation.addSubview(swapStationNameView)
        NSLayoutConstraint.activate([
            swapStationNameView.trailingAnchor.constraint(equalTo: departureStation.trailingAnchor, constant: -2),
            swapStationNameView.centerYAnchor.constraint(equalTo: departureStation.bottomAnchor),
            swapStationNameView.heightAnchor.constraint(equalToConstant: 30),
            swapStationNameView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func addIsRoundTripSwitch() {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.spacing = 10.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Round Trip ?"
        label.font = MUIFont.small
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(switchButton)
        
        departureDate.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo: departureDate.trailingAnchor, constant: -5),
            stack.bottomAnchor.constraint(equalTo: departureDate.bottomAnchor, constant: -15)
        ])
    }
    
    func addOrRemoveArrivalDate() {
        isRoundTrip.toggle()
        UIView.animate(withDuration: 0.3) {
            self.arrivalDate.isHidden = !self.isRoundTrip
            self.arrivalDate.alpha = (self.isRoundTrip) ? 1.0 : 0.0
        }
    }
    
    func swapDepartureAndArrivalStationName() {
        UIView.animate(withDuration: 1.3, delay: 0.3, options: .transitionFlipFromTop) {
            let temp = self.departureStation.text
            self.departureStation.text = self.arrivalStation.text
            self.arrivalStation.text = temp
        }
    }
}
