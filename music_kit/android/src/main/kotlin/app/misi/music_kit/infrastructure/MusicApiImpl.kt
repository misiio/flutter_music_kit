package app.misi.music_kit.infrastructure

import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.request.*
import io.ktor.http.*

class MusicApiImpl(
  private val client: HttpClient
) : MusicApi {
  companion object {
    private const val BASE_URL = "https://api.music.apple.com/v1"
    const val USER_STOREFRONT = "$BASE_URL/me/storefront"
  }

  override suspend fun getStorefrontId(developerToken: String, musicUserToken: String): String {
    val storefronts = client.get(USER_STOREFRONT) {
      headers {
        append(HttpHeaders.Authorization, "Bearer $developerToken")
        append("Music-User-Token", musicUserToken)
      }
    }.body<Storefronts>()

    return storefronts.data.first().id
  }
}