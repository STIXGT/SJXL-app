import 'package:http/http.dart' as http;

class ApiService {
  registerPost() async {
    var url = Uri.https('http://localhost:8000/api/v1/user/register/');
    var response = await http.post(url, body: {
      "email": "josevilla@gmail.com",
      "name": "Jose",
      "last_name": "Villa",
      "photo": null,
      "rol": 2,
      "password": "admin",
      "birth_date": "1992-02-19",
      "sex": "M",
      "phone": "0981113122",
      "status": 1,
      "username": "josevilla@gmail.com"
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.https('example.com', 'foobar.txt')));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  loginPost(String email, String password) async {
    var url = Uri.https('http://localhost:8000/api/v1/login/');
    var response =
        await http.post(url, body: {"email": email, "password": password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
