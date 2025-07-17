// src/NativeAudioSpeaker.ts
import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  toggleSpeaker(): void;
  isSpeaker(): Promise<boolean | 1 | 0>;
  switchToReceiver(): void;
  switchToSpeaker(): void;
}

const RNAudioSpeaker = TurboModuleRegistry.get<Spec>('RNAudioSpeaker');

export default RNAudioSpeaker ?? null;
