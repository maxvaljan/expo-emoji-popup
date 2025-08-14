import UIKit
import MCEmojiPicker
import React

@objc public protocol EmojiPopupDelegate {
  func didGetEmoji(emoji: String, reactTag: NSNumber?)
}

@objc
public class EmojiPopupViewImpl: UIView, MCEmojiPickerDelegate {
  private var delegate: EmojiPopupDelegate?
  @objc var onEmojiSelected: RCTDirectEventBlock?
  private var didSetupGesture = false
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupGestureIfNeeded()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupGestureIfNeeded()
  }
  
  private func setupGestureIfNeeded() {
    guard !didSetupGesture else { return }
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    addGestureRecognizer(tapGesture)
    didSetupGesture = true
  }
  
  @objc func handleTap(_ gesture: UITapGestureRecognizer) {
    presentEmojiPicker()
  }
  
  @objc public convenience init(delegate: EmojiPopupDelegate?) {
    self.init()
    self.delegate = delegate
  }
  
  @objc public func setDelegate(_ delegate: EmojiPopupDelegate?) {
    self.delegate = delegate
  }
  
  @objc public func presentEmojiPicker() {
    let emojiPicker = MCEmojiPickerViewController()
    let reactRootVC = reactViewController()
    emojiPicker.sourceView = self
    emojiPicker.delegate = self
    reactRootVC?.present(emojiPicker, animated: true)
  }
  
  // MARK: MCEmojiPickerDelegate
  
  public func didGetEmoji(emoji: String) {
    delegate?.didGetEmoji(emoji: emoji, reactTag: self.reactTag)
  }
}

