class HadithFavorite {
  final String title;
  final String source;
  final String arabicText;
  final String translation;

  HadithFavorite({
    required this.title,
    required this.source,
    required this.arabicText,
    required this.translation,
  });
}

class FavoritesService {
  static final List<HadithFavorite> _favorites = [];
  static List<HadithFavorite> get favorites => _favorites;
  static void add(HadithFavorite hadith) {
    if (!_favorites.any((item) => item.title == hadith.title)) {
      _favorites.add(hadith);
    }
  }

  static void remove(HadithFavorite hadith) {
    _favorites.removeWhere((item) => item.title == hadith.title);
  }

  static bool isFavorite(String title) {
    return _favorites.any((item) => item.title == title);
  }
}
