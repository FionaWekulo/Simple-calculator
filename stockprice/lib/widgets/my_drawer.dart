import 'package:stock/widgets/app_text_normal.dart';
import 'package:flutter/material.dart';
import 'package:stock/widgets/constants.dart';

class MyDrawer extends StatefulWidget {
  //getting selected menu to homepage
  final Function(int) onMenuTap;
  final int indexPage;
  const MyDrawer({
    Key? key,
    required this.indexPage,
    required this.onMenuTap,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //initial index
  int initialIndex = 0;

  //active and inactive styles
  final activeTextStyle = const TextStyle(color: Colors.white);
  final inactiveTextStyle = const TextStyle(color: Colors.black);
  final activeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: buttonColor,
  );

  final List<String> menus = [
    "StockPrice",
    "History",
    "Profile",
    "Wallet",
  ];
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.history,
    Icons.person,
    Icons.account_balance_wallet_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/welcome_1.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: AppTextNormal(
                  text: "Name",
                  color: Colors.black54,
                  size: 25,
                ), //AppTextNormal
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          //generating menus
          Column(
            children: List.generate(menus.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  decoration: widget.indexPage == index
                      ? activeDecoration
                      : const BoxDecoration(),
                  child: ListTile(
                    onTap: () {
                      widget.onMenuTap(index);
                    },
                    title: Text(
                      menus[index],
                      style: widget.indexPage == index
                          ? activeTextStyle
                          : inactiveTextStyle,
                    ),
                    leading: Icon(
                      icons[index],
                      color: widget.indexPage == index
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Colors.black54,
            thickness: 0.5,
          ),

          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 20),
            child: Text("DOCUMENTATION"),
          ),

          const ListTile(
            title: Text("Privacy Policy"),
            leading: Icon(Icons.security_outlined),
          ),
          const ListTile(
            title: Text("Share"),
            leading: Icon(Icons.share),
          ),
          const ListTile(
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
