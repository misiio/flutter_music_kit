package app.misi.music_kit

import android.content.Intent
import android.util.Log
import app.misi.music_kit.util.Constant.LOG_TAG
import com.apple.android.sdk.authentication.AuthenticationManager
import com.apple.android.sdk.authentication.TokenError
import io.flutter.plugin.common.PluginRegistry

class AuthActivityResultHandler(
  private val authenticationManager: AuthenticationManager,
  private val completionHandler: ((String?, TokenError?) -> Unit)?
) : PluginRegistry.ActivityResultListener {
  companion object {
    const val ERR_REQUEST_USER_TOKEN = "ERR_REQUEST_USER_TOKEN"
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    val tokenResult = authenticationManager.handleTokenResult(data)
    if (tokenResult.isError) {
      val error = tokenResult.error
      completionHandler?.let { it(null, error) }
    } else {
      val musicUserToken = tokenResult.musicUserToken
      Log.d(LOG_TAG, "Authentication.onActivityResult() musicUserToken: ${musicUserToken.length}")
      completionHandler?.let { it(musicUserToken, null) }
    }
    return true
  }
}
