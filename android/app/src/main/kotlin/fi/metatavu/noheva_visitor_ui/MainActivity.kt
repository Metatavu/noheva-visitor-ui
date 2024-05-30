package fi.metatavu.noheva_visitor_ui

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME).setMethodCallHandler(this::methodCallHandler)
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

    /**
     * Method call handler
     *
     * @param call method call
     * @param result method call result
     */
    private fun methodCallHandler(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            SET_WM_DENSITY_METHOD -> setDensity(call, result)
            GET_WM_DENSITY_METHOD -> getDensity(result)
            RESTART_ACTIVITY_METHOD -> restartActivity()
            else -> {
                result.notImplemented()
            }
        }
    }

    /**
     * Restarts the activity
     */
    private fun restartActivity() {
        this.recreate()
    }

    /**
     * Returns the current density
     */
    private fun getDensity(result: MethodChannel.Result) = result.success(resources.configuration.densityDpi)


    /**
     * Sets the density
     *
     * @param call method call
     * @param result method call result
     */
    private fun setDensity(call: MethodCall, result: MethodChannel.Result) {
        val newDensity = call.argument<Int>("density")

        if (newDensity == null) {
            result.error("INVALID_ARGUMENT", "Density not provided", null)
            return
        }

        val configuration = resources.configuration
        configuration.densityDpi = newDensity
        resources.updateConfiguration(configuration, resources.displayMetrics)
        result.success(null)
    }

    companion object {
        const val REQUEST_OVERLAY_PERMISSIONS = 100
        const val CHANNEL_NAME = "fi.metatavu.noheva_visitor_ui/platform_service"
        const val SET_WM_DENSITY_METHOD = "setWMDensity"
        const val GET_WM_DENSITY_METHOD = "getWMDensity"
        const val RESTART_ACTIVITY_METHOD = "restartActivity"
    }
}
