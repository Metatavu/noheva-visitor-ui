package fi.metatavu.noheva_visitor_ui;

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * Broadcast receiver that starts main activity when device boots
 */
class NohevaVisitorUiBootReceiver: BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {        
        Log.d(javaClass.name, "Received boot completed intent!")
        val mainActivityIntent = Intent(context, MainActivity::class.java)
        mainActivityIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        Log.d(javaClass.name, "Starting main activity...")
        context.startActivity(mainActivityIntent)
    }
}