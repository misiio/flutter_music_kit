package app.misi.music_kit

import android.content.Intent
import com.apple.android.sdk.authentication.AuthenticationManager
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class AuthActivityResultHandler(private val result: MethodChannel.Result, private val authenticationManager: AuthenticationManager, private val completionHandler: ((String) -> Unit)?): PluginRegistry.ActivityResultListener {
  companion object {
    const val ERR_REQUEST_USER_TOKEN = "ERR_REQUEST_USER_TOKEN"
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    val tokenResult = authenticationManager.handleTokenResult(data)
    if (tokenResult.isError) {
      val error = tokenResult.error
      result.error(ERR_REQUEST_USER_TOKEN, error.toString(), null)
    } else {
      val musicUserToken = tokenResult.musicUserToken
      completionHandler?.let { it(musicUserToken) }
      result.success(musicUserToken)
    }
    return true
  }
}
