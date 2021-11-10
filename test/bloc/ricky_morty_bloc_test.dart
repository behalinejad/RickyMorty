










import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/bloc/ricky_morty_bloc.dart';
import 'package:rick_and_morty/services/ricky_morty_repo.dart';


class MockRickyMortyBloc extends MockBloc< RickyMortyEvent,RickyMortyState> implements RickyMortyBloc {}

void main (){

  group ('RickyMortyBlock',(){
    RickyMortyBloc rickyMortyBloc = RickyMortyBloc(RickyMortyRepo()) ;



    tearDown((){
      rickyMortyBloc.close();
    });


    test('The initial value of the RickyMortyBloc is RickyMortyIsNotSearched ', (){
      expect(rickyMortyBloc.state, RickyMortyIsNotSearched());
   });



  });

}