package expo.modules.emojipopup

import android.content.Context
import expo.modules.emojipopup.view.EmojiPopupExpoView
import expo.modules.kotlin.modules.Module
import expo.modules.kotlin.modules.ModuleDefinition

class EmojiPopupExpoModule : Module() {
  override fun definition() = ModuleDefinition {
    Name("ExpoEmojiPopup")

    View(EmojiPopupExpoView::class) {
      Events("onEmojiSelected")
    }
  }
}



