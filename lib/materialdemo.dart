import 'package:flutter/material.dart';

class TutorialHome extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), tooltip:'Navigation menu',onPressed: null),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: IconButton(icon: Icon(Icons.search),tooltip: 'Search', onPressed: null),
          ),
        ],
      ),

      body:Center(

        child: Text('hello world!'),

      ),

      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: Icon(Icons.add),
          onPressed: null),







    );


  }
}



