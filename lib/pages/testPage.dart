import 'dart:convert';

import 'package:demo_app/appbars/BackAppBar.dart';
import 'package:demo_app/appbars/CustomAppBar.dart';
import 'package:demo_app/widgets/goodWidget.dart';
// import 'package:demo_app/models/good.dart';
// import 'package:demo_app/models/testModel.dart';
// import 'package:demo_app/models/tmodel.dart';

import 'package:flutter/material.dart';
import 'package:demo_app/models/catalog.dart';
import 'package:demo_app/tools/databasehelper.dart';
import 'package:flutter/services.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 100,
        child: BackAppBar(title: "Тестовая страница"),
      ),
      body: Container(
        child: FutureBuilder<List<Good>>(
            future: DatabaseHelper.instance.getGoods(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Good>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Загрузка...'));
              }
              var items = snapshot.data as List<Good>;
              return snapshot.data!.isEmpty
                  ? Center(child: Text('Нет данных'))
                  : GridView.builder(
                      itemCount: items == [] ? 0 : items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / 1.6),
                      ),
                      itemBuilder: (context, index) {
                        return GoodWidget(item: items[index]);
                      },
                    );
            }),
      ),
    );
  }
}
