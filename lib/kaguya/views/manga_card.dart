import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kaguya/kaguya/models/manga.dart';
import 'package:kaguya/kaguya/views/marquee.dart';
import 'package:transparent_image/transparent_image.dart';

class MangaCardWidget extends StatefulWidget {
  final Manga manga;

  MangaCardWidget({@required this.manga});

  @override
  _MangaCardWidgetState createState() => _MangaCardWidgetState();
}

class _MangaCardWidgetState extends State<MangaCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Expanded(
//                        flex: 0,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: CachedNetworkImageProvider(
                  this.widget.manga.coverUrl,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: MarqueeWidget(
                  direction: Axis.horizontal,
                  child: Text(
                    this.widget.manga.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                subtitle: MarqueeWidget(
                  direction: Axis.horizontal,
                  child: Text(
                    this.widget.manga.author,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                this.widget.manga.desc,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
