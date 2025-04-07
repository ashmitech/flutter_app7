
import 'package:flutter/material.dart';

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
            ButtonWithText(color: color, icon: Icons.call, label: 'C A L L'),
            ButtonWithText(color: color, icon: Icons.near_me, label: 'R O U T E'),
            ButtonWithText(color: color, icon: Icons.share, label: 'S H A R E'),
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

//dynamic favourite widget
class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({super.key});

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
      bool _isFavourited = true;
      int _favouriteCount = 41;

      void _toggleFavourite() 
      {
        setState(() {
          if (_isFavourited) {
            _favouriteCount -= 1;
            _isFavourited = false;
          } else {
            _favouriteCount += 1;
            _isFavourited = true;
          }
        });
      }
  
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: 
                  (_isFavourited
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavourite, 
                ),
            ),
            SizedBox(width: 18, child:SizedBox(child: Text('$_favouriteCount'))),
          ]
        );  
      }  //widget
  }






