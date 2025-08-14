import { requireNativeViewManager } from 'expo-modules-core';

type NativeProps = {
  onEmojiSelected?: (event: { nativeEvent: { emoji: string } }) => void;
} & Record<string, unknown>;

// Expo Dev Client/EAS Build: resolve native view manager from Expo Modules
const NativeView = requireNativeViewManager('ExpoEmojiPopup') as unknown as (
  props: NativeProps
) => any;

export default NativeView;
