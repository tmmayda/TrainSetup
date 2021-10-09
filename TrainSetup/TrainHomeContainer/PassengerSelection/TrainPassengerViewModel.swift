//
//  TrainPassengerViewModel.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 09/10/21.
//

import Foundation

protocol TrainPassengerViewModelDelegate {
    func passengerIs(valid: Bool,numOfAdults: Int ,numOfInfants: Int)
    func scrollTo(numOfAdults: Int, numOfInfants: Int)
}

class TrainPassengerViewModel: NSObject {
    
    let maxSelectablePassenger: Int
    
    lazy var adultsPassengerSelection: [Int] = [Int](1...maxSelectablePassenger)
    lazy var infantsPassengerSelection: [Int] = [Int](0...maxSelectablePassenger)
    var delegate: TrainPassengerViewModelDelegate?
    
    var choosenNumOfAdults: Int = 0
    var chooseNumOfInfants: Int = 0
    
    init(maxPassengers: Int) {
        self.maxSelectablePassenger = maxPassengers
    }
    
    func set(numOfAdults: Int) {
        self.choosenNumOfAdults = numOfAdults
        print("update adults: \(numOfAdults)")
    }
    
    func set(numOfInfants: Int) {
        self.chooseNumOfInfants = numOfInfants
        print("update infants: \(numOfInfants)")
    }
    
    func selectCurrentPassenger() {
        let isValid = (choosenNumOfAdults >= chooseNumOfInfants)
        delegate?.passengerIs(valid: isValid, numOfAdults: choosenNumOfAdults, numOfInfants: chooseNumOfInfants)
        if !isValid {
            self.delegate?.scrollTo(numOfAdults: choosenNumOfAdults, numOfInfants: choosenNumOfAdults)
            self.set(numOfInfants: choosenNumOfAdults)
        }
        
    }
}
