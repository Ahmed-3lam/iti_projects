import 'package:http/http.dart' as http;

class HttpClientHelper {
  var client = http.Client();

  Future login({
    required String email,
    required String password,
  }) async {
    try{
      var response =await  client
          .post(Uri.parse("https://student.valuxapps.com/api/login"), body: {
        "email": email,
        "password": password,
      });
      print("============================   "+response.body);
    }catch(e){
      print(e);
    }

  }
}
