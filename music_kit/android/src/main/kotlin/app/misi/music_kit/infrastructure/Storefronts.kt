package app.misi.music_kit.infrastructure

import kotlinx.serialization.Serializable

@Serializable
data class Storefronts(val data: Array<Storefront>) {
  override fun equals(other: Any?): Boolean {
    if (this === other) return true
    if (javaClass != other?.javaClass) return false

    other as Storefronts

    if (!data.contentEquals(other.data)) return false

    return true
  }

  override fun hashCode(): Int {
    return data.contentHashCode()
  }
}

@Serializable
data class Storefront(val id: String)
