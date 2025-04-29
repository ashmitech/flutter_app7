import 'package:flutter/material.dart';


class Arguments{
  final String titleBar;
  final String textMessage;
  
  Arguments(this.titleBar, this.textMessage);
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key, 
  });
  


  @override
  Widget build(BuildContext context) {
    final Arguments args  =
     ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(
      appBar:AppBar(
        title: Text(args.titleBar),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(args.textMessage),
      ),
    );
  }
}
