//
//  TrainPassengerSelectionView.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 09/10/21.
//

import UIKit
import MUIKit
import SnapKit

private let cellHeight: CGFloat = 40.0
private let numOfVisibleCell: Int = 3

class TrainPassengerSelectionView: UIView {
    
    lazy var adultsTableView: UITableView = createTableView(withKind: .adult)
    lazy var infantsTableView: UITableView = createTableView(withKind: .infant)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TrainPassengerSelectionView {
    func createAdultTopLabel() -> UILabel {
        let label = UILabel()
        label.text = "Adult"
        label.font = MUIFont.title1
        return label
    }
    
    func createAdultDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.text = "Age 3+"
        label.font = MUIFont.title2
        label.textColor = MUIColor.lightGray
        return label
    }
    
    func createInfantsTopLabel() -> UILabel {
        let label = UILabel()
        label.text = "Infant"
        label.font = MUIFont.title1
        return label
    }
    
    func createInfantsDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.text = "Must buy tickets"
        label.font = MUIFont.title2
        label.textColor = MUIColor.lightGray
        return label
    }
    
    func createTopGradientView() -> UIView {
        let view: UIView = UIView()
        view.backgroundColor = MUIColor.lightPrimary
        view.alpha = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }
    
    func createMiddleGradientView() -> UIView {
        let view: UIView = UIView()
        view.backgroundColor = MUIColor.lightNeutral
        view.alpha = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }
    
    func createBottomGradientView() -> UIView {
        let view: UIView = UIView()
        view.backgroundColor = MUIColor.lightPrimary
        view.alpha = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }
    
    func createTableView(withKind: TrainPassengerSelectionType) -> UITableView {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = MUIColor.clear
        tableView.register(TrainPassengerTableViewCell.self, forCellReuseIdentifier: "TrainPassengerCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = cellHeight
        tableView.rowHeight = cellHeight
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.tag = withKind.rawValue
        tableView.showsVerticalScrollIndicator = false

        let insetMultiplier: Int = numOfVisibleCell / 2
        tableView.contentInset = UIEdgeInsets(top: CGFloat(insetMultiplier) * cellHeight, left: 0, bottom: CGFloat(insetMultiplier) * cellHeight, right: 0)
        return tableView
    }
    
    func setupView() {
        setupContainerFor(kind: .adult)
        setupContainerFor(kind: .infant)
    }
    
    func setupContainerFor(kind: TrainPassengerSelectionType) {
        
        let topLabel: UILabel
        let descLabel: UILabel
        let tableContainer: UIView = UIView()
        let mainContainer: UIView = UIView()
        mainContainer.backgroundColor = MUIColor.lightPrimary
        
        addSubview(mainContainer)
        if kind == .adult {
            mainContainer.snp.makeConstraints { make in
                make.leading.top.bottom.equalTo(self)
                make.trailing.equalTo(self.snp.centerX)
            }
            
            topLabel = createAdultTopLabel()
            descLabel = createAdultDescriptionLabel()
        }
        else {
            mainContainer.snp.makeConstraints { make in
                make.top.bottom.trailing.equalTo(self)
                make.leading.equalTo(self.snp.centerX)
            }
            
            topLabel = createInfantsTopLabel()
            descLabel = createInfantsDescriptionLabel()
        }
        
        [topLabel, descLabel, tableContainer].forEach(mainContainer.addSubview(_:))
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(mainContainer).offset(8)
            make.centerX.equalTo(mainContainer)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(8)
            make.centerX.equalTo(mainContainer)
        }
        
        tableContainer.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalTo(mainContainer)
        }
        
        setup(tableView: (kind == .adult) ? adultsTableView : infantsTableView, inside: tableContainer)
    }
    
    func setup(tableView spinnerTableView: UITableView, inside container: UIView) {
        let gradientTopView = createTopGradientView()
        let gradientMiddleView = createMiddleGradientView()
        let gradientBottomView = createBottomGradientView()
        
        [gradientMiddleView, spinnerTableView, gradientTopView, gradientBottomView].forEach(container.addSubview(_:))
        spinnerTableView.snp.makeConstraints { make in
            make.edges.equalTo(container)
            make.height.equalTo(cellHeight * CGFloat(numOfVisibleCell))
        }
        
        gradientTopView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(container)
            make.height.equalTo(cellHeight)
        }
        
        gradientMiddleView.snp.makeConstraints { make in
            make.leading.trailing.centerY.equalTo(container)
            make.height.equalTo(cellHeight)
        }
        
        gradientBottomView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(container)
            make.height.equalTo(cellHeight)
        }
    }
}
