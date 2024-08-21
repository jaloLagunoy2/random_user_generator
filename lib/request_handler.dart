import 'dart:convert';
import 'package:http/http.dart' as http;
import 'classes/user_class.dart'; // Import the user class 

Future<User> fetchRandomUser() async {
  //Dev-Note: For debugging , to avoid bombarding fetch to api.
  // var data = jsonDecode('{"results":[{"gender":"female","name":{"title":"Ms","first":"Isobel","last":"Cooper"},"location":{"street":{"number":8899,"name":"Highbrook Drive"},"city":"Hastings","state":"Auckland","country":"New Zealand","postcode":69978,"coordinates":{"latitude":"50.5245","longitude":"58.6929"},"timezone":{"offset":"+4:30","description":"Kabul"}},"email":"isobel.cooper@example.com","login":{"uuid":"71aae650-a751-4566-900e-2c38be729fda","username":"whitedog798","password":"1980","salt":"CtgvAxed","md5":"a8c5a69c98588ac33b63ab7dac06aa2b","sha1":"c65179748110ca1701fbbc983ea70cfe423c9081","sha256":"8805bbdba17e4439dfe700a0ec11b4ccb0dc0952f531e9f611936ba7edda2aa9"},"dob":{"date":"1956-09-30T15:38:42.745Z","age":67},"registered":{"date":"2012-07-28T08:21:09.003Z","age":12},"phone":"(941)-598-6716","cell":"(704)-451-2316","id":{"name":"","value":null},"picture":{"large":"https://randomuser.me/api/portraits/women/72.jpg","medium":"https://randomuser.me/api/portraits/med/women/72.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/72.jpg"},"nat":"NZ"}],"info":{"seed":"acf5999125b62d93","results":1,"page":1,"version":"1.4"}}');
  // return  User.fromJson(data['results'][0]);


  final response = await http.get(Uri.parse('https://randomuser.me/api/'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return User.fromJson(data['results'][0]);
  } else {
    throw Exception('Failed to load user');
  }
}