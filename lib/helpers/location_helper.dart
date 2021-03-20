import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_APY_KEY = 'AIzaSyDKhYZAxyAA4eU-FqTtMiCAUl3ywjyTZJI';

class LocationHelper{
  static String generateLocationPreviewImage({double latitude, double longitute}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitute&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitute&key=$GOOGLE_APY_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_APY_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}