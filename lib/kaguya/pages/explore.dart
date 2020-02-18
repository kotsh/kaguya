import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaguya/kaguya/api/manga_source.dart';
import 'package:kaguya/kaguya/models/manga.dart';
import 'package:kaguya/kaguya/views/marquee.dart';
import "package:transparent_image/transparent_image.dart";

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  MangaSource _mangaSource;
  List<Manga> _manga;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    _manga = <Manga>[
      // test manga
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
    ];

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  Future<Null> _refresh() {
    return _mangaSource.getManga().then((_manga) {
      setState(() => this._manga = _manga);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: GridView.count(
          physics: const AlwaysScrollableScrollPhysics(),
          crossAxisCount: 3,
          children: List.generate(
            _manga.length,
            (index) {
              return InkWell(
                onTap: () {},
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: FadeInImage(
                          placeholder:
                              MemoryImage(kTransparentImage, scale: 2.0),
                          image: CachedNetworkImageProvider(
                            _manga[index].coverUrl,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: MarqueeWidget(
                            direction: Axis.horizontal,
                            child: Text(
                              _manga[index].title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          subtitle: MarqueeWidget(
                            direction: Axis.horizontal,
                            child: Text(
                              _manga[index].author,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          _manga[index].desc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
