package app.misi.music_kit

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import app.misi.music_kit.util.Constant.LOG_TAG
import com.apple.android.sdk.authentication.AuthenticationFactory
import com.apple.android.sdk.authentication.TokenError
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener

class ActivityDispatcher(
  private val applicationContext: Context,
  var activity: Activity? = null
) : ActivityResultListener {
  companion object {
    const val REQUEST_CODE_APPLE_MUSIC_AUTH = 100
    const val ACTIVITY_NOT_ATTACHED_MESSAGE =
      "Could not launch the activity because the plugin is not attached to any activity"
  }

  private val activityResultMap: HashMap<Int, ActivityResultListener> = linkedMapOf()

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (!activityResultMap.containsKey(requestCode)) {
      return false
    }

    return activityResultMap
      .getValue(requestCode)
      .onActivityResult(requestCode, resultCode, data)
  }

  fun showAuthActivity(
    developerToken: String,
    startScreenMessage: String?,
    completionHandler: ((String?, TokenError?) -> Unit)?
  ) {
    if (activity == null) {
      Log.d(LOG_TAG, ACTIVITY_NOT_ATTACHED_MESSAGE)
      return
    }

    val authenticationManager =
      AuthenticationFactory.createAuthenticationManager(applicationContext)

    activityResultMap[REQUEST_CODE_APPLE_MUSIC_AUTH] =
      AuthActivityResultHandler(authenticationManager, completionHandler)

    val intent = authenticationManager.createIntentBuilder(developerToken)
      .setHideStartScreen(true)
      .build()

    activity?.startActivityForResult(intent, REQUEST_CODE_APPLE_MUSIC_AUTH)
  }
}