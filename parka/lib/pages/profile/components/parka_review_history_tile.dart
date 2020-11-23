import 'package:ParkA/components/rating/star_rating.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class ParkaReviewHistoryTile extends StatelessWidget {
  final double rating;

  const ParkaReviewHistoryTile({
    Key key,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double tileHeight = constraints.maxWidth / 2.5;
        final double imageContainerSize =
            (constraints.maxHeight < constraints.maxWidth
                    ? constraints.maxHeight
                    : constraints.maxWidth) /
                6;

        return Container(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          height: tileHeight,
          // color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      margin: EdgeInsets.only(right: 8.0),
                      width: imageContainerSize,
                      height: imageContainerSize,
                      child: ParkaCircleAvatarWidget(
                        pictureSizeDivider: 2.0,
                        imageUrl:
                            "https://upload.wikimedia.org/wikipedia/commons/3/3f/TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Sebastiano Faiella",
                          style: kParkaButtonTextStyle.copyWith(
                            fontSize: 22.0,
                          ),
                        ),
                        StarRating(
                          rating: rating.toInt(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Me agrado poco el parqueo me dieron golpe y me amenazaron con una apunalada",
                  style: kParkaInputTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Hace 6 meses",
                  style: kParkaInputTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(
                      0xFF7B7777,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0xFF949494),
              ),
            ],
          ),
        );
      },
    );
  }
}
