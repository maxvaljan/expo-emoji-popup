import ExpoModulesCore
import UIKit

#if __has_include("EmojiPopup/EmojiPopup-Swift.h")
import EmojiPopup
#endif

class ExpoEmojiPopupView: ExpoView, EmojiPopupDelegate {
  let onEmojiSelected = EventDispatcher()
  private let innerView: EmojiPopupViewImpl

  required init(appContext: AppContext? = nil) {
    innerView = EmojiPopupViewImpl(delegate: nil)
    super.init(appContext: appContext)
    clipsToBounds = true

    // Set delegate after super.init
    innerView.perform(Selector(("setDelegate:")), with: self)
    addSubview(innerView)

    // Add a tap to present the picker (mirrors RN manager behavior)
    let tap = UITapGestureRecognizer(target: innerView, action: #selector(EmojiPopupViewImpl.handleTap(_:)))
    innerView.addGestureRecognizer(tap)
  }

  override func layoutSubviews() {
    innerView.frame = bounds
  }

  // EmojiPopupDelegate
  func didGetEmoji(emoji: String, reactTag: NSNumber?) {
    onEmojiSelected(["emoji": emoji])
  }
}



