package fi.metatavu.noheva_visitor_ui

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.Settings
import android.util.DisplayMetrics
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (!Settings.canDrawOverlays(applicationContext)) {
            val intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION)
            val uri = Uri.fromParts("package", packageName, null)
            intent.data = uri
            startActivityForResult(intent, REQUEST_OVERLAY_PERMISSIONS)

            return

        }

        val currentDpi = resources.configuration.densityDpi
        val newDpi = 162
        println("DPI: $currentDpi")
        val configuration = resources.configuration
        configuration.densityDpi = (75).toInt() // Converts to dpi
        windowManager
        resources.updateConfiguration(configuration, resources.displayMetrics)

    }

    companion object {
        const val REQUEST_OVERLAY_PERMISSIONS = 100
    }
}
