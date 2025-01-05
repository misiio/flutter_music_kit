package app.misi.music_kit.util

import com.apple.android.sdk.authentication.TokenProvider

class AppleMusicTokenProvider(private val developerTokenInput: String, private val userTokenInput: String): TokenProvider {
  override fun getDeveloperToken(): String {
    return developerTokenInput
  }

  override fun getUserToken(): String {
    return userTokenInput
  }
}