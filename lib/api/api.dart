import 'package:dio/dio.dart';
import 'package:poem/api/models/rhymes.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RhymerApiClient {
  factory RhymerApiClient(Dio dio, {String? baseUrl}) = _RhymerApiClient;

  factory RhymerApiClient.create({String? apiUrl}) {
    final dio = Dio();
    return RhymerApiClient(dio, baseUrl: apiUrl ?? '');
  }

  @GET('/words')
  Future<List<Rhymes>> getRhymesList(@Query('rel_rhy') String word);
}
