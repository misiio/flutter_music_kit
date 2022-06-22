package app.misi.music_kit

import android.util.Log
import androidx.annotation.NonNull
import app.misi.music_kit.util.Constant.LOG_TAG

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** MusicKitPlugin */
class MusicKitPlugin : FlutterPlugin, ActivityAware {
  private lateinit var activityDispatcher: ActivityDispatcher
  private lateinit var channelHandler: ChannelHandler

  companion object {
    init {
      try {
        System.setProperty("org.bytedeco.javacpp.maxphysicalbytes", "0")
        System.setProperty("org.bytedeco.javacpp.maxbytes", "0")
        System.loadLibrary("c++_shared")
        System.loadLibrary("appleMusicSDK")
      } catch (e: Exception) {
        Log.e(LOG_TAG, "Could not load library due to: " + Log.getStackTraceString(e))
        throw e
      }
    }
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    activityDispatcher = ActivityDispatcher(flutterPluginBinding.applicationContext)
    channelHandler = ChannelHandler(flutterPluginBinding.applicationContext, activityDispatcher)
    channelHandler.startListening(flutterPluginBinding.binaryMessenger)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    Log.d(LOG_TAG, "onAttachedToActivity")
    binding.addActivityResultListener(activityDispatcher)
    activityDispatcher.activity = binding.activity
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    Log.d(LOG_TAG, "onReattachedToActivityForConfigChanges")
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivity() {
    Log.d(LOG_TAG, "onDetachedFromActivity")
    activityDispatcher.activity = null
  }

  override fun onDetachedFromActivityForConfigChanges() {
    Log.d(LOG_TAG, "onDetachedFromActivityForConfigChanges")
    onDetachedFromActivity()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Log.d(LOG_TAG, "onDetachedFromEngine")
    channelHandler.stopListening()
    channelHandler.cleanUp()
  }
}

