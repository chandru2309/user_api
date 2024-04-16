import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_api/api_server.dart';
import 'module.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<OfficeModel>? _userModel = [];

  @override
  void initState() {
    if (kDebugMode) {
      print('Initial State');
    }
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiServer().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text('Name : ${_userModel![index].username}'),
                const SizedBox(
                  height: 20.0,
                ),
                Text('Email : ${_userModel![index].email}'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    'GEO LOCATION LAT ${_userModel![index].address!.geo!.lat}')
              ],
            ),
          );
        },
      ),
    );
  }
}
