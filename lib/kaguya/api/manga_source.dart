import 'package:kaguya/kaguya/models/manga.dart';

abstract class MangaSource {
  List<Manga> getManga() {}
}
