//
//  HomeViewController.swift
//  LoungeMeSDKExamples
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.07.2019.
//  Copyright © 2019 TAV Airports. All rights reserved.
//

import UIKit
import LoungeMeSDK

internal final class HomeViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet private weak var loungeMeButton: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - View Controller Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    @IBAction private func loungeMeButtonTapped(_ sender: UIButton) {
        self.descriptionLabel.text = "Pushing awesomely designed WebView on top of View Controller."
        self.loungeMeButton.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            LoungeMe.show(onViewController: self, animated: true, pushCompletion: nil) {
                self.descriptionLabel.text = "Great, r-right?"
                self.loungeMeButton.isEnabled = true
            }
        }
    }
}
