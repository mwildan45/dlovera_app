class ApiResponse {
  int get totalDataCount => body["meta"]["total"];
  int get totalPageCount => body["pagination"]["total_pages"];
  List get data => hasDataObject ? body["data"] : body;
  // Just a way of saying there was no error with the request and response return
  bool get allGood => errors!.isEmpty;
  bool hasError() => errors!.isNotEmpty;
  bool hasData() => data != null;
  int code;
  String message;
  dynamic body;
  List? errors;
  bool hasDataObject;

  ApiResponse({
    required this.code,
    required this.message,
    this.body,
    this.errors,
    this.hasDataObject = true,
  });

  factory ApiResponse.fromResponse(dynamic response, {bool hasDataObject = true}) {

    print('RESPONSE: ${response.data}');

    int code = response.statusCode;
    dynamic body = response.data ?? null; // Would mostly be a Map
    List errors = [];
    String message = "";

    switch (code) {
      case 200:
        if(hasDataObject) {
          try {
            message = body["message"];
          } catch (error) {
            print("Message reading error ==> $error");
          }
        }

        break;
      default:
        message = body["message"] ??
            "Whoops! Something went wrong, please contact support.";
        errors.add(message);
        break;
    }

    return ApiResponse(
        code: code,
        message: message,
        body: body,
        errors: errors,
        hasDataObject: hasDataObject
    );
  }
}
