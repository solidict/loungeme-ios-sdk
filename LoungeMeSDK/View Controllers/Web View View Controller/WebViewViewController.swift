//
//  WebViewViewController.swift
//  LoungeMeSDK
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.07.2019.
//  Copyright © 2019 TAV Airports. All rights reserved.
//

import UIKit
import WebKit

internal final class WebViewViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var forwardButton: UIButton!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var webView: WKWebView!
    
    // MARK: - Fields
    
    internal var shouldDismissAnimate: Bool!
    internal var dismissCompletion: (() -> Void)? = nil
    internal var observers: [NSKeyValueObservation] = []
    
    // MARK: - View Controller Lifecycle
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do assertions
        assert(self.shouldDismissAnimate != nil, "shouldDismissAnimate must not be null")
        
        // MARK: Configure outlets
        
        // Set close button title
        self.closeButton.setTitle(LocalizedStringManager.getValue(forKey: "close"), for: .normal)
        
        // Configure web view
        configureWebView()
    }
    
    internal override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        // Release observers to avoid memory leak
        self.observers.removeAll()
        
        super.dismiss(animated: flag) {
            completion?()
            self.dismissCompletion?()
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func refreshButtonTapped(_ sender: UIButton) {
        self.webView.reload()
        
        doABarrelRoll(onView: sender)
    }
    
    @IBAction private func backButtonTapped(_ sender: UIButton) {
        self.webView.goBack()
    }
    
    @IBAction private func forwardButtonTapped(_ sender: UIButton) {
        self.webView.goForward()
    }
    
    @IBAction private func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: self.shouldDismissAnimate)
    }
    
    // MARK: - Private Methods
    
    private func doABarrelRoll(onView view: UIView) {
        UIView.animate(withDuration: 1) {
            view.transform = view.transform.rotated(by: CGFloat.pi)
            view.transform = view.transform.rotated(by: CGFloat.pi)
        }
    }
    
    // MARK: - Web View Methods
    
    private func configureWebView() {
        // Update buttons for the first time so they will be shown correctly
        webViewStatesChanged()
        
        // Append observers to keep track of can go back & forward states
        self.observers.append(
            self.webView.observe(\.canGoBack) { (_, _) in
                self.webViewStatesChanged()
            }
        )
        
        self.observers.append(
            self.webView.observe(\.canGoForward) { (_, _) in
                self.webViewStatesChanged()
            }
        )
        
        self.observers.append(
            self.webView.observe(\.estimatedProgress) { (_, _) in
                self.webViewStatesChanged()
            }
        )
        
        // Navigate to web
        guard let url = URL(string: LocalizedStringManager.getValue(forKey: "secureHomeUrl")) else {
            fatalError("failed to get secureHomeUrl from LocalizedStringManager")
        }
        
        let urlRequest = URLRequest(url: url)
        
        self.webView.load(urlRequest)
    }
    
    private func webViewStatesChanged() {
        self.backButton.isEnabled = self.webView.canGoBack
        self.forwardButton.isEnabled = self.webView.canGoForward
        
        let estimatedProgress = Float(self.webView.estimatedProgress)
        
        self.progressView.isHidden = estimatedProgress == 1
        
        let shouldAnimate = self.progressView.progress < estimatedProgress
        
        self.progressView.setProgress(estimatedProgress, animated: shouldAnimate)
    }
}
