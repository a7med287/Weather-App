import 'package:flutter/material.dart';
import '../pages/saerch_page.dart';

class IconSearchWidget extends StatelessWidget {
   IconSearchWidget({super.key,this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  SearchPage();
        },));
      },
      icon: const Icon(
        Icons.search,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}