package expo.modules.emojipopup.view

import android.content.Context
import com.emojipopup.EmojiPopupView
import com.emojipopup.EmojiSelectedEvent
import expo.modules.kotlin.AppContext
import expo.modules.kotlin.viewevent.EventDispatcher
import expo.modules.kotlin.views.ExpoView

class EmojiPopupExpoView(context: Context, appContext: AppContext) : ExpoView(context, appContext) {
  private val onEmojiSelected by EventDispatcher()

  private val innerView = EmojiPopupView(context).also { view ->
    view.layoutParams = LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT)
    view.onEmojiSelectedListener = { emoji ->
      onEmojiSelected(mapOf("emoji" to emoji))
    }
    addView(view)
  }
}



