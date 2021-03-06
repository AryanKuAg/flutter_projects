import 'package:flutter/material.dart';
import 'package:flutter_projects/music_app_two/models/album.dart';
import 'file:///C:/Users/kevin/Documents/Projects/flutter/flutter_projects/lib/music_app_two/ui/my_library/widgets/row_stars.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionContainer extends StatelessWidget {
  final Album album;
  final EdgeInsetsGeometry padding;

  const DescriptionContainer({
    Key key,
    @required this.album,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 20,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //--------------------------
          //----TEXT AND STARS
          //--------------------------
          Row(
            children: <Widget>[
              Text(
                "Album",
                style: GoogleFonts.spectral(
                    color: Color(0xffd4af90),
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
              ),
              const Spacer(),
              RowStars(
                color: Color(0xffd4af90),
                size: 14,
                stars: album.rate,
              ),
              const SizedBox(width: 5.0),
              Text(
                "${album.rate}",
                style: GoogleFonts.spectral(
                    fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
          //-------------------------------
          //-----TITLE TEXT
          //-------------------------------
          Text(
            album.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.spectral(
              fontWeight: FontWeight.w800,
              color: Colors.grey[800],
              fontSize: 32,
            ),
          ),
          //----------------------------
          //----ARTIST/BAND/AUTHOR
          //----------------------------
          Text.rich(
            TextSpan(text: 'By ', children: [
              TextSpan(
                text: album.author,
                style: GoogleFonts.poppins(color: Colors.grey[800]),
              ),
            ]),
            style: GoogleFonts.poppins(
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
            ),
          ),
          //----------------------------
          //-----INFO ALBUM
          //----------------------------
          Text.rich(
            TextSpan(
              text: '${album.year}',
              children: [
                _buildDotSpan(),
                TextSpan(text: '${album.songsCount} songs'),
                _buildDotSpan(),
                TextSpan(
                    text:
                        '${album.duration.inHours} hr ${(album.duration - Duration(hours: 1)).inMinutes} min'),
              ],
            ),
            style: GoogleFonts.poppins(
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          //----------------------------------
          //----ALBUM DESCRIPTION
          //----------------------------------
          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(
                album.description,
                overflow: TextOverflow.fade,
                style: GoogleFonts.poppins(
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          //----------------------------------
          //----ALBUM GENRES
          //----------------------------------
          SizedBox(
            height: 45,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 5),
              children: List.generate(
                album.genres.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 5),
                    child: Chip(
                      label: Text(album.genres[index]),
                      labelStyle: GoogleFonts.poppins(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.grey[200],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  WidgetSpan _buildDotSpan() {
    return WidgetSpan(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _Dot(
          sizeDot: 4,
          color: Colors.grey[400],
        ),
      ),
      alignment: PlaceholderAlignment.middle,
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    this.sizeDot,
    this.color,
  }) : super(key: key);
  final double sizeDot;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeDot,
      height: sizeDot,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizeDot),
        color: color,
      ),
    );
  }
}
