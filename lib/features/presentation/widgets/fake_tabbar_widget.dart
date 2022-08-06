import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FakeTabBarWidget extends StatelessWidget {
  const FakeTabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 30, left: 20),
            child: Text(
              'Pie',
              style: TextStyle(
                  color: Color(0xFFE4874A),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30),
            child: Text('Dessert',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30),
            child: Text('Cake',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30),
            child: Text('Pizza',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 30),
            child: Text('Pasta',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
        ],
      ),
    );
  }
}
