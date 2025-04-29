
import 'package:flutter/material.dart';
// for adding phone call function
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

//for phone number
final String phoneNumber="+1234567890";
//for latitude and longitude
final latitude = 37.4220;
final longitude = -122.0841;

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return 
      SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: _makePhoneCall, 
              child: 
                ButtonWithText(
                  color: color, icon: Icons.call, label: 'Call Now', 
                ),
              ),
            
            InkWell(
              onTap:_openMap,
              child: 
              ButtonWithText(
                color: color, icon: Icons.near_me,
                label: 'Find Route'
                ),
            ),
            
            InkWell(
              onTap: _shareOnWhatsApp,
              child:
                ButtonWithText(
                  color: color, 
                  icon: Icons.share,
                  label: 'Share to Friends'),

            ),
          ],
        ),
      );
  }

  
  }

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    });

    final Color color;
    final IconData icon;
    final String label;

  @override
  Widget build(BuildContext context) 
  {
    return
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color:color),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }
}

// function for adding phone call function
  Future<void> _makePhoneCall() async{
  final status = await Permission.phone.status;
    if(status.isGranted)
    {
      final Uri url = Uri.parse('tel:$phoneNumber');
      if(await canLaunchUrl(url)){
        await launchUrl(url);
      }else{
        throw 'Could not launch $phoneNumber';
      }
    }
    else {
      final result=await Permission.phone.request();
      if(result.isGranted){
        _makePhoneCall(); //Retry after permission granted
      }else{
        // permission denied
        print('Phone call permission denied');
      }
    }
}

// function for adding phone call function
  Future<void> _openMap() async{
    //for address by using longitude and latitude

  final googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

  if(await canLaunchUrl(googleMapsUrl)){
    await launchUrl(googleMapsUrl, mode:LaunchMode.externalApplication);
  }else{
    throw'Could not open the map for provided address';
  }
}

final String message="Hi! Check out this aswesome place!";
final String orgPhoneNumber="+9876543210"; 

Future<void> _shareOnWhatsApp() async{
  final encodeMessage=Uri.encodeComponent(message);

  final url = Uri.parse("https://wa.me/?text=$encodeMessage"); // Without phone number
    // final url = Uri.parse("https://wa.me/$phoneNumber?text=$encodedMessage"); // With phone number

  if(await canLaunchUrl(url)){
    await launchUrl(url, mode:LaunchMode.externalApplication);
  }else{
    throw 'Could not open WhatsApp';
  }
}

