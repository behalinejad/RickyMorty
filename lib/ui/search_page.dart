import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/bloc/ricky_morty_bloc.dart';
import 'package:rick_and_morty/models/rick_morty.dart';
import 'package:rick_and_morty/ui/custom_widgets/custom_list_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  late RickyMorty _currentRickyMorty ;
  int _currentPage = 1 ;  ///to control the current page for pagination
  String _currentSearchStr = '';
  List<Results> _currentResults = [];
  final RefreshController refreshController = RefreshController();
  bool _isPagination = false;
  @override
  void initState() {
    final  rickyMortyBloc = BlocProvider.of<RickyMortyBloc>(context);
    if (_currentResults.isEmpty){
      rickyMortyBloc.add(FetchRickyMorty('', 0)); // load First result to display
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final  rickyMortyBloc = BlocProvider.of<RickyMortyBloc>(context);
    /*if (_currentResults.isEmpty){
      rickyMortyBloc.add(FetchRickyMorty('', 0)); // load First result to display
    }*/
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 15,left: 16,right: 16),
          child: TextField(
            onChanged: (value){  /// the search process triggers onChange of the search TextField
              if (value.trim().length > 0 ) {
                _currentPage = 1 ;
                _currentResults = [] ;
                _currentSearchStr = value.trim();
                rickyMortyBloc.add(FetchRickyMorty(value.trim(), _currentPage));

              }
              },

             decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(Icons.search),
            hintText : 'Search Name'

            ),
          ),
        ),
        BlocBuilder<RickyMortyBloc,RickyMortyState>( /// the part that need to rebuild by bloc state management
            builder: (context,state) {
         // Build the UI for different state
              if (state is RickyMortyIsNotSearched) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Now it\'s time to Search' ,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.bodyText2  ,
                  ),
                );
              }
              else if (state is RickyMortyIsLoading){ /// showing Circular Progress indicator while bloc is on isLoading state
                if (!_isPagination)
                  return  Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(strokeWidth: 2,),
                      SizedBox(width: 10,),
                      Text(' Loading ...')
                    ],
                  ),
                )  ;
              }else if (state is RickyMortyIsLoaded){  /// while bloc is on isLoaded state and api has responded .
               _currentRickyMorty =  state.getRickyMort;
               if (_isPagination){
                 _currentResults.addAll(_currentRickyMorty.results) ;
                 refreshController.loadComplete();
                 _isPagination = false ;
               }
               else
               _currentResults = _currentRickyMorty.results;
               return _currentResults.length> 0 ? _customListView(_currentResults) : Container();
              }

                if (_isPagination ) {
                  return _customListView(_currentResults) ;} else return Text(' OOPs , Nothing found '); /// in the case of error or no search result
        }),
      ],
    );
  }

  Widget _customListView(List<Results> currentResults) { /// The List view that display Results
    return Expanded(
      child: SmartRefresher( // pagination  pull to refresh Widget
        controller: refreshController,
        enablePullUp: true,
        enablePullDown: false,
        onLoading: (){ // while the user reaches the end of the listView

          _isPagination = true ;
          _currentPage ++;
          if (_currentPage <= _currentRickyMorty.info.pages){
            final rickyMortyBloc = BlocProvider.of<RickyMortyBloc>(context);
            rickyMortyBloc.add(FetchRickyMorty(_currentSearchStr, _currentPage));
          }else
            refreshController.loadNoData(); /// there is no data to display
        },
        child: ListView.separated(
            itemBuilder: (context,index){
              final result = currentResults[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16,left: 16,top: 3,bottom: 3),
                child: CustomListTile(result: result,),
              );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (_,index) => SizedBox(height: 5,),
            itemCount: currentResults.length),
      ),
    );
  }
}
