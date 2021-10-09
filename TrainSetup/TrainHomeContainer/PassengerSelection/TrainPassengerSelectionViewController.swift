//
//  TrainPassengerSelectionViewController.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 21/09/21.
//

import UIKit
import MUIKit
import SnapKit

enum TrainPassengerSelectionType: Int {
    case adult
    case infant
}

protocol TrainPassengerSelectionViewControllerDelegate {
    func select(numOfAdults: Int, numOfInfants: Int)
}

class TrainPassengerSelectionViewController: UIViewController {

    var delegate: TrainPassengerSelectionViewControllerDelegate?
    
    public init(viewModel: TrainPassengerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.thisView.adultsTableView.delegate = self
        self.thisView.adultsTableView.dataSource = self
        self.thisView.infantsTableView.delegate = self
        self.thisView.infantsTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollTo(numOfAdults: self.viewModel.choosenNumOfAdults, numOfInfants: self.viewModel.chooseNumOfInfants)
    }
    
    override func loadView() {
        view = thisView
    }
    
    func exit() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func didTappedDone() {
        self.viewModel.selectCurrentPassenger()
    }
    
    func scrollToMiddle(_ scrollView: UIScrollView) {
        let type = TrainPassengerSelectionType.init(rawValue: scrollView.tag)
        let tableView = (type == .adult) ? self.thisView.adultsTableView : self.thisView.infantsTableView
        if let pathForCenterCell: IndexPath = tableView.indexPathForRow(at: CGPoint(x: tableView.bounds.midX, y: tableView.bounds.midY)) {
            tableView.scrollToRow(at: pathForCenterCell, at: .middle, animated: true)
            (type == .adult) ? self.viewModel.set(numOfAdults: self.viewModel.adultsPassengerSelection[pathForCenterCell.row]) : self.viewModel.set(numOfInfants: self.viewModel.infantsPassengerSelection[pathForCenterCell.row])
        }
    }
    
    private let thisView: TrainPassengerSelectionView = TrainPassengerSelectionView()
    private var viewModel: TrainPassengerViewModel
}

extension TrainPassengerSelectionViewController: TrainPassengerViewModelDelegate {
    func scrollTo(numOfAdults: Int, numOfInfants numOfInfant: Int) {
        let adultIndex = self.viewModel.adultsPassengerSelection.firstIndex(of: numOfAdults) ?? 0
        let infantIndex = self.viewModel.infantsPassengerSelection.firstIndex(of: numOfInfant) ?? 0
        thisView.adultsTableView.scrollToRow(at: IndexPath(row: adultIndex, section: 0), at: .middle, animated: true)
        thisView.infantsTableView.scrollToRow(at: IndexPath(row: infantIndex, section: 0), at: .middle, animated: true)
    }
    
    func passengerIs(valid: Bool, numOfAdults: Int, numOfInfants: Int) {
        if valid {
            delegate?.select(numOfAdults: numOfAdults, numOfInfants: numOfInfants)
            self.exit()
        }
        else {
            print("Notify Error")
        }
    }
}

extension TrainPassengerSelectionViewController: UITableViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollToMiddle(scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollToMiddle(scrollView)
        }
    }
}

extension TrainPassengerSelectionViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableView.tag == TrainPassengerSelectionType.adult.rawValue) ? self.viewModel.adultsPassengerSelection.count : self.viewModel.infantsPassengerSelection.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TrainPassengerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TrainPassengerCell", for: indexPath) as? TrainPassengerTableViewCell else {
            return UITableViewCell()
        }
        
        let array = (tableView.tag == TrainPassengerSelectionType.adult.rawValue) ? self.viewModel.adultsPassengerSelection : self.viewModel.infantsPassengerSelection
        cell.configure(text: array[indexPath.row].description)

        return cell
    }
}
