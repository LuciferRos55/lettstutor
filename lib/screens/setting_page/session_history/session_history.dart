import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettstutor/models/schedule_model/booking_info_model.dart';
import 'package:lettstutor/global_state/app_provider.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/screens/setting_page/session_history/session_item.dart';
import 'package:lettstutor/services/schedule_service.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SessionHistoryPage extends StatefulWidget {
  const SessionHistoryPage({Key? key}) : super(key: key);

  @override
  State<SessionHistoryPage> createState() => _SessionHistoryPageState();
}

class _SessionHistoryPageState extends State<SessionHistoryPage> {
  final List<BookingInfo> _bookedList = [];
  bool isLoading = true;
  bool isLoadMore = false;
  int page = 1;
  int perPage = 10;
  late ScrollController _scrollController;
  String? token;
  String? userId;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(loadMore);
  }

  @override
  void dispose() {
    _scrollController.removeListener(loadMore);
    super.dispose();
  }

  void fetchBookedList(String userId, String token) async {
    final res = await ScheduleService.getStudentBookedClass(1, 10, userId, token);
    setState(() {
      _bookedList.addAll(res);
      isLoading = false;
    });
  }

  void loadMore() async {
    if (_scrollController.position.extentAfter < page * perPage) {
      setState(() {
        isLoadMore = true;
        page++;
      });

      try {
        final res = await ScheduleService.getStudentBookedClass(page, perPage, userId as String, token as String);
        if (mounted) {
          setState(() {
            _bookedList.addAll(res);
            isLoadMore = false;
          });
        }
      } catch (e) {
        showTopSnackBar(context, const CustomSnackBar.error(message: "Cannot load more"),
            showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final lang = Provider.of<AppProvider>(context).language;

    setState(() {
      token = authProvider.tokens!.access.token;
      userId = authProvider.userLoggedIn.id;
    });

    if (isLoading) {
      fetchBookedList(authProvider.userLoggedIn.id, authProvider.tokens!.access.token);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 20,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              lang.sessionHistory,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : !isLoading && _bookedList.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "asset/svg/ic_empty.svg",
                            width: 200,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Text(
                              lang.emptySession,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _bookedList.length,
                          controller: _scrollController,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: SessionItem(
                              session: _bookedList[index],
                            ),
                          ),
                        ),
                      ),
                      if (isLoadMore)
                        const SizedBox(
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  ),
      ),
    );
  }
}
