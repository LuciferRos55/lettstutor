import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettstutor/models/course_model/course_model.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/screens/course/components/about.dart';
import 'package:lettstutor/screens/course/components/banner.dart';
import 'package:lettstutor/screens/course/components/topic.dart';
import 'package:lettstutor/services/course_service.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key, required this.courseId}) : super(key: key);
  final String courseId;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Course? course;
  bool isFetching = true;

  void _loadCourse(String token) async {
    final course = await CourseService.getCourseById(widget.courseId, token);
    setState(() {
      this.course = course;
      isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (isFetching) {
      _loadCourse(authProvider.tokens!.access.token);
    }
    if (course == null) {
      return const SafeArea(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannerCourse(course: course as Course),
              AboutCourse(course: course as Course),
              TopicCourse(course: course as Course),
            ],
          ),
        ),
      ),
    );
  }
}
