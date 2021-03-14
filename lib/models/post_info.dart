//Model class used to save data that is entered in each journal entry
class PostFields {
  int quantity;
  String imageURL;
  double latitude;
  double longitude;
  DateTime date;

  PostFields.fromMap(Map<String, dynamic> map)
      : assert(map['quantity'] != null),
        assert(map['imageURL'] != null),
        assert(map['latitude'] != null),
        assert(map['longitude'] != null),
        assert(map['date'] != null),
        quantity = map['quantity'],
        imageURL = map['imageURL'],
        latitude = map['latitude'],
        longitude = map['longitude'],
        date = map['date'];

  PostFields(
      {this.quantity, this.imageURL, this.latitude, this.longitude, this.date});
}
