import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialDemo());
}

class MaterialDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = [
      Tab(
        text: 'Buttons',
      ),
      Tab(
        text: 'Inputs',
      ),
      Tab(
        text: 'Dialogs',
      ),
      Tab(
        text: 'InfoShows',
      ),
      Tab(
        text: 'Layout',
      ),
    ];

    return new MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
//            flexibleSpace: FlexibleSpaceBar(
//              title: Text('Content'),
//              centerTitle: true,
//              background: Image.network(
//                'http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg',
//                fit: BoxFit.fill,
//              ),
//            ),
            bottom: TabBar(tabs: myTabs),
          ),
          drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new DrawerHeader(child: new Text('Drawer Header')),
                new Text('Drawer 1'),
                new Text('Drawer 2')
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            new ButtonsDemo(),
            new InputsDemo(),
            new DialogsDemo(),
            new InfoShowsDemo(),
            new LayoutDemo(),
          ]),
        ),
      ),
    );
  }
}

class ButtonsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('RaisedButton'),
            RaisedButton(
              onPressed: null,
              color: Colors.green,
              textColor: Colors.red,
              child: Text('RaisedButton'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('FloatingActionButton'),
            FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.add),
              foregroundColor: Colors.blue,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text('FlatButton'),
            FlatButton.icon(
                onPressed: null,
                icon: Icon(Icons.print),
                label: Text('FlatButton'))
          ],
        ),
        Row(
          children: <Widget>[
            Text('IconButton'),
            IconButton(icon: Icon(Icons.favorite), onPressed: null)
          ],
        ),
        Row(
          children: <Widget>[
            Text('PopupMenuButton'),
            PopupMenuButton(
                itemBuilder: (BuildContext ctx) => <PopupMenuEntry<WhyFarther>>[
                      const PopupMenuItem(
                        child: Text('Working a lot harder'),
                        value: WhyFarther.harder,
                      ),
                      const PopupMenuItem(
                        child: Text('Being a lot smarter'),
                        value: WhyFarther.smarter,
                      ),
                      const PopupMenuItem(
                        child: Text('Being a self-starter'),
                        value: WhyFarther.selfStarter,
                      ),
                      const PopupMenuItem(
                        child: Text('Placed in charge of trading charter'),
                        value: WhyFarther.tradingCharter,
                      ),
                    ]),
          ],
        ),
        Row(
          children: <Widget>[
            Text('ButtonBar'),
            ButtonBar(
              children: <Widget>[
                RaisedButton(onPressed: null, child: Text('ButtonBar 1')),
                RaisedButton(onPressed: null, child: Text('ButtonBar 2')),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class InputsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('EditableText'),
            EditableText(
                controller: TextEditingController(text: '用户名'),
                focusNode: FocusNode(),
                style: TextStyle(color: Colors.green),
                cursorColor: Colors.red),
          ],
        ),
        Row(
          children: <Widget>[
            Text('Checkbox'),
            Checkbox(value: true, onChanged: null),
            Checkbox(value: true, onChanged: null),
          ],
        ),
        Row(
          children: <Widget>[
            Text('Radio'),
            Radio(
                value: WhyFarther.harder, groupValue: 'world', onChanged: null),
            Radio(
                value: WhyFarther.selfStarter,
                groupValue: 'world',
                onChanged: null),
            Radio(
                value: WhyFarther.smarter,
                groupValue: 'world',
                onChanged: null),
            Radio(
                value: WhyFarther.tradingCharter,
                groupValue: 'world',
                onChanged: null),
          ],
        ),
        Row(
          children: <Widget>[
            Text('Switch'),
            Switch(value: true, onChanged: null)
          ],
        ),
        Row(
          children: <Widget>[
            Text('Slider'),
            Slider(
              value: 0.3,
              onChanged: null,
              activeColor: Colors.green,
              inactiveColor: Colors.red,
            )
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
                child: Text('ShowDatePicker'),
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2019));
                })
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
                child: Text('ShowTimePicker'),
                onPressed: () {
                  showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                })
          ],
        )
      ],
    );
  }
}

class DialogsDemo extends StatelessWidget {
  List<int> lists = [1, 2];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(
                child: Text('ShowSimpleDialog'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Title'),
                          children: <Widget>[
                            SimpleDialogOption(
                              child: Text('Content1'),
                            ),
                            SimpleDialogOption(
                              child: ButtonBar(
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text('OK'),
                                    onPressed: null,
                                  ),
                                  RaisedButton(
                                    child: Text('CANCEL'),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                })
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
                child: Text('ShowAlertDialog'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Title'),
                          content: Text('Content'),
                          actions: <Widget>[
                            FlatButton(onPressed: null, child: Text('OK')),
                            FlatButton(onPressed: null, child: Text('CANCEL')),
                          ],
                        );
                      });
                })
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
                child: Text('ShowBottomSheet'),
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return BottomSheet(
                            onClosing: () {},
                            builder: (context) {
                              return Text('BottomSheetContent');
                            });
                      });
                })
          ],
        ),
        Column(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (index, expand) {},
              children: lists.map((i) {
                return ExpansionPanel(
                    headerBuilder: (ctx, expand) {
                      return ListTile(
                        title: Text('这是标题$i'),
                      );
                    },
                    isExpanded: i == 1,
                    body: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListBody(
                        children: <Widget>[
                          Text('这是标题$i的内容'),
                        ],
                      ),
                    ));
              }).toList(),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
                child: Text('ShowSnackBar'),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('SnackBar'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ));
                })
          ],
        ),
      ],
    );
  }
}

class InfoShowsDemo extends StatelessWidget {
  List<DataCell> myCells = [
    DataCell(Text('Cell1')),
    DataCell(Text('Cell2')),
    DataCell(Text('Cell3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              'images/test.jpg',
              width: 48.0,
              height: 48.0,
            ),
            Image.network(
              'http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg',
              width: 48.0,
              height: 48.0,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.add),
            Icon(Icons.favorite),
            Icon(Icons.healing),
          ],
        ),
        Row(
          children: <Widget>[
            Chip(label: Text('Chip')),
          ],
        ),
        Row(
          children: <Widget>[
            Tooltip(
              message: 'Hello',
              child: Text('Tooltip'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            DataTable(columns: [
              DataColumn(
                label: Text('Row1'),
              ),
              DataColumn(
                label: Text('Row2'),
              ),
              DataColumn(
                label: Text('Row3'),
              ),
            ], rows: [
              DataRow(cells: myCells),
              DataRow(cells: myCells),
              DataRow(cells: myCells),
            ])
          ],
        ),
        Row(
          children: <Widget>[
            Card(
              color: Colors.green,
              child: Text('Card'),
            ),
          ],
        ),
//        Row(
//          children: <Widget>[
//            LinearProgressIndicator(value: null,backgroundColor: Colors.amber,),
//          ],
//        ),
//        Column(
//          children: <Widget>[
//            new GridView.count(
//              primary: false,
//              padding: const EdgeInsets.all(20.0),
//              crossAxisSpacing: 10.0,
//              crossAxisCount: 2,
//              children: <Widget>[
//                const Text('He\'d have you all unravel at the'),
//                const Text('Heed not the rabble'),
//                const Text('Sound of screams but the'),
//                const Text('Who scream'),
//                const Text('Revolution is coming...'),
//                const Text('Revolution, they...'),
//              ],
//            )
//          ],
//        )
      ],
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text('ListTile title'),leading: Icon(Icons.favorite),subtitle: Text('subtitle'),trailing: Icon(Icons.add),dense: true,isThreeLine: false,),
        Divider(),
        ListTile(title: Text('ListTile title')),
        Divider(),
        ListTile(title: Text('ListTile title')),
        Divider(color: Colors.blue,height: 48.0,),
        Stepper(steps: [
          Step(title: Text('Title'), content: Text('Content')),
//          Step(title: Text('Title'), content: Text('Content')),
        ]),
      ],
    );
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RichText(
          text: new TextSpan(
            style: DefaultTextStyle.of(context).style,
            text: 'Hello',
            children: <TextSpan>[
              new TextSpan(
                  text: 'bold',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(text: 'world'),
            ],
          ),
        ),
      ],
    );
  }
}

class AppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      leading: new Icon(Icons.arrow_back),
      title: new Text('My Fancy Dress'),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.playlist_play),
          tooltip: 'Air it',
          onPressed: null,
        ),
        new IconButton(
          icon: new Icon(Icons.playlist_add),
          tooltip: 'Restitch it',
          onPressed: null,
        ),
        new IconButton(
          icon: new Icon(Icons.playlist_add_check),
          tooltip: 'Repair it',
          onPressed: null,
        ),
      ],
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        constraints: new BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        padding: const EdgeInsets.all(8.0),
        color: Colors.teal.shade700,
        alignment: Alignment.center,
        child: new Text('Hello World',
            style: Theme
                .of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.white)),
        foregroundDecoration: new BoxDecoration(
          image: new DecorationImage(
            image: new NetworkImage('https://www.example.com/images/frame.png'),
            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          ),
        ),
        transform: new Matrix4.rotationZ(0.1),
      ),
    );
  }
}

class RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: null,
        child: Text('Button'),
      ),
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        new Expanded(
//          child:
//              new Text('Deliver features faster', textAlign: TextAlign.center),
//        ),
//        new Expanded(
//          child: new Text('Craft beautiful UIs', textAlign: TextAlign.center),
//        ),
//        new Expanded(
//          child: new FittedBox(
//            fit: BoxFit.contain, // otherwise the logo will be tiny
//            child: const FlutterLogo(),
//          ),
//        ),
//        const FlutterLogo(),
//        const Expanded(
//          child: const Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
//        ),
//        const FlutterLogo(),
        const Expanded(
          child: const Text(
            'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.',
            textAlign: TextAlign.start,
          ),
        ),
        const Expanded(
            child: const Text(
          'Hello World',
          textAlign: TextAlign.start,
        )),
      ],
    );
  }
}

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[new Text("hello 1"), new Text("hello 2")],
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, wangli! How are you?',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.network(
            'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1536997000&di=36473d6620e4ab8ab0d920761a0d05fa&src=http://pic1.win4000.com/pic/e/08/c2e2466031.jpg'),
      ],
    );
  }
}

class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(Icons.add),
        Icon(Icons.favorite),
        Icon(Icons.print)
      ],
    );
  }
}
