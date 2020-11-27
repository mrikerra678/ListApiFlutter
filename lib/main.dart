import 'dart:convert';
import 'package:listaApiFlutter/Api/ApiController.dart';
import 'package:listaApiFlutter/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:listaApiFlutter/Model/listaUsuarios.dart';
import 'dart:ui';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return ChangeNotifierProvider(
      create: (context) => ListaUsuarios(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Http App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyListScreen(),
      ),
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
  Widget build(context) {
    final aUsuarios = Provider.of<ListaUsuarios>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //aUsuarios.guardarLista(users[index]);
                _irAlDetalle(users[index]);
              },
              //{
              //   _irAlDetalle(users[index]);
              // },
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

  void _irAlDetalle(User user) {
    final aUsuarios = Provider.of<ListaUsuarios>(context);

    aUsuarios.guardarLista(user);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Pruebas()));
  }
}

class Pruebas extends StatefulWidget {
  const Pruebas({Key key}) : super(key: key);

  @override
  createState() => Pruebas2();
}

class Pruebas2 extends State {
  @override
  Widget build(context) {
    final aUsuarios = Provider.of<ListaUsuarios>(context);

    print(aUsuarios.aUsuarios);
    return Scaffold(
        appBar: AppBar(
          title: Text("SEGUNDA RUTA"),
        ),
        body: Column(children: [
          for (var item in aUsuarios.aUsuarios) ...{
            Text(item.email),
          }
        ]));
  }
}
