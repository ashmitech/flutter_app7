import 'package:flutter/material.dart';

class LoaderDemo extends StatelessWidget {
  const LoaderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(15.0),
      children:[
        SizedBox(
          height: 20,
        ),
        Text('Material Circular Progress Indicator',
        style: TextStyle(fontSize:14.0),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: CircularProgressIndicator(color: Colors.blue),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Text('Material Linear Progress Indicator',
        style: TextStyle(fontSize:14.0),
        ),
        
        SizedBox(height:MediaQuery.of(context).size.width*0.025),
        

        
        Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width*0.1,),
            Center(
              child: LinearProgressIndicator(color: Colors.blue,),
            ),
          ],
        ),
      ],
    );
  }
}