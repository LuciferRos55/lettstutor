import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../global_state/app_provider.dart';
import '../../global_state/auth_provider.dart';
import '../../models/schedule_model/booking_info_model.dart';
import '../../services/schedule_service.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'card_coming.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  bool _isLoading = true;
  List<BookingInfo> _upcomming = [];
  bool isLoadMore = false;
  int page = 1;
  int perPage = 10;
  late ScrollController _scrollController;
  String? token;

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

  void fetchUpcomming(String token) async {
    setState(() {
      _isLoading = true;
    });
    final res = await ScheduleService.getUpcomming(page, perPage, token);
    if (mounted && _isLoading) {
      setState(() {
        _upcomming = res;
        _isLoading = false;
      });
    }
  }

  void loadMore() async {
    if (_scrollController.position.extentAfter < page * perPage) {
      setState(() {
        isLoadMore = true;
        page++;
      });

      try {
        final res = await ScheduleService.getUpcomming(page, perPage, token as String);
        if (mounted) {
          setState(() {
            _upcomming.addAll(res);
            isLoadMore = false;
          });
        }
      } catch (e) {
        showTopSnackBar(context, const CustomSnackBar.error(message: "Cannot load more"),
            showOutAnimationDuration: const Duration(milliseconds: 1000),
            displayDuration: const Duration(microseconds: 4000));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final lang = Provider.of<AppProvider>(context).language;

    setState(() {
      token = authProvider.tokens!.access.token;
    });

    if (_isLoading) {
      fetchUpcomming(authProvider.tokens!.access.token);
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        Expanded(
          child: _upcomming.isEmpty
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
                            lang.dontHaveUpcoming,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _upcomming.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: UpComingCard(
                        upcomming: _upcomming[index],
                        refetch: fetchUpcomming,
                      ),
                    );
                  },
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
    );
  }
}
