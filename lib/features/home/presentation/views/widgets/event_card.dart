import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:notifyme/core/services/local_notification.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/event_model.dart';
import 'custom_button.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
    required this.event,
    this.inMyStore = false,
    this.notificationService,
  });
  final Event event;

  final bool inMyStore;
  final LocalNotificationService? notificationService;
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.event.image ?? 'assets/images/no_image.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.event.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.event.location} ',
                        style: Styles.normalStyle.copyWith(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  !(widget.event.dateTime.isBefore(DateTime.now()))
                      ? '${widget.event.dateTime.day}/${widget.event.dateTime.month}  ${widget.event.dateTime.hour}: ${widget.event.dateTime.minute}'
                      : ' this Event has been  ended',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 151, 14, 4),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
