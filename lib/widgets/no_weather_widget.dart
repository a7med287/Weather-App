
import 'package:flutter/cupertino.dart';

class NoWeatherWidget extends StatelessWidget{
  const NoWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "There is no weather 😔 Start",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            "searching now 🔍",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

}
