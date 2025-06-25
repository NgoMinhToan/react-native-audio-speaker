package com.rnaudiospeaker

import android.telecom.CallAudioState
import android.telecom.Connection
import android.telecom.DisconnectCause

object ConnectionHolder {
    var currentConnection: MyConnection? = null
}

class MyConnection : Connection() {

    init {
        ConnectionHolder.currentConnection = this
    }

    override fun onDisconnect() {
        // Báo hệ thống cuộc gọi đã disconnect
        setDisconnected(DisconnectCause(DisconnectCause.LOCAL))
        // Giải phóng reference
        ConnectionHolder.currentConnection = null
        super.onDisconnect()
        // KHÔNG gọi super.onDestroy() ở đây
    }

    override fun onAnswer() {
        setActive()
    }

    override fun onReject() {
        setDisconnected(DisconnectCause(DisconnectCause.REJECTED))
        onDisconnect()
    }

    override fun onHold() {
        setOnHold()
    }

    override fun onUnhold() {
        setActive()
    }

    override fun onCallAudioStateChanged(state: CallAudioState) {
        super.onCallAudioStateChanged(state)
        // (tuỳ chọn) gửi event về JS ở đây nếu cần
    }

    // Các phương thức điều khiển âm thanh từ JS
    fun setRouteToSpeaker() {
        setAudioRoute(CallAudioState.ROUTE_SPEAKER)
    }

    fun setRouteToReceiver() {
        setAudioRoute(CallAudioState.ROUTE_EARPIECE)
    }

    fun setRouteToBluetooth() {
        setAudioRoute(CallAudioState.ROUTE_BLUETOOTH)
    }

    fun toggleRoute() {
        val route = callAudioState.route
        if (route == CallAudioState.ROUTE_SPEAKER) setRouteToReceiver()
        else setRouteToSpeaker()
    }
}
