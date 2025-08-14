import EmojiPopupView from './EmojiPopupViewNativeComponent';
import type { EmojiPopupProps } from './types';

const EmojiPopup = ({ children, onEmojiSelected, style }: EmojiPopupProps) => {
  return (
    <>
      <EmojiPopupView
        onEmojiSelected={({ nativeEvent: { emoji } }) => {
          onEmojiSelected(emoji);
        }}
        style={style}
      >
        {children}
      </EmojiPopupView>
    </>
  );
};

export default EmojiPopup;
