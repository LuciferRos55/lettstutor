import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lettstutor/models/schedule_model/booking_info_model.dart';
import 'package:lettstutor/global_state/app_provider.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/services/schedule_service.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UpComingCard extends StatelessWidget {
  const UpComingCard({Key? key, required this.upcomming, required this.refetch}) : super(key: key);

  final BookingInfo upcomming;
  final Function(String) refetch;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final base64Decoded = base64.decode(base64.normalize(upcomming.studentMeetingLink.split("token=")[1].split(".")[1]));
    final urlObject = utf8.decode(base64Decoded);
    final jsonRes = json.decode(urlObject);
    final String roomId = jsonRes['room'];
    final String tokenMeeting = upcomming.studentMeetingLink.split("token=")[1];

    final lang = Provider.of<AppProvider>(context).language;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10000),
                          child: CachedNetworkImage(
                            imageUrl: upcomming.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar as String,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          upcomming.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name as String,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            DateFormat.yMEd().format(DateTime.fromMillisecondsSinceEpoch(upcomming.scheduleDetailInfo!.startPeriodTimestamp)),
                            style: const TextStyle(fontSize: 13),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(upcomming.scheduleDetailInfo!.startPeriodTimestamp)),
                              style: const TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 1), color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
                          ),
                          const Text("-"),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(upcomming.scheduleDetailInfo!.endPeriodTimestamp)),
                              style: const TextStyle(fontSize: 10, color: Colors.orange),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange, width: 1), color: Colors.orange[50], borderRadius: BorderRadius.circular(4)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final now = DateTime.now();
                        final start = DateTime.fromMillisecondsSinceEpoch(upcomming.scheduleDetailInfo!.startPeriodTimestamp);
                        if (start.isAfter(now) && now.difference(start).inHours.abs() >= 2) {
                          final res = await ScheduleService.cancelClass(authProvider.tokens!.access.token, upcomming.scheduleDetailId);
                          if (res) {
                            refetch(authProvider.tokens!.access.token);
                            showTopSnackBar(
                              context,
                              CustomSnackBar.success(
                                message: lang.removeUpcomingSuccess,
                                backgroundColor: Colors.green,
                              ),
                              showOutAnimationDuration: const Duration(milliseconds: 700),
                              displayDuration: const Duration(milliseconds: 200),
                            );
                          }
                        } else {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(message: lang.removeUpcomingFail),
                            showOutAnimationDuration: const Duration(milliseconds: 700),
                            displayDuration: const Duration(milliseconds: 200),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[200] as Color),
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              lang.cancel,
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        if (isVisibleMeetingBtn(upcomming)) {
                          final options = JitsiMeetingOptions(room: roomId)
                            ..serverURL = "https://meet.lettutor.com"
                            ..audioOnly = true
                            ..audioMuted = true
                            ..token = tokenMeeting
                            ..videoMuted = true;

                          await JitsiMeet.joinMeeting(options);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: isVisibleMeetingBtn(upcomming) ? Colors.blue : Colors.grey[200] as Color),
                            color: isVisibleMeetingBtn(upcomming) ? Colors.blue : Colors.grey[200] as Color,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              lang.goToMeeting,
                              style: TextStyle(color: isVisibleMeetingBtn(upcomming) ? Colors.white : Colors.grey[500] as Color),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool isVisibleMeetingBtn(BookingInfo bookingInfo) {
  final now = DateTime.now();
  final start = DateTime.fromMillisecondsSinceEpoch(bookingInfo.scheduleDetailInfo!.startPeriodTimestamp);
  return (now.day == start.day && now.month == start.month && now.year == start.year);
}
