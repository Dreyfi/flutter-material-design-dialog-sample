import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        buttonColor: Colors.purple,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: const MyHomePage(),
    );
  }
}

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});
  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Mittens',
    description: 'The pinacle of cats. When Mittens sits in your lap, '
      'you feel like royalty.',
    age: 11,
    imageUrl: 'https://images.unsplash.com/photo-1487202735997-c538f13a47ed?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=360&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=380'
  ),
  Kitten(
      name: 'Fluffy',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit '
          'laboris nisi u',
      age: 11,
      imageUrl: 'https://images.unsplash.com/photo-1505229772441-7bc7291cb95e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=360&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=380'
  ),
  Kitten(
      name: 'Scooter',
      description: 'Um qui dolorem eum fugiat quo voluptas nulla pariat, '
          'you feel like royalty.',
      age: 11,
      imageUrl: 'https://images.unsplash.com/photo-1511263567451-ffc629313033?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=360&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=380'
  ),
  Kitten(
      name: 'Steve',
      description: 'Ctetur, adipisci velit, sed quia non numquam eius modi tem, '
          'you feel like royalty.',
      age: 11,
      imageUrl: 'https://images.unsplash.com/photo-1491829873009-f15f5c41ff9d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=360&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=380'
  )
];


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {

    ThemeData localTheme = Theme.of(context);

    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(kitten.name,
              style: localTheme.textTheme.display1),
              Text('${kitten.age} months old',
              style: localTheme.textTheme.subhead.copyWith(
                fontStyle: FontStyle.italic
              )),
              SizedBox(height: 16.0),
              Text(
                  kitten.description,
                  style: localTheme.textTheme.body1
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('I\'M ALLERGIC'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text('ADOPT'),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => _dialogBuilder(context, _kittens[index])
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
            style: Theme.of(context).textTheme.headline
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Kittens'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }

}