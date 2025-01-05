package app.misi.music_kit.infrastructure

import app.misi.music_kit.util.httpClient

interface MusicApi {
  suspend fun getStorefrontId(
    developerToken: String,
    musicUserToken: String
  ): String

  companion object {
    fun create(): MusicApiImpl {
      return MusicApiImpl(
        httpClient
      )
    }
  }
}

//sealed class Result {
//  class SuccessWithData<T>(val data: T): Result()
//  class Error(val exception: Exception): Result()
//}