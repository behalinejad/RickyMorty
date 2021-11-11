import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rick_and_morty/models/rick_morty.dart';
import 'package:rick_and_morty/ui/custom_widgets/live_dead_dot.dart';

class ShowResultDetailPage extends StatelessWidget {
  final Results result;
  const ShowResultDetailPage({Key? key,required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) { // The page to display Result's detail
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.width/1.3,
          child: Center(
            child: Text('Detail',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      ),
      body: Container(

        decoration: BoxDecoration(

            color: Colors.black87
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
                  child: Container(

                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6), //color of shadow
                            spreadRadius: 3, //spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 1), // changes position of shadow

                          ),
                          //you can set more BoxShadow() here
                        ],
                        borderRadius:  BorderRadius.circular(10.0),
                        color: Color.fromRGBO(86 , 86, 86, 0.8)
                    ),
                    child: Padding( // The Top Header for title
                      padding: const EdgeInsets.only(top: 30,bottom: 30,left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage:
                            NetworkImage(result.image),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width/4  ,
                            child: Text(result.name,maxLines: 3,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                Padding(           // Detail container
                  padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6), //color of shadow
                            spreadRadius: 3, //spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 1),

                          ),
                          //you can set more BoxShadow() here
                        ],
                        borderRadius:  BorderRadius.circular(10.0),
                        color: Color.fromRGBO(150 , 150, 150, 0.9)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Species:',style: TextStyle(color: Colors.black87),),
                             Text(result.species,style: Theme.of(context).textTheme.bodyText1,),
                             SizedBox(width: 1,),
                           ],
                         ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                            child: Divider(thickness: 2,),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Gender:',style: TextStyle(color: Colors.black87),),
                              Text(result.gender,style: Theme.of(context).textTheme.bodyText1,),
                              SizedBox(width: 1,),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                            child: Divider(thickness: 2,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Status :',style: TextStyle(color: Colors.black87),),
                              LiveDeadUnknown(liveState: result.status == 'Alive' ? LiveState.Alive : result.status == 'Dead' ? LiveState.Dead : LiveState.Unknown ),
                              SizedBox(width: 1,),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                            child: Divider(thickness: 2,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Type :',style: TextStyle(color: Colors.black87),),
                              Text(result.type.trim().length > 0 ? result.type : '--',maxLines: 2,style: Theme.of(context).textTheme.bodyText1,),
                              SizedBox(width: 1,),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                            child: Divider(thickness: 2,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Origin:',style: TextStyle(color: Colors.black87),),
                              Text(result.origin.name,maxLines: 2,style: Theme.of(context).textTheme.bodyText1,),
                              SizedBox(width: 1,),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                            child: Divider(thickness: 2,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Location:',style: TextStyle(color: Colors.black87),),
                              Text(result.location.name,style: Theme.of(context).textTheme.bodyText1,),
                              SizedBox(width: 1,),
                            ],
                          ),
                          SizedBox(height: 50,)

                        ],
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
