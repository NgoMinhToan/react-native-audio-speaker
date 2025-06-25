package com.rnaudiospeaker

import android.telecom.Connection
import android.telecom.ConnectionRequest
import android.telecom.ConnectionService

class MyConnectionService : ConnectionService() {

    override fun onCreateOutgoingConnection(
        connectionManagerPhoneAccount: android.telecom.PhoneAccountHandle?,
        request: ConnectionRequest?
    ): Connection {
        return MyConnection()
    }

    override fun onCreateIncomingConnection(
        connectionManagerPhoneAccount: android.telecom.PhoneAccountHandle?,
        request: ConnectionRequest?
    ): Connection {
        return MyConnection()
    }
}
