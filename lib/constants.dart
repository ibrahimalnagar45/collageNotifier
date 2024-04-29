import 'package:flutter/material.dart';

import 'features/home/data/models/event_model.dart';

const Color kcolor = Colors.blue;
const String collectionName = 'events';
List<Event> myEvents = [];
List<Event> allEvents = [
  Event(
    image: 'assets/images/event1.jpeg',
    title: 'final exams',
    description: 'final exam of the third year of computer science',
    // dateTime: DateTime(
    //   2024,
    //   4,
    //   29,
    //   1,
    //   10,
    // ),
    dateTime: DateTime.now().add(const Duration(minutes: 10)),
  ),
  Event(
    image: 'assets/images/language task.jpeg',
    title: 'language task',
    description: 'final opertinty of language theory task',
    // dateTime: DateTime(
    //   2024,
    //   4,
    //   29,
    //   1,
    //   9,
    // ),
    dateTime: DateTime.now().add(const Duration(minutes: 3)),
  ),
  Event(
    image: 'assets/images/online section.jpeg',
    title: 'image processing online section',
    description:
        'lets dive deeper into image processing with our online section',
    dateTime: DateTime.now().add(const Duration(minutes: 3)),
    // dateTime:  DateTime(
    //   2024,
    //   4,
    //   29,
    //   1,
    //   58,
    // ),
  ),
  Event(
    image: 'assets/images/practical_exam_event.jpeg',
    title: 'final practical exam',
    description: 'practical exam',
    dateTime: DateTime.now().add(const Duration(minutes: 3)),
    // dateTime: DateTime.now().add(
    //   const Duration(
    //     seconds: 3,
    //   ),
    // ),
  ),
  Event(
    image: 'assets/images/project_presentaion.jpeg',
    title: ' project presentation',
    description:
        'time to present your project work that you have done with your team',
    dateTime: DateTime.now().add(
      const Duration(minutes: 2),
    ),
  ),
  // Event(
  //   image: 'assets/images/onboarding1.jpeg',
  //   title: 'makeup',
  //   description: 'make make up easy',
  //   dateTime: DateTime.now(),
  // ),
  // Event(
  //   title: 'makeup',
  //   description: 'make make up easy',
  //   dateTime: DateTime.now(),
  // ),
];
