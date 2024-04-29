import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notifyme/core/services/local_notification.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/firebase_store.dart';
import '../event_details_view.dart';
import 'event_card.dart';

class EventsListView extends StatefulWidget {
  const EventsListView({
    super.key,
    required this.notificationService,
    // required this.firebaseStore,
  });
  final LocalNotificationService notificationService;

  @override
  State<EventsListView> createState() => _EventsListViewState();
}

class _EventsListViewState extends State<EventsListView> {
  // final FirebaseStore firebaseStore;
  @override
  Widget build(BuildContext context) {
    // return firebaseStore.getRealTimeChanges(
    //   documentId: collectionName,
    //   widget: ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     itemCount: allEvents.length,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.only(bottom: 20),
    //         child: GestureDetector(
    //           onTap: () {
    //             Navigator.of(context).push(MaterialPageRoute(
    //               builder: (context) {
    //                 return EventDetailsView(
    //                   event: allEvents[index],
    //                 );
    //               },
    //             ));
    //           },
    //           child: EventCard(
    //             notificationService: notificationService,
    //             event: allEvents[index],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: allEvents.length,
      itemBuilder: (context, index) {
        widget.notificationService.showSceduledNotification(
          id: index,
          title: allEvents[index].title,
          event: allEvents[index],
          body: allEvents[index].description,
        );
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return EventDetailsView(
                    event: allEvents[index],
                  );
                },
              ));
            },
            child: EventCard(
              notificationService: widget.notificationService,
              event: allEvents[index],
            ),
          ),
        );
      },
    );
  }
}
