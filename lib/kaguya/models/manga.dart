class Manga {
  Manga(String title, String desc, String author, String coverUrl,
      List<String> tags, String url, MangaStatus status) {
    this.title = title;
    this.desc = desc;
    this.author = author;
    this.coverUrl = coverUrl;
    this.tags = tags;
    this.url = url;
    this.status = status;
  }

  String title;
  String desc;
  String author;
  String coverUrl;
  List<String> tags;
  String url;
  MangaStatus status;
}

/// Class that will be displayed to the end user.

enum MangaStatus { Ongoing, Oneshot, Completed, Stopped }
