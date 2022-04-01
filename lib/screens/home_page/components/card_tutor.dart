import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/models/tutor/tutor.dart';
import '/provider/user_provider.dart';
import '/widgets/avatar_circle.dart';
import '/widgets/rate_stars.dart';
import 'package:provider/provider.dart';
import '/routes/route.dart' as routes;

class CardTutor extends StatelessWidget {
  const CardTutor({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final exists = userProvider.idFavorite.where((element) => element == tutor.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            routes.tutorProfilePage,
            arguments: {"tutor": tutor},
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: AvatarCircle(width: 70, height: 70, source: tutor.image),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        tutor.fullName,
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    RateStars(count: tutor.getTotalStar()),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (exists.isNotEmpty) {
                                    userProvider.removeFavorite(tutor.id);
                                  } else {
                                    userProvider.addFavorite(tutor.id);
                                  }
                                },
                                child: exists.isEmpty
                                    ? SvgPicture.asset(
                                        "asset/svg/ic_heart.svg",
                                        width: 35,
                                        height: 35,
                                        color: Colors.blue,
                                      )
                                    : SvgPicture.asset(
                                        "asset/svg/ic_heart_fill.svg",
                                        width: 35,
                                        height: 35,
                                        color: Colors.pink,
                                      ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                              itemCount: tutor.languages.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 5, right: 8),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    tutor.languages[index],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 0.2,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      tutor.intro,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}