import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:riderapp/theme/deftheme.dart';

class ReviewCards extends StatelessWidget {
  final String name, address, date, review;
  final int starCount;
  const ReviewCards({
    super.key,
    required this.name,
    required this.address,
    required this.date,
    required this.review,
    required this.starCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar.png"),
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      address,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(135, 10, 0, 10),
                  child: Image.asset("assets/review.png", height: 25),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                review,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RatingBar.builder(
                initialRating: starCount.toDouble(),
                minRating: 1,
                ignoreGestures: true,
                direction: Axis.horizontal,
                // tapOnlyMode: true,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: primaryColor,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(00, 00, 00, 0.61)),
            ),
          ],
        ),
      ),
    );
  }
}
