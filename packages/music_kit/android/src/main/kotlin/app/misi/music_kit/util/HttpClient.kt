package app.misi.music_kit.util

import android.util.Log
import app.misi.music_kit.util.Constant.LOG_TAG
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.plugins.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.plugins.logging.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.json.Json

private const val TIME_OUT: Long = 60_000

val httpClient = HttpClient(CIO) {
  install(HttpTimeout) {
    connectTimeoutMillis = TIME_OUT
    socketTimeoutMillis = TIME_OUT
  }

  install(ContentNegotiation) {
    json(Json {
      ignoreUnknownKeys = true
    })
  }

  install(Logging) {
    logger = object : Logger {
      override fun log(message: String) {
        Log.d(LOG_TAG, message, null)
      }
    }
    level = LogLevel.ALL
  }
}