//
//  LocalizedStringManager.swift
//  LoungeMeSDK
//
//  Created by Doğu Emre DEMİRÇİVİ on 22.07.2019.
//  Copyright © 2019 TAV Airports. All rights reserved.
//

import Foundation

internal final class LocalizedStringManager {
    // MARK: - Static Fields
    
    private static let AVAILABLE_LANGUAGE_CODES = ["tr", "en"]
    private static let FALLBACK_LANGUAGE_CODE = "en"
    
    private static let STRING_MAP = [
        "tr": [
            "close": "KAPAT",
            "languageCode": "tr",
            "secureHomeUrl": "https://lounge.me/tr/secure-home"
        ],
        "en": [
            "close": "CLOSE",
            "languageCode": "en",
            "secureHomeUrl": "https://lounge.me/en/secure-home"
        ]
    ]
    
    // MARK: - Public Static Methods
    
    public static func getValue(forKey key: String) -> String {
        guard var preferredLocalization = Locale.preferredLanguages[0].components(separatedBy: "-").first else {
            fatalError("failed to get preferred localization")
        }
        
        // Check if language code is fine to use, otherwise pick fallback code
        if !AVAILABLE_LANGUAGE_CODES.contains(preferredLocalization) {
            preferredLocalization = FALLBACK_LANGUAGE_CODE
        }
        
        guard let stringMap = STRING_MAP[preferredLocalization] else {
            fatalError("failed to get corresponding language map, preferredLocalization: \(preferredLocalization)")
        }
        
        guard let value = stringMap[key] else {
            fatalError("failed to get value from language map, key: \(key), preferredLocalization: \(preferredLocalization)")
        }
        
        return value
    }
}
