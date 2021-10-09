//
//  NewTrainFormView.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 22/09/21.
//

import UIKit
import MUIKit

class NewTrainFormView: UIView {
    
    var scrollView: UIScrollView = {
       let view = UIScrollView()
        view.backgroundColor = UIColor(red: 230 / 255, green: 234 / 255.0, blue: 237 / 255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var blueHangingHeaderView: UIView = {
       let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 6.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var formContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6.0
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.yellow.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var trainFormView: TrainFormView = {
        let view = TrainFormView()
        view.layer.setElevation(with: .raised)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var recentSearchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 6.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var merchandiseContainerView: UIStackView = {
       let view = UIStackView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 6.0
        view.axis = .vertical
        view.spacing = 4.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var formStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16.0
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
        addBlueHangingHeaderView()
        addFormContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                
            scrollContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func addBlueHangingHeaderView() {
        scrollContainerView.addSubview(blueHangingHeaderView)
        
        NSLayoutConstraint.activate([
            blueHangingHeaderView.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor),
            blueHangingHeaderView.trailingAnchor.constraint(equalTo: scrollContainerView.trailingAnchor),
            blueHangingHeaderView.heightAnchor.constraint(equalToConstant: 48),
            blueHangingHeaderView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor,constant: 80)
        ])
    }
    
    func addFormContainer() {
        scrollContainerView.addSubview(formContainerView)
        
        NSLayoutConstraint.activate([
            formContainerView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 88),
            formContainerView.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 12),
            formContainerView.trailingAnchor.constraint(equalTo: scrollContainerView.trailingAnchor, constant: -12),
            formContainerView.bottomAnchor.constraint(lessThanOrEqualTo: scrollContainerView.bottomAnchor, constant: -24)
        ])
        
        formContainerView.addSubview(trainFormView)
        
        NSLayoutConstraint.activate([
            trainFormView.topAnchor.constraint(equalTo: formContainerView.topAnchor, constant: 10),
            trainFormView.leadingAnchor.constraint(equalTo: formContainerView.leadingAnchor, constant: 5),
            trainFormView.trailingAnchor.constraint(equalTo: formContainerView.trailingAnchor, constant: -5),
            trainFormView.bottomAnchor.constraint(equalTo: formContainerView.bottomAnchor, constant: -5)
        ])
    }
    
    func addRecentSearchContainerView() {
        scrollContainerView.addSubview(recentSearchContainerView)
        
        NSLayoutConstraint.activate([
            recentSearchContainerView.topAnchor.constraint(equalTo: formContainerView.bottomAnchor, constant: 20),
            recentSearchContainerView.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 20),
            recentSearchContainerView.trailingAnchor.constraint(equalTo: scrollContainerView.trailingAnchor, constant: -20),
            recentSearchContainerView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func addMerchandisingContainerView() {
        scrollContainerView.addSubview(merchandiseContainerView)
        
        NSLayoutConstraint.activate([
            merchandiseContainerView.topAnchor.constraint(equalTo: recentSearchContainerView.bottomAnchor, constant: 20),
            merchandiseContainerView.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 20),
            merchandiseContainerView.trailingAnchor.constraint(equalTo: scrollContainerView.trailingAnchor, constant: -20),
            merchandiseContainerView.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor, constant: -20)
        ])
    }
    
    func addMultipleViewToStackView(times: Int) {
        let colors = [UIColor.red, UIColor.purple, UIColor.yellow, UIColor.green]
        let height = [200,123,349,126]
        
        for _ in 0..<times {
            let newView = UIView()
            
            newView.layer.cornerRadius = 8.0
            newView.backgroundColor = colors[Int.random(in: 0..<colors.count)]
            newView.translatesAutoresizingMaskIntoConstraints = false
            
            newView.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(height[Int.random(in: 0..<height.count)])).isActive = true
            
            merchandiseContainerView.addArrangedSubview(newView)
        }
    }
}
