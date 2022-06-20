package app.misi.music_kit

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** MusicKitPlugin */
class MusicKitPlugin : FlutterPlugin, ActivityAware {
  private lateinit var activityHelper: ActivityHelper
  private lateinit var channelHandler: ChannelHandler

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    activityHelper = ActivityHelper(flutterPluginBinding.applicationContext)
    channelHandler = ChannelHandler(activityHelper)
    channelHandler.startListening(flutterPluginBinding.binaryMessenger)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    binding.addActivityResultListener(activityHelper)
    activityHelper.activity = binding.activity
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }

  override fun onDetachedFromActivity() {
    activityHelper.activity = null
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channelHandler.stopListening()
  }
}

