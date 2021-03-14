import 'package:wasteagram/models/post_info.dart';
import 'package:test/test.dart';

void main() {
  //Test for PostFields class, verifies if values are being mapped correctly
  test('Post created from Map should have appropriate propety values', () {
    final date = DateTime.parse('2020-01-01');
    const imageURL = 'FAKE';
    const quantity = 10;
    const latitude = 1.0;
    const longitude = 2.0;

    final foodWastePost = PostFields.fromMap({
      'date': date,
      'imageURL': imageURL,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude
    });

    expect(foodWastePost.date, date);
    expect(foodWastePost.imageURL, imageURL);
    expect(foodWastePost.quantity, quantity);
    expect(foodWastePost.latitude, latitude);
    expect(foodWastePost.longitude, longitude);
  });
}
