import 'package:flutter/material.dart';

enum LiveState {Alive,Dead,Unknown}
class LiveDeadUnknown extends StatelessWidget {
  final LiveState liveState;
  LiveDeadUnknown({Key? key,required this.liveState}) : super(key: key);

  // This is a dot Icon to show the node is Connected
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.circle ,size: 9 , color: liveState == LiveState.Alive ? Colors.green[500] : liveState == LiveState.Dead ? Colors.red : Colors.white,),
        SizedBox(width: 6,),
        Text(liveState == LiveState.Dead ?'Dead' : liveState == LiveState.Alive ?'Alive' : 'Unknown',
          style: Theme.of(context).textTheme.bodyText1,

        ),
      ],
    );
  }
}
