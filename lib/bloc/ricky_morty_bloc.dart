import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/models/rick_morty.dart';
import 'package:rick_and_morty/services/ricky_morty_repo.dart';

class RickyMortyEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

/// The Events of Bloc
class FetchRickyMorty extends RickyMortyEvent {
  final _name ;
  final _page ;
  FetchRickyMorty(this._name, this._page);

@override
  List<Object?> get props => [this._name,this._page];
}

class ResetRickyMorty extends RickyMortyEvent {}

class RickyMortyState extends Equatable {


  @override
  List<Object?> get props => [];
}

/// The States Of bloc
class RickyMortyIsNotSearched extends RickyMortyState{}


class RickyMortyIsLoading extends RickyMortyState{}


class RickyMortyIsLoaded extends RickyMortyState{
 final  _rickyMorty ;
  RickyMortyIsLoaded(this._rickyMorty);


  RickyMorty get getRickyMort => _rickyMorty;

  @override
  List<Object?> get props => [this._rickyMorty];
}


class RickyMortyIsNotLoaded extends RickyMortyState{}


class RickyMortyBloc extends Bloc<RickyMortyEvent,RickyMortyState>{

  RickyMortyRepo rickyMortyRepo ;
  RickyMortyBloc(this.rickyMortyRepo) : super(RickyMortyIsNotSearched());


  Stream<RickyMortyState> mapEventToState( RickyMortyEvent event) async*{
    if (event is FetchRickyMorty ) {
      yield RickyMortyIsLoading();

      try{
        RickyMorty rickyMorty = await rickyMortyRepo.makeRickyMortyGetRequest(event._page, event._name);
        yield RickyMortyIsLoaded(rickyMorty);
      }catch(_){
        yield RickyMortyIsNotLoaded();
      }
      }else if (event is ResetRickyMorty){
         yield RickyMortyIsNotSearched();
    }
  }
}


