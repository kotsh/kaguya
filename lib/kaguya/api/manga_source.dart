import 'package:kaguya/kaguya/models/manga.dart';

abstract class MangaSource {
  Future<List<Manga>> getManga() async {
    Future<List<Manga>> future = new Future(() => <Manga>[
          // TODO: make actual api call
          Manga(
              "Boku Girl",
              """Mizuki gets confessed to by a boy in front of a special Mirror. Legend has it, that if you confess to someone you like in front of that mirror your wish comes true. There is a slight Problem in this Equation: Mizuki is just a very feminine looking boy. Also it seems that he caught the Attention of the Norse Trickster God Loki while glancing into the Mirror. Loki decides out of boredom to mess with Mizuki and turns him into a real Girl. """,
              "SUGITO Akira",
              "https://cdn.mangaeden.com/mangasimg/200x/c7/c70b6250283e73f401a4185f1333b4e65725d0f487ec02668fcb280b.jpg",
              <String>[
                "Supernatural",
                "Comedy",
                "Romance",
                "School Life",
                "Seinen",
                "Mature",
                "Ecchi",
                "Gender Bender"
              ],
              "https://www.mangaeden.com/en/en-manga/boku-girl/",
              MangaStatus.Completed),
        ]);
    return future;
  }
}
