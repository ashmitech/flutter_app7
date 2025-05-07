import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;
import 'package:url_launcher/url_launcher_string.dart' show LaunchMode;

class FifthRowWidget extends StatelessWidget {
  const FifthRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
         Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        InkWell(
                          child: 
                          Text("Source: ",
                            style:
                            TextStyle(color: Colors.white, fontStyle: FontStyle.italic,),),
                          onDoubleTap:() {
                            _launchURL();
                          },
                        ),
                        Text("The Weather Channel", 
                        style: TextStyle(
                          color:Colors.white,
                          decoration:TextDecoration.underline, decorationColor: Colors.white,
                          )),
                      ],
                    ),
                  );
  }
}
void _launchURL() async {
  final Uri url = Uri.parse('https://example.com');
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url. Please Try again later.';
  }
}
