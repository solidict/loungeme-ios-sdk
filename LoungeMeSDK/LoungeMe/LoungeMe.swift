//
//  LoungeMe.swift
//  LoungeMeSDK
//
//  Created by Doğu Emre DEMİRÇİVİ on 20.07.2019.
//  Copyright © 2019 TAV Airports. All rights reserved.
//

import Foundation

public final class LoungeMe {
    // MARK: - Public Static Methods
    
    public static func show(
        onViewController viewController: UIViewController,
        applicationId: String,
        animated: Bool = true,
        pushCompletion: (() -> Void)? = nil,
        dismissCompletion: (() -> Void)? = nil
    ) {
        let webViewViewController = WebViewViewController(
            nibName: "WebViewViewController",
            bundle: Bundle(for: LoungeMe.self)
        )

        webViewViewController.applicationId = applicationId
        webViewViewController.shouldDismissAnimate = animated
        webViewViewController.dismissCompletion = dismissCompletion
        
        viewController.present(webViewViewController, animated: animated) {
            pushCompletion?()
        }
    }
}
