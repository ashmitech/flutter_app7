//shared preferencese example --flutter dev

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/util/legacy_to_async_migration_util.dart';


class SharedPreferencePage extends StatefulWidget {
  const SharedPreferencePage({super.key});

  @override
  SharedPreferencePageState createState() => SharedPreferencePageState();
}

class SharedPreferencePageState extends State<SharedPreferencePage> {
  final Future<SharedPreferencesWithCache> _prefs;
    SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{'counter'}));
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

    Future<void> _getExternalCounter() async{
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      final int externalCounter= (await prefs.getInt('externalCounter'))??0;
      setState((){
        _externalCounter=externalCounter;
      });
    }
    Future <void> _migratePreferences() async{
      const SharedPreferencesOptions sharedPreferencesOptions=
      SharedPreferencesOptions();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await migrateLegacySharedPreferencesToSharedPreferencesAsyncIfNecessary(
        legacySharedPreferencesInstance: prefs,
        sharedPreferencesAsyncOptions: sharedPreferencesOptions,
        migrationCompletedKey: 'migrationCompleted',
        );
    }

    @override
    void initState(){
      super.initState();
      _migratePreferences().then((_){
        _counter=_prefs.then((SharedPreferencesWithCache prefs){
          return prefs.getInt('counter')??0;
        });
        _getExternalCounter();
        _preferenceReady.complete();
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared preference with Cache'),
        centerTitle: true,),
        body: Center(
        child: _WaitForInitialization(
          initialized: _preferencesReady.future,
          builder: (BuildContext context) => FutureBuilder<int>(
            future: _counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                      'Button tapped ${snapshot.data ?? 0 + _externalCounter} time${(snapshot.data ?? 0 + _externalCounter) == 1 ? '' : 's'}.\n\n'
                      'This should persist across restarts.',
                    );
                  }
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Waits for the [initialized] future to complete before rendering [builder].
class _WaitForInitialization extends StatelessWidget {
  const _WaitForInitialization({
    required this.initialized,
    required this.builder,
  });

  final Future<void> initialized;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: initialized,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return const CircularProgressIndicator();
        }
        return builder(context);
      },
    );
  }
}