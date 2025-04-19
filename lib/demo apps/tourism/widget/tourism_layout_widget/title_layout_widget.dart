import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location});

    final String?name;
    final String?location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name??"", 
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                location??"",
                 style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const FavouriteWidget(),
        ],
      ),
      // Icon(Icons.star, color:Colors.red.shade800),
      // const Text('41')
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







