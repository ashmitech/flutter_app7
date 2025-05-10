import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkWidget extends StatelessWidget {
  const ExternalLinkWidget({super.key});

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
                            //make changes to the style of external link
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
