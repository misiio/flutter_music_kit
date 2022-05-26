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
      canBecomeSubscriber: map["canBecomeSubscriber"],
      canPlayCatalogContent: map["canPlayCatalogContent"],
      hasCloudLibraryEnabled: map["hasCloudLibraryEnabled"],
    );
  }

  @override
  String toString() {
    return 'MusicSubscription(canBecomeSubscriber: $canBecomeSubscriber, canPlayCatalogContent:$canPlayCatalogContent, hasCloudLibraryEnabled:$hasCloudLibraryEnabled)';
  }
}
