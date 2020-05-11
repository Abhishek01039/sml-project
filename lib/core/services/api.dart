class Api {
  static final _api = Api._internal();

  factory Api() {
    return _api;
  }
  Api._internal();

  // Future<http.Response> sendMessage(String endPath, String body) {
  //   Uri uri = Uri.http(baseUrl, '$path/$endPath');
  //   http.post(uri, body: body, headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer token $token',
  //   }).then((value) {
  //     return value;
  //   });
  //   return null;
  // }

}
