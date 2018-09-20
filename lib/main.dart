import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/helloworld.dart';
import 'package:flutter_app/materialdemo.dart';
import 'package:flutter_app/gesturedemo.dart';
import 'package:flutter_app/statefuldemo.dart';
import 'package:flutter_app/app_1.dart';

//void main() => runApp(new MyApp());
//void main() => runApp(new MaterialApp(
//
//  title: 'My app',
//  home: MyScaffold(),
//
//));
//void main() => runApp(
//  new MaterialApp(
//
//    title: 'Flutter Tutoral',
//    home: TutorialHome(),
//
//  )
//);
void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: <Product>[
        Product('Edges'),
        Product('Flour'),
        Product('Chocolate'),
      ],
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List(3);
    list[0] = DrawerHeader(
        child: Image.network(
            "http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg"));
    list[1] = Text('item1');
    list[2] = Text('item2');

    final wordPair = WordPair.random();

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
      theme: new ThemeData(primaryColor: Colors.white),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() => new RandomWordState();
}

class RandomWordState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = new TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator
        .of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });

      final List<Widget> divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }
}
