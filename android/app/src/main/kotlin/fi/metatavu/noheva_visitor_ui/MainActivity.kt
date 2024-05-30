package fi.metatavu.noheva_visitor_ui

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.Settings
import android.util.DisplayMetrics
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME).setMethodCallHandler { call, result ->
            when (call.method) {
                SET_VM_DENSITY_METHOD -> {
                    val newDensity = call.argument<Int>("density")
                        ?: return@setMethodCallHandler result.error("INVALID_ARGUMENT", "Density not provided", null)
                    val configuration = resources.configuration
                    configuration.densityDpi = newDensity
                    resources.updateConfiguration(configuration, resources.displayMetrics)
                    resources.displayMetrics.density
                    result.success(null)
                }
                GET_VM_DENSITY_METHOD -> {
                    result.success(resources.configuration.densityDpi)
                }
                RESTART_ACTIVITY_METHOD -> {
                    val intent = Intent(this, this::class.java)
                    finish()
                    startActivity(intent)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (!Settings.canDrawOverlays(applicationContext)) {
            val intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION)
            val uri = Uri.fromParts("package", packageName, null)
            intent.data = uri
            startActivityForResult(intent, REQUEST_OVERLAY_PERMISSIONS)

            return
        }
    }

    companion object {
        const val REQUEST_OVERLAY_PERMISSIONS = 100
        const val CHANNEL_NAME = "fi.metatavu.noheva_visitor_ui/platform_service"
        const val SET_VM_DENSITY_METHOD = "setVMDensity"
        const val GET_VM_DENSITY_METHOD = "getVMDensity"
        const val RESTART_ACTIVITY_METHOD = "restartActivity"
    }
}
