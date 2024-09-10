package com.rnaudiospeaker

import android.content.Context
import android.media.AudioManager
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class RNAudioSpeakerModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {
    var audioManager: AudioManager

    init {
        audioManager = reactContext.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    }

    override fun getName(): String {
        return "RNAudioSpeaker"
    }

    @ReactMethod
    fun switchToSpeaker() {
        audioManager.setMode(AudioManager.MODE_NORMAL)
        audioManager.setSpeakerphoneOn(true)
    }

    @ReactMethod
    fun switchToReceiver() {
        audioManager.setMode(AudioManager.MODE_IN_COMMUNICATION)
        audioManager.setSpeakerphoneOn(false)
    }

    @ReactMethod
    fun isSpeaker(promise: Promise) {
        promise.resolve(audioManager.isSpeakerphoneOn())
    }

    @ReactMethod
    fun toggleSpeaker() {
        val isSpeakerOn = audioManager.isSpeakerphoneOn()
        if (isSpeakerOn) {
            switchToReceiver()
        } else {
            switchToSpeaker()
        }
    }
}
