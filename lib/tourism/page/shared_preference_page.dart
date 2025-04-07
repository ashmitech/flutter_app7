import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePage extends StatefulWidget {
  const SharedPreferencePage({super.key});

  @override
  State<SharedPreferencePage> createState() => _SharedPreferencePageState();
}

class _SharedPreferencePageState extends State<SharedPreferencePage> {
  final Future<SharedPreferencesWithCache> _prefs 
    SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{'counter'}
      )  
    );
    late Future<int> _counter;
    int _externalCounter = 0;

    final Completer<void> _preferenceReady =Completer<void>();

    Future<void> _incrementCounter()async{
      final SharedPreferencesWithCache prefs = await _prefs;
      final int counter = (prefs.getInt('counter')??0)+1;
      setState((){
        _counter=prefs.setInt('counter', counter).then((_){
          return counter;
        });
      });
    }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}