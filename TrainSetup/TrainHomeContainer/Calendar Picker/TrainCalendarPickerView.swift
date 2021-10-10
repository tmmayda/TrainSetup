//
//  TrainCalendarPickerView.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 10/10/21.
//

import UIKit
import MUIKit
import SnapKit

class TrainCalendarPickerView: UIView {
    
    lazy var departureLabel: UILabel = createDepartureLabel()
    lazy var departureDateLabel: UILabel = createDepartureDateLabel()
    lazy var returnLabel: UILabel = createReturnLabel()
    lazy var returnDateLabel: UILabel = createReturnDateLabel()
    lazy var calendarContainer: UIView = createCalendarContainerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TrainCalendarPickerView {
    func createHeaderContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = MUIColor.godwitBlue
        return view
    }
    
    func createDepartureContainer() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func createReturnContainer() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func createSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    func createDepartureLabel() -> UILabel {
        let label = UILabel()
        label.text = "Departure"
        label.textColor = .white
        label.font = MUIFont.tiny
        label.textAlignment = .center
        return label
    }
    
    func createDepartureDateLabel() -> UILabel {
        let label = UILabel()
        label.text = "Wednesday, 17 September"
        label.textColor = .white
        label.font = MUIFont.small.withWeight(.bold)
        label.textAlignment = .center
        return label
    }
    
    func createReturnLabel() -> UILabel {
        let label = UILabel()
        label.text = "Return"
        label.textColor = .white
        label.font = MUIFont.tiny
        label.textAlignment = .center
        return label
    }
    
    func createReturnDateLabel() -> UILabel {
        let label = UILabel()
        label.text = "Thursday, 18 September"
        label.textColor = .white
        label.font = MUIFont.small
        label.textAlignment = .center
        return label
    }
    
    func createCalendarContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }
    
    func setupView() {
        let headerContainer = createHeaderContainerView()
        let departureContainer = createDepartureContainer()
        let returnContainer = createReturnContainer()
        let separator = createSeparatorView()
        
        addSubview(headerContainer)
        headerContainer.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(self)
        }
        
        [separator, returnContainer, departureContainer].forEach(headerContainer.addSubview(_:))
        separator.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(headerContainer)
            make.width.equalTo(16)
            make.height.equalTo(2)
            make.leading.equalTo(departureContainer.snp.trailing).offset(16)
        }
        
        departureContainer.snp.makeConstraints { make in
            make.top.bottom.equalTo(headerContainer)
            make.leading.equalTo(headerContainer).offset(8)
        }
        
        returnContainer.snp.makeConstraints { make in
            make.top.bottom.equalTo(headerContainer)
            make.leading.equalTo(separator.snp.trailing).offset(16)
            make.trailing.equalTo(headerContainer).inset(8)
        }
        
        
        [departureLabel, departureDateLabel].forEach(departureContainer.addSubview(_:))
        departureLabel.snp.makeConstraints { make in
            make.top.equalTo(departureContainer).offset(8)
            make.leading.trailing.equalTo(departureContainer).inset(36)
        }
        
        departureDateLabel.snp.makeConstraints { make in
            make.top.equalTo(departureLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(departureContainer).inset(4)
            make.bottom.equalTo(departureContainer).inset(8)
        }
        
        [returnLabel, returnDateLabel].forEach(returnContainer.addSubview(_:))
        returnLabel.snp.makeConstraints { make in
            make.top.equalTo(returnContainer).offset(8)
            make.leading.trailing.equalTo(returnContainer).inset(36)
        }
        
        returnDateLabel.snp.makeConstraints { make in
            make.top.equalTo(returnLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(returnContainer).inset(4)
            make.bottom.equalTo(returnContainer).inset(8)
        }
        
        addSubview(calendarContainer)
        calendarContainer.snp.makeConstraints { make in
            make.top.equalTo(headerContainer.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
    }
}
