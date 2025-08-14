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
    innerView.setDelegate(self)
    addSubview(innerView)
  }

  override func layoutSubviews() {
    innerView.frame = bounds
  }

  // EmojiPopupDelegate
  func didGetEmoji(emoji: String, reactTag: NSNumber?) {
    onEmojiSelected(["emoji": emoji])
  }
}



