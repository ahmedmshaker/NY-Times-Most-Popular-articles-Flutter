import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ny_times_most_pupulararticles/Constants.dart';
import 'package:ny_times_most_pupulararticles/data/models/BaseResponse.dart';

const APPLICATION_JSON = "application/json";
const FORM_ENCODED_URL = "application/x-www-form-urlencoded";
const POST = "post";
const GET = "get";

class ArticleApiProvider<T extends BaseModelResponse> {
  final client = http.Client();


  Future<Stream<T>> handleNetworkCall(
      String method, String functionName, T model,
      {String url,
      String body,
      Map bodyFields,
      String contentType,
      bool hasToken = false}) async {
    var request = http.Request(method, Uri.parse(ARTICLES_URL + functionName));
    _buildBody(request, body, bodyFields, contentType);
    _buildContentType(request, contentType, hasToken);
    var streamResponse = await client.send(request);
    return streamResponse.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((map) => model.buildModel(map));
  }

  _buildContentType(Request req, String contentType, bool hasToken) {
    if (hasToken) {
      if (contentType == null)
        addAuthHeaders(req);
      else
        addAuthHeadersWithContentType(req, contentType);
    }
  }

  _buildBody(Request req, String body, Map bodyMap, String contentType) {
    if (body != null)
      req.body = body;
    else if (bodyMap != null && contentType != null) {
      if (contentType == APPLICATION_JSON)
        req.body = json.encode(bodyMap);
      else if (contentType == FORM_ENCODED_URL) req.bodyFields = bodyMap;
    }
  }

  addAuthHeaders(var req) {
    req.headers.addAll({"Authorization": "your token here"});
  }

  addAuthHeadersWithContentType(var req, String contentType) {
    req.headers.addAll({"Authorization": "your token here"});
    req.headers.addAll({"Content-Type": contentType});
  }
}
