
class Event {
  final String? image;
  final String title;
  final String description;
  final String? location;
  final DateTime dateTime;

  const Event({
    this.location = 'Egypt, alx',
    this.image,
  required  this.title,
  required  this.description,
  required  this.dateTime,
  });
}