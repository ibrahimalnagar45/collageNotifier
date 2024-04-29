import 'package:flutter/material.dart';
import 'package:notifyme/constants.dart';
import 'package:notifyme/core/services/firebase_store.dart';
import '../../../../core/services/local_notification.dart';
import '../../../../core/widgets/custom_footer.dart';
import 'event_details_view.dart';
import 'widgets/events_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final LocalNotificationService notificationService;
  // final FirebaseStore firebaseStore = FirebaseStore();
  @override
  void initState() {
    notificationService = LocalNotificationService();
    // firebaseStore.addAllEvents();

    notificationService.initialize();
    listentoNOtification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // persistentFooterButtons: const [
      //   Footer(),
      // ],
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 130,
                child: EventsListView(
                  // firebaseStore:  firebaseStore,
                  notificationService: notificationService,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void listentoNOtification() {
    notificationService.onNotificationAction.stream
        .listen(onNotificationListener);
  }

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EventDetailsView(
            event: allEvents[0],
          ),
        ),
      );
    }
  }
}
