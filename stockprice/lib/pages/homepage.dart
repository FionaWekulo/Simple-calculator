import 'package:flutter/material.dart';
import 'package:stockprice/pages/fragments/history_frag.dart';
import 'package:stockprice/pages/fragments/profile_frag.dart';
import 'package:stockprice/pages/fragments/stockprice_frag.dart';
import 'package:stockprice/pages/fragments/wallet_frag.dart';
import 'package:stockprice/widgets/my_drawer.dart';
import '../widgets/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //pages selected
  int indexPage = 0;
  final List fragments = const [
    StockpricePage(),
    HistoryPage(),
    ProfilePage(),
    WalletPage(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: buttonColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      drawer: MyDrawer(
        indexPage: indexPage,
        onMenuTap: (page) {
          // ignore: avoid_print
          print(page);
          Navigator.pop(context);
          setState((){
            indexPage = page;
          });
        },
      ),
      body: fragments[indexPage],
    );
  }
}
