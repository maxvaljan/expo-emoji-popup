import ExpoModulesCore

public class ExpoEmojiPopupModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoEmojiPopup")

    View(ExpoEmojiPopupView.self) {
      Events("onEmojiSelected")
    }
  }
}



