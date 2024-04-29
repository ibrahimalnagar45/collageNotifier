import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/event_model.dart';
import 'widgets/custom_button.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          event.title!,
          style: const TextStyle(
            color: kcolor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                    aspectRatio: 1 / 1,

                    // height: MediaQuery.of(context).size.height * .5,
                    child: Image.asset(
                        event.image ?? 'assets/images/no_image.jpg')),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(event.location!,
                      style: Styles.normalStyle.copyWith(
                        color: Colors.black.withOpacity(.5),
                      )),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      event.dateTime.isBefore(DateTime.now())
                          ? '${event.dateTime.day}/${event.dateTime.month}  ${event.dateTime.hour + 12}: ${event.dateTime.minute} '
                          : 'this event ended ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                event.description!,
                style: Styles.style20,
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            CustomButton(
              text: 'Notify Me',
              onPressed: () async {},
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
