package app.misi.music_kit.infrastructure

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class UserStorefrontRepository {
  suspend fun getStorefrontId(
    developerToken: String,
    musicUserToken: String
  ): Result<String> {
    return withContext(Dispatchers.IO) {
      try {
        val result = MusicApi.create().getStorefrontId(developerToken, musicUserToken)
        Result.success(result)
      } catch (exception: Exception) {
        Result.failure(exception)
      }
    }
  }
}