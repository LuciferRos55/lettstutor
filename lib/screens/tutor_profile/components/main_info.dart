import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettstutor/constants/list_contries.dart';
import 'package:lettstutor/models/tutor_model/tutor_model.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/services/user_service.dart';
import 'package:lettstutor/widgets/rate_stars.dart';
import 'package:provider/provider.dart';

class MainInfo extends StatefulWidget {
  const MainInfo({Key? key, required this.tutor}) : super(key: key);

  final Tutor tutor;

  @override
  State<MainInfo> createState() => _MainInfoState();
}

class _MainInfoState extends State<MainInfo> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isFavorite = widget.tutor.isFavorite ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10, right: 15),
                height: 60,
                width: 60,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.network(
                        widget.tutor.user!.avatar,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.tutor.user!.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.tutor.profession,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      countryList[widget.tutor.user!.country] as String,
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
          RateStars(count: widget.tutor.avgRating ?? 5),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              onTap: () async {
                if (widget.tutor.isFavorite != null && !isFavorite) {
                  final res = await UserService.addAndRemoveTutorFavorite(
                      widget.tutor.userId, authProvider.tokens!.access.token);
                  if (res) {
                    setState(() {
                      isFavorite = true;
                    });
                  }
                } else {
                  final res = await UserService.addAndRemoveTutorFavorite(
                      widget.tutor.userId, authProvider.tokens!.access.token);
                  if (res) {
                    setState(() {
                      isFavorite = false;
                    });
                  }
                }
              },
              child: !isFavorite
                  ? SvgPicture.asset(
                      "asset/svg/ic_heart.svg",
                      width: 35,
                      height: 35,
                      color: Colors.pink,
                    )
                  : SvgPicture.asset(
                      "asset/svg/ic_heart_fill.svg",
                      width: 35,
                      height: 35,
                      color: Colors.pink,
                    ),
            ),
          )
        ])
      ],
    );
  }
}
