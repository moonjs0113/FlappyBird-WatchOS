<h1>
  Flappy Bird in WatchOS
  <img style="height:50px; vertical-align:middle; border-radius:25px;" src="FlappyBird Watch App/Resource/Assets.xcassets/AppIcon.appiconset/AppIcon.png"/>
</h1>

[![Platform][Platform-image]](https://developer.apple.com/kr/watchos/)
[![Swift Version][Swift-image]](https://swift.org/)

[Swift-image]:https://img.shields.io/badge/swift-5.9-orange.svg?style=flat
[Platform-image]: https://img.shields.io/badge/Platform-watchos-lightgray.svg?style=flat

An implementation and Migration of Flappy Bird in Swift for WatchOS 10.

<img src="FlappyBird Watch App/Resource/Demo.GIF" alt="TouchID" height="500"/>

## Requirments
- Swift 5.9
- Xcode 15.2
- WatchOS 10.0

## Notes
From base code repository, modified some code to match WatchOS
- Remove `SKView`(`SKView` can't used in watchOS)
- Embedded SpriteView using SwiftUI
- Modified Object size to fit Apple Watch display


## Reference
Base iOS Code from: https://github.com/newlinedotco/FlappySwift
<br>
Font Resource from: https://fontstruct.com/fontstructions/show/1472935/flappy-bird-font

## License
MIT license. See [LICENSE](https://github.com/moonjs0113/FlappyBird-WatchOS/blob/main/LICENSE) for details.
