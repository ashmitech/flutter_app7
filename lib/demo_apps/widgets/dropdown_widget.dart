import 'package:flutter/material.dart';
// import 'package:my_app/demo_apps/weather/services/api_services.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String ?selectedValue = 'Kathmandu'.toUpperCase();

 final List<String> items = ['Kathmandu', 'Bhaktapur', 'Lalitpur', 'Kirtipur'];
  
  bool isTapped=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: (){
          setState((){
            isTapped=true;
          });
          // open the dropdown manually
          Future.delayed(const Duration(milliseconds: 200),(){
            setState((){
              isTapped=false;
            });
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal:12, vertical:6),
          decoration: BoxDecoration(
            color:isTapped?Colors.deepPurple.shade50:Colors.white,
            border:Border.all(color:Colors.deepPurple),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(child: 
             DropdownButton<String>(
              value: selectedValue,
              icon: Row(children: [
                SizedBox(width: 5,),
                const Icon(Icons.location_pin,
                color: Colors.blue,
                size: 20.0,),
                const Icon(Icons.arrow_drop_down,
                color: Colors.blue,
                size: 20.0,),
              ],),
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                height: 2,
                color: Colors.blue,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              items: 
              items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value.toUpperCase(),
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}


