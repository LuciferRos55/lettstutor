import 'package:flutter/cupertino.dart';
import '/data/tutors_sample.dart';
import '/models/tutor/tutor.dart';
import '/screens/home_page/components/card_tutor.dart';

class RecommendTutors {
  List<Widget> tutors = [];

  RecommendTutors() {
    List<Tutor> sampleTutors = TutorsSample.tutors.sublist(0, 4);
    for (int i = 0; i < sampleTutors.length; i++) {
      tutors.add(CardTutor(tutor: sampleTutors[i]));
    }
  }
}
