import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/rick_morty.dart';


class RickyMortyRepo {
  var dio = Dio();
  final url = 'https://rickandmortyapi.com/api/character'; // The Url for Ricky Morty Api


  Future<RickyMorty> makeRickyMortyGetRequest(int page , String name)  async {
    try {
      Response<String> response ;
      if (name == '' && page == 0)  // check if It is the first call of the api or  not
         response = await dio.get(url);
      else
         response = await dio.get(url + '?page=$page&name=$name');

       if ( response.statusCode != 200 )
        throw Exception();
      if(response.data != null ) {
        var jsonResult = json.decode(response.data!) ;
        return RickyMorty.fromJson(jsonResult);
      }else
        throw Exception();


    } on Exception catch (e) {

      throw e;
    }
  }

}