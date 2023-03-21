import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:login_page/views/api.dart';
import 'package:login_page/model/productmodel.dart';
import 'package:login_page/views/login.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  List<ProductModel> productList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProduct();
  }

  fetchProduct() async {
    final getList = await fetchProductss();
    setState(() {
      productList = getList;
    });
    return getList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("All Products"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => Loginpage(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 30,
              child: Image.network(productList[index].image),
            ),
            title: Text(productList[index].title),
          );
        },
      )),
    );
  }
}
