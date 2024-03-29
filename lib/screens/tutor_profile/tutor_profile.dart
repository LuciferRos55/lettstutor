import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettstutor/constants/learning_topics.dart';
import 'package:lettstutor/constants/list_languages.dart';
import 'package:lettstutor/models/tutor_model/tutor_model.dart';
import 'package:lettstutor/models/user_model/feedback_model.dart';
import 'package:lettstutor/global_state/app_provider.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/screens/tutor_profile/components/booking_feature.dart';
import 'package:lettstutor/screens/tutor_profile/components/infor_chip.dart';
import 'package:lettstutor/screens/tutor_profile/components/main_info.dart';
import 'package:lettstutor/screens/tutor_profile/components/rate_comment.dart';
import 'package:lettstutor/services/tutor_service.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class TutorProfile extends StatefulWidget {
  const TutorProfile({Key? key, required this.tutorID}) : super(key: key);
  final String tutorID;

  @override
  State<TutorProfile> createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  bool isLoading = true;
  Tutor? tutor;
  VideoPlayerController? _controller;
  ChewieController? _chewieController;

  void fetchTutor(String token) async {
    final tutor = await TutorService.getTutor(widget.tutorID, token);

    setState(() {
      this.tutor = tutor;
      isLoading = false;
      _controller = VideoPlayerController.network(this.tutor!.video as String);
      _chewieController = ChewieController(
        aspectRatio: 3 / 2,
        videoPlayerController: _controller as VideoPlayerController,
        autoPlay: true,
        looping: true,
      );
    });
  }

  renderFeedbacks() {
    if (tutor!.user!.feedbacks != null) {
      return ListView.builder(
        itemCount: tutor!.user!.feedbacks?.length,
        itemBuilder: (context, index) {
          return RateAndComment(feedback: tutor!.user!.feedbacks?[index] as FeedBack);
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final lang = Provider.of<AppProvider>(context).language;

    if (authProvider.tokens != null && isLoading) {
      fetchTutor(authProvider.tokens?.access.token as String);
    }

    if (tutor == null) {
      return const SafeArea(child: Scaffold(body: Center(child: CircularProgressIndicator())));
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                height: 200,
                margin: const EdgeInsets.only(bottom: 10),
                child:
                    _chewieController != null ? Chewie(controller: _chewieController as ChewieController) : Container(),
              ),
              MainInfo(tutor: tutor as Tutor),
              BookingFeature(tutorId: tutor!.userId),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(tutor!.bio, style: const TextStyle(fontSize: 13)),
              ),
              InforChips(
                  title: lang.languages,
                  chips: listLanguages.entries
                      .where((element) => tutor!.languages.split(",").contains(element.key))
                      .map((e) => e.value["name"] as String)
                      .toList()),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lang.interests,
                      style: const TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        (tutor?.interests as String).trim(),
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
              InforChips(
                  title: lang.specialties,
                  chips: listLearningTopics.entries
                      .where((element) => tutor!.specialties.split(",").contains(element.key))
                      .map((e) => e.value)
                      .toList()),
              Container(
                margin: const EdgeInsets.only(bottom: 6, top: 15),
                child: Text(
                  lang.rateAndComment,
                  style: const TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
              renderFeedbacks(),
            ],
          ),
        ),
      ),
    ));
  }
}
