Pod::Spec.new do |spec|
    spec.name         = "LoungeMeSDK"
    spec.version      = "1.0.1"
    spec.summary      = "LoungeMeSDK iOS SDK"

    spec.description  = <<-DESC
    LoungeMeSDK for iOS devices. Can be used to present LoungeMe Website nicely inside of an iOS Application.
    DESC

    spec.homepage     = "https://github.com/solidict/loungeme-ios-sdk"
    spec.author       = { "Doğu Emre DEMİRÇİVİ" => "emre.demircivi@solidict.com" }

    spec.ios.deployment_target = "11.0"
    spec.swift_version         = "5"

    spec.license      = { :type => "MIT", :file => "LICENSE" }

    spec.source       = { :git => "https://github.com/solidict/loungeme-ios-sdk.git", :tag => "#{spec.version}" }
    spec.source_files = "LoungeMeSDK/**/*.swift"
    spec.resource     = 'LoungeMeSDK/**/*.{xib,xcassets}'

    spec.frameworks   = 'WebKit'
end
