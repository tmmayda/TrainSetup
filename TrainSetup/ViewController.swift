//
//  ViewController.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 20/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    var normalView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackView: UIStackView = {
       let view = UIStackView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var secondStackView: UIStackView = {
       let view = UIStackView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        //setupWithSubView()
        //addNSubview(10)
        //setupWithStackView()
        //addNToStackView(19)
        setupWithScrollView()
    }
    
    func setupWithSubView() {
        view.addSubview(normalView)
        NSLayoutConstraint.activate([
            normalView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            normalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            normalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupWithStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 4.0
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            //stackView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func setupWithScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        //containerView.addSubview(secondStackView)
        //containerView.addSubview(normalView)
        
        
        
        secondStackView.axis = .vertical
        secondStackView.spacing = 3.0
        secondStackView.distribution = .fillProportionally
        secondStackView.alignment = .center
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 40),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 40),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -40),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            /*
            secondStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            secondStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            secondStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            secondStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            */
        ])
        
        //addNSubview(20)
        //addNToStackView(2,to: stackView)
        addNToStackView(10, to: secondStackView)
        stackView.addArrangedSubview(secondStackView)
    }
    
    func addNSubview(_ n: Int, to thisView: UIView) {
        var arrayView: [UIView] = []
        for idx in 0..<n {
            let boxView = UIView()
            boxView.backgroundColor = .green
            boxView.translatesAutoresizingMaskIntoConstraints = false
            arrayView.append(boxView)
            
            thisView.addSubview(boxView)
            if idx == 0 {
                boxView.topAnchor.constraint(equalTo: thisView.topAnchor, constant: 10).isActive = true
            } else {
                boxView.topAnchor.constraint(equalTo: arrayView[idx-1].bottomAnchor, constant: 10).isActive = true
            }
            
            boxView.centerXAnchor.constraint(equalTo: thisView.centerXAnchor).isActive = true
            boxView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            boxView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
    
    func addNToStackView(_ n : Int, to stackView: UIStackView) {
        for _ in 0..<n {
            let boxView = UIView()
            boxView.backgroundColor = .green
            boxView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(boxView)
            
            boxView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
            boxView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            boxView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }


}

