//
//  CalendarPickerViewController.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 28/09/21.
//

import UIKit
import MUIKit

class CalendarPickerViewController: UIViewController {
    
    lazy var mainVerticalStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = MUIColor.godwitBlue
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var horizontalHeaderStackView: UIView = {
        let view = UIView()
        view.backgroundColor = MUIColor.godwitBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var verticalDepartureStack: UIStackView = {
       let view = UIStackView()
        view.backgroundColor = MUIColor.godwitBlue
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .center
        view.spacing = 4.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var departureLabel: UILabel = {
        let view = UILabel()
        view.text = "Departure"
        view.textColor = .white
        view.font = MUIFont.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var departureDateLabel: UILabel = {
       let view = UILabel()
        view.text = "17 September 2019"
        view.textColor = .white
        view.font = MUIFont.small
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var separatorView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 2.0
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var verticalReturnStack: UIStackView = {
       let view = UIStackView()
        view.backgroundColor = MUIColor.godwitBlue
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 4.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var returnLabel: UILabel = {
        let view = UILabel()
        view.text = "Return"
        view.textColor = .white
        view.font = MUIFont.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var returnDateLabel: UILabel = {
       let view = UILabel()
        view.text = "19 September 2019"
        view.textColor = .white
        view.font = MUIFont.small
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var returnDateButton: MUIButton = {
        let btn = MUIButton()
        btn.backgroundColor = MUIColor.godwitBlue
        btn.setTitle("Return Date", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 2.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let calendarVC = MUICalendarViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        // for verticalStackDeparture
        verticalDepartureStack.addArrangedSubview(departureLabel)
        verticalDepartureStack.addArrangedSubview(departureDateLabel)
        
        // for verticalStackReturn
        verticalReturnStack.addArrangedSubview(returnLabel)
        verticalReturnStack.addArrangedSubview(returnDateLabel)
        verticalReturnStack.addSubview(returnDateButton)
        
        NSLayoutConstraint.activate([
            returnDateButton.topAnchor.constraint(equalTo: verticalReturnStack.topAnchor),
            returnDateButton.leadingAnchor.constraint(equalTo: verticalReturnStack.leadingAnchor),
            returnDateButton.trailingAnchor.constraint(equalTo: verticalReturnStack.trailingAnchor),
            returnDateButton.bottomAnchor.constraint(equalTo: verticalReturnStack.bottomAnchor)
        ])
        
        returnLabel.isHidden = false
        returnDateLabel.isHidden = false
        returnDateButton.addTarget(self, action: #selector(onClickReturnDateButton), for: .touchUpInside)
       
        // arrange the header
        horizontalHeaderStackView.addSubview(verticalDepartureStack)
        horizontalHeaderStackView.addSubview(separatorView)
        horizontalHeaderStackView.addSubview(verticalReturnStack)
        
        NSLayoutConstraint.activate([
            verticalDepartureStack.leadingAnchor.constraint(equalTo: horizontalHeaderStackView.leadingAnchor, constant: 8.0),
            verticalDepartureStack.topAnchor.constraint(equalTo: horizontalHeaderStackView.topAnchor, constant: 8.0),
            verticalDepartureStack.bottomAnchor.constraint(equalTo: horizontalHeaderStackView.bottomAnchor, constant: -8.0),
            
            separatorView.leadingAnchor.constraint(equalTo: verticalDepartureStack.trailingAnchor, constant: 16.0),
            separatorView.centerYAnchor.constraint(equalTo: horizontalHeaderStackView.centerYAnchor),
            separatorView.trailingAnchor.constraint(equalTo: verticalReturnStack.leadingAnchor, constant: -16.0),
            
            verticalReturnStack.trailingAnchor.constraint(equalTo: horizontalHeaderStackView.trailingAnchor, constant: -8.0),
            verticalReturnStack.topAnchor.constraint(equalTo: horizontalHeaderStackView.topAnchor, constant: 8.0),
            verticalReturnStack.bottomAnchor.constraint(equalTo: horizontalHeaderStackView.bottomAnchor, constant: -8.0)
            
        ])
        
        // setupMainStackView
        addChild(calendarVC)
        calendarVC.calendarViewControllerType = .selectOneDate
        
        mainVerticalStackView.addArrangedSubview(horizontalHeaderStackView)
        mainVerticalStackView.addArrangedSubview(calendarVC.view)
        
        view.addSubview(mainVerticalStackView)
        NSLayoutConstraint.activate([
            mainVerticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            mainVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    @objc
    func onClickReturnDateButton() {
        // animate the change
        verticalReturnStack.transform = CGAffineTransform(translationX: 0, y: 100)
        UIView.animate(withDuration: 0.3) {
            self.returnDateButton.isHidden = true
            self.returnDateButton.transform = CGAffineTransform(translationX: 0, y: -100)
            self.verticalReturnStack.transform = .identity
        }
        
    }
}
