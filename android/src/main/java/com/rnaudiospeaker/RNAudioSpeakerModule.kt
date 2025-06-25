package com.rnaudiospeaker

import android.content.Context
import android.media.AudioManager
import android.telecom.CallAudioState
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class RNAudioSpeakerModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  private val audioManager: AudioManager =
    reactContext.getSystemService(Context.AUDIO_SERVICE) as AudioManager

  override fun getName(): String = "RNAudioSpeaker"

  private fun hasActiveConnection(): Boolean =
    ConnectionHolder.currentConnection != null

  @ReactMethod
  fun switchToSpeaker() {
    if (hasActiveConnection()) {
      ConnectionHolder.currentConnection?.setRouteToSpeaker()
    } else {
      audioManager.mode = AudioManager.MODE_NORMAL
      audioManager.isSpeakerphoneOn = true
    }
  }

  @ReactMethod
  fun switchToReceiver() {
    if (hasActiveConnection()) {
      ConnectionHolder.currentConnection?.setRouteToReceiver()
    } else {
      audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
      audioManager.isSpeakerphoneOn = false
    }
  }

  @ReactMethod
  fun isSpeaker(promise: Promise) {
    if (hasActiveConnection()) {
      val isSpeaker = ConnectionHolder.currentConnection?.callAudioState?.route == CallAudioState.ROUTE_SPEAKER
      promise.resolve(isSpeaker)
    } else {
      promise.resolve(audioManager.isSpeakerphoneOn)
    }
  }

  @ReactMethod
  fun toggleSpeaker() {
    if (hasActiveConnection()) {
      ConnectionHolder.currentConnection?.toggleRoute()
    } else {
      val isSpeakerOn = audioManager.isSpeakerphoneOn
      if (isSpeakerOn) switchToReceiver() else switchToSpeaker()
    }
  }
}
