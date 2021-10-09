//
//  TrainPassengerTableViewCell.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 09/10/21.
//

import UIKit
import MUIKit

class TrainPassengerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private lazy var optionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = MUIFont.title2.withWeight(.bold)
        label.textColor = MUIColor.bluePrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        return label
    }()

    func configure(text: String) {
        if !optionLabel.isDescendant(of: contentView) {
            setupOptionLabel()

            selectionStyle = .none
            backgroundColor = MUIColor.clear
            backgroundView?.backgroundColor = MUIColor.clear
        }

        optionLabel.text = text
    }

    func setupOptionLabel() {
        addSubview(optionLabel)

        NSLayoutConstraint.activate([
            optionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            optionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            optionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            optionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
    }
}
