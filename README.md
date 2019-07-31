![LoungeMe Logo](https://raw.githubusercontent.com/solidict/loungeme-ios-sdk/master/LoungeMe.png)

# LoungeMe iOS SDK

## Contents

- [Purpose of this SDK](#purpose-of-this-sdk)
- [Installation](#installation)
  - [Installing using Cocoapods](#installing-using-cocoapods)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Purpose of this SDK

This SDK can be used to push `LoungeMe`'s web page into currently presenting *View Controller*.

## Installation

### Installing using Cocoapods

To integrate `LoungeMe iOS SDK` into your project you must add following line to your
`Podfile`.

```ruby
pod 'LoungeMeSDK'
```

⚠️ Important: Don’t forget to execute `bash` script below after adding pod lines:

```bash
pod install
```

## Usage

After integrating SDK into your project navigate to the source code of *View Controller* that you want to present `LoungeMe`'s web page on.

- Add `import LoungeMeSDK` to the beginning of the file.
- To present `LoungeMe`'s web page on top of current *View Controller* you must execute code lines below.

```swift
LoungeMe.show(onViewController: self, applicationId: "YOUR_APPLICATION_ID")
```

⚠️ Don't forget to replace `applicationId` value with your application id.

- You're good to go. Just launch your application and see how it works.

⚠️ `LoungeMe.show` method has three more arguments, which can be used to *track state*/*change state* of presenting *View Controller*.

| Name              | Explanation                                                  |
| ----------------- | ------------------------------------------------------------ |
| animated          | When this boolean is true *Web View* will be present animated, otherwise no animation. |
| pushCompletion    | This closure will be called when *View Controller* completes push animation. |
| dismissCompletion | This closure will be called when *View Controller* completes dismiss animation. |

## Contributing

Please make sure you've read this document before contributing:

[Contribution Guidelines](CONTRIBUTING.md)

## License

[MIT](LICENSE)
