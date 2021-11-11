import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/rick_morty.dart';
import 'package:rick_and_morty/ui/custom_widgets/live_dead_dot.dart';
import 'package:rick_and_morty/ui/show_result_detail.dart';



class CustomListTile  extends StatelessWidget {
  final Results result ;
  const CustomListTile ({Key? key,required this.result, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(   // to act like a Button while tapping on
        onTap: () async {
           await Navigator.push(  // Navigate to the detail page
            context,
            MaterialPageRoute(builder: (context) {
              return ShowResultDetailPage(result: this.result,);
            }),
          );
        },
        splashColor: Colors.black,
        child: Container(
          height: MediaQuery.of(context).size.height /7,
          color:Color.fromRGBO(86 , 86, 86, 0.8) ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Image.network(result.image,
            errorBuilder: ( context,  exception,  stackTrace) {
            return Image.asset('not_found.jpg') ; //in the case of error to load Image throw network the not_found Image will be appear
            }),
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Container(
                         width:MediaQuery.of(context).size.width/1.9 ,
                         child: Text(result.name,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyText2,)),
                     SizedBox(height: 2,),
                    LiveDeadUnknown(liveState: result.status == 'Alive' ? LiveState.Alive : result.status == 'Dead' ? LiveState.Dead : LiveState.Unknown ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width/ 2,
                      child: Row(    // Rows for Species and Gender
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(   // Species column
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Species:',style: Theme.of(context).textTheme.caption,),
                              SizedBox(height: 2,),
                              Text(result.species,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyText1,)
                            ],

                          ),

                          Column(   // Gender  column
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Gender:',style: Theme.of(context).textTheme.caption,),
                              SizedBox(height: 2,),
                              Text(result.gender,style: Theme.of(context).textTheme.bodyText1,)
                            ],

                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}
