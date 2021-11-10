

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/bloc/ricky_morty_bloc.dart';
import 'package:rick_and_morty/services/ricky_morty_repo.dart';



void main (){

  group ('RickyMortyBlock',(){
    RickyMortyBloc rickyMortyBloc = RickyMortyBloc(RickyMortyRepo()) ;

    tearDown((){
      rickyMortyBloc.close();
    });


    test('The initial value of the RickyMortyBloc is RickyMortyIsNotSearched ', (){
      expect(rickyMortyBloc.state, RickyMortyIsNotSearched());
   });


    blocTest<RickyMortyBloc,RickyMortyState>(
      'bloc state should continue in IsLoading and end in IsLoaded State ',
      build: () => RickyMortyBloc(RickyMortyRepo()),
      act: (bloc) => bloc.add(FetchRickyMorty('', 0)),
      wait: const Duration(seconds: 2),
      expect: () => [RickyMortyIsLoading(),isA<RickyMortyIsLoaded>() ],
    );

  });

}