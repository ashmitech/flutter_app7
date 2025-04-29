import 'package:flutter/material.dart';

class TopRowButton extends StatelessWidget {
  const TopRowButton({super.key, required this.name, required this.routeName});

  final String name;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              if (routeName.isNotEmpty) {
                Navigator.pushNamed(context, routeName);
              } else {
                // Handle error (route not defined)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Invalid route")),
                );
              }
            },
            child: Text(name),
          ),
        ),
      ],
    );
  }
}

class BannerImageWidget extends StatelessWidget {
  const BannerImageWidget
  ({
    super.key, 
    required this.image, 
  });

  final String?image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('$image',
         height: 300,),
      ],
    ); 
  }
}

class CircularImageWidget extends StatelessWidget {
  const CircularImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage(
            'assets/images/profile.jpg',
          ),

          ),
      ],
      
    );
  }
}