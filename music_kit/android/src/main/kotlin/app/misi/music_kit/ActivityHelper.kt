package app.misi.music_kit

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import app.misi.music_kit.util.constant.GeneralConstant.LOG_TAG
import com.apple.android.sdk.authentication.AuthenticationFactory
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener

class ActivityHelper(private var applicationContext: Context, var activity: Activity? = null) :
  ActivityResultListener {
  companion object {
    const val REQUEST_CODE_APPLE_MUSIC_AUTH = 100
    const val ACTIVITY_NOT_ATTACHED_MESSAGE =
      "Could not launch the activity because the plugin is not attached to any activity"
  }

  private val activityResultMap: HashMap<Int, ActivityResultListener> = linkedMapOf()

  fun showAuthActivity(result: MethodChannel.Result, developerToken: String, completionHandler: ((String) -> Unit)?) {
    if (activity == null) {
      Log.d(LOG_TAG, ACTIVITY_NOT_ATTACHED_MESSAGE)
      return
    }

    val authenticationManager =
      AuthenticationFactory.createAuthenticationManager(applicationContext)

    activityResultMap[REQUEST_CODE_APPLE_MUSIC_AUTH] = AuthActivityResultHandler(result, authenticationManager, completionHandler)

    val intent = authenticationManager.createIntentBuilder(developerToken)
      .setHideStartScreen(false)
      .setStartScreenMessage("To play the full song, connect Misica to Apple Music.") //todo:localize
      .build()

    activity?.startActivityForResult(intent, REQUEST_CODE_APPLE_MUSIC_AUTH)
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (!activityResultMap.containsKey(requestCode)) {
      return false
    }

    return activityResultMap
      .getValue(requestCode)
      .onActivityResult(requestCode, resultCode, data)
  }
}