import 'dart:convert';
import 'package:listaApiFlutter/Api/ApiController.dart';
import 'package:listaApiFlutter/Model/User.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        List<dynamic> data = map["results"];
        users = data.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _irAlDetalle(users);
              },
              child: Card(
                child: ListTile(
                  leading: Image.network(users[index].image),
                  trailing: Icon(Icons.add_box),
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                  isThreeLine: true,
                ),
              ),
            );
          },
        ));
  }

  void _irAlDetalle(List<User> users) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Pruebas(
              users: [],
            )));
  }
}

class Pruebas extends StatefulWidget {
  final List<User> users;

  const Pruebas({Key key, this.users}) : super(key: key);

  @override
  createState() => Pruebas2();
}

class Pruebas2 extends State {
  int index = 0;
  //List<User> users = Pruebas();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SEGUNDA RUTA"),
        ),
        body: Column(
          children: [Text("a")],
        ));
  }
}
