import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaguya/kaguya/models/manga.dart';
import 'package:kaguya/kaguya/views/marquee.dart';
import "package:transparent_image/transparent_image.dart";

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Manga> _manga;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    _manga = <Manga>[
      // test manga
      Manga(
          "Komi-san wa Komyushou Desu.",
          """Komi-san is the beautiful and admirable girl that no one can take their eyes off of. Almost the whole school sees her as the cold beauty that's out of their league, but Tadano Hitohito knows the truth: she's just really bad at communicating with others.
Komi-san, who wishes to fix this bad habit of hers, tries to improve herself with the help of Tadano-kun.""",
          "ODA Tomohito",
          "https://upload.wikimedia.org/wikipedia/en/d/d1/Cover_Art_Komi-san_wa%2C_Komyushou_desu_Vol_1.jpg",
          <String>["Comedy", "Romance", "School Life", "Slice of Life"],
          "https://www.mangaeden.com/en/en-manga/komi-san-wa-komyushou-desu/",
          MangaStatus.Ongoing),
    ];

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  Future<Null> _refresh() {
//    return getManga().then((_manga) {
//      setState(() => this._manga = _manga);
//    });
    return null;
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
