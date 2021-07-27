import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Utils/colors.dart';


class Team extends StatelessWidget {


  static const String _title = 'Pablito';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: MainColors.Background_grey,
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: MainColors.Background_grey,
            appBar: TabBar(
              indicatorColor: MainColors.Accent_purple,
              unselectedLabelColor: MainColors.SixtyPercent,
              labelColor: MainColors.Accent_purple,
              tabs: [
                Tab(child: Text('Eventos')),
                Tab(child: Text('Miembros')),
                Tab(child: Text('Roles')),
              ],
            ),
            body: TabBarView(
              children: [
                Icon(Icons.person, size: 260),
                Icon(Icons.ac_unit, size: 260),
                Icon(Icons.pages_outlined, size: 260),
              ],
            ),
            floatingActionButton: Container(
              height: 73.0,
              width: 73.0,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  isExtended: true,
                  child: const Icon(Icons.add),
                  backgroundColor: MainColors.Accent_blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: const <Widget>[
        Center(
            child: Scaffold(
              body: Text('First Page'),
              backgroundColor: Color.fromARGB(255, 29, 27, 27),
            )
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        )
      ],
    );
  }
}
