class MusicSubscription {
  MusicSubscription({
    this.canBecomeSubscriber,
    this.canPlayCatalogContent,
    this.hasCloudLibraryEnabled,
  });

  final bool? canBecomeSubscriber;
  final bool? canPlayCatalogContent;
  final bool? hasCloudLibraryEnabled;

  static MusicSubscription fromMap(Map<String, dynamic> map) {
    return MusicSubscription(
      canBecomeSubscriber: map["canBecomeSubscriber"] as bool?,
      canPlayCatalogContent: map["canPlayCatalogContent"] as bool?,
      hasCloudLibraryEnabled: map["hasCloudLibraryEnabled"] as bool?,
    );
  }

  @override
  String toString() {
    return 'MusicSubscription(canBecomeSubscriber: $canBecomeSubscriber, canPlayCatalogContent:$canPlayCatalogContent, hasCloudLibraryEnabled:$hasCloudLibraryEnabled)';
  }
}
