//
//  TrainHomeContainerViewController.swift
//  TrainSetup
//
//  Created by Muhammad Fawwaz Mayda on 20/09/21.
//

import UIKit

class TrainHomeContainerViewController: UIViewController {
    
    var scrollView: UIScrollView = {
       let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollContainerView: UIView = {
        let view = UIView()
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
        view.backgroundColor = .clear
        view.layer.cornerRadius = 6.0
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.yellow.cgColor
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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Train Home Container"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupView()
        addBlueHangingHeaderView()
        addFormContainerView()
        addRecentSearchContainerView()
        addMerchandisingContainerView()
        addMultipleViewToStackView(times: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.addMultipleViewToStackView(times: 1)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.addMultipleViewToStackView(times: 2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.addMultipleViewToStackView(times: 3)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            self.recentSearchContainerView.heightAnchor.constraint(equalToConstant: 0).isActive = true
            UIView.animate(withDuration: 1.2) {
                self.view.setNeedsLayout()
            }
        }
    }
    
    func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
    }
    
    func addBlueHangingHeaderView() {
        scrollContainerView.addSubview(blueHangingHeaderView)
        
        NSLayoutConstraint.activate([
            blueHangingHeaderView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor,constant: -5),
            blueHangingHeaderView.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 5),
            blueHangingHeaderView.trailingAnchor.constraint(equalTo: scrollContainerView.trailingAnchor, constant: -5),
            blueHangingHeaderView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func addFormContainerView() {
        scrollContainerView.addSubview(formContainerView)
        
        NSLayoutConstraint.activate([
            formContainerView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 20),
            formContainerView.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 20),
            formContainerView.trailingAnchor.constraint(equalTo: scrollContainerView.trailingAnchor, constant: -20),
            formContainerView.heightAnchor.constraint(equalToConstant: 370)
        ])
        
        let newVC = TrainFormViewController()
        addChild(newVC)
        formContainerView.addSubview(newVC.view)
        newVC.view.frame = formContainerView.frame
        newVC.didMove(toParent: self)
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
    
    func addMultipleView(times: Int) {
        let colors = [UIColor.red, UIColor.purple, UIColor.yellow, UIColor.green]
        let height = [200,123,349,126]
        var viewArr : [UIView] = []
        
        for idx in 0..<times {
            let newView = UIView()
            
            newView.layer.cornerRadius = 8.0
            newView.backgroundColor = colors[Int.random(in: 0..<colors.count)]
            newView.translatesAutoresizingMaskIntoConstraints = false
            viewArr.append(newView)
            
            scrollContainerView.addSubview(newView)
            
            newView.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 10).isActive = true
            newView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
            newView.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(height[Int.random(in: 0..<height.count)])).isActive = true
            
            if idx == 0 {
                newView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 10).isActive = true
            } else if idx == times-1 {
                newView.topAnchor.constraint(equalTo: viewArr[idx - 1].bottomAnchor, constant: 10).isActive = true
                newView.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor, constant: -10).isActive = true
            }
            else {
                newView.topAnchor.constraint(equalTo: viewArr[idx - 1].bottomAnchor, constant: 10).isActive = true
            }
            
            if idx == 1 {
                let newVC = TrainFormViewController()
                addChild(newVC)
                newView.addSubview(newVC.view)
                newVC.view.frame = newView.frame
                newVC.didMove(toParent: self)
            }
        }
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
