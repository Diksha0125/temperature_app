import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:temperature_fetch_app/authentication/bloc/authentication_bloc.dart';
import 'package:temperature_fetch_app/colors.dart';
import 'package:temperature_fetch_app/styles.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _enable = false;

  int _currentIndex = 0;
  List cardList = [
    CardOne(),
    CardTwo(),
    CardThree(),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 24,
            foregroundImage: AssetImage(
              'assets/images.jpeg',
            ),
          ),
          SizedBox(width: 16),
          Text(
            "Welcome",
            style: DemoTextStyle.heading2,
          ),
        ],
      ),
      actions: <Widget>[
        // action button
        FlatButton(
          onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested());
          },
          child: Icon(Icons.logout, color: black),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 280.0,
                  autoPlay: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 7.0,
                    height: 7.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 32.0, horizontal: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? orange : orangeBright,
                    ),
                  );
                }),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: Text('Rooms', style: DemoTextStyle.heading2),
              ),
              SizedBox(height: 20),
              Container(
                height: 700,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: orangeBright,
                                child: Icon(Icons.car_rental, color: orange)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Bedroom", style: DemoTextStyle.heading3),
                                FlutterSwitch(
                                  height: 30.0,
                                  width: 50.0,
                                  padding: 2.0,
                                  toggleSize: 26.0,
                                  borderRadius: 20.0,
                                  inactiveColor: lightGrey,
                                  activeColor: orange,
                                  value: _enable,
                                  onToggle: (value) {
                                    setState(() {
                                      _enable = !_enable;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text('Consuming 10 kWh\nwhich costs \$12',
                                style: DemoTextStyle.heading4),
                            SizedBox(height: 10),
                            Text('4 Active Devices',
                                style: DemoTextStyle.heading5)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: orangeBright,
                                child: Icon(Icons.fastfood, color: orange)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Kitchen", style: DemoTextStyle.heading3),
                                FlutterSwitch(
                                  height: 30.0,
                                  width: 50.0,
                                  padding: 2.0,
                                  toggleSize: 26.0,
                                  borderRadius: 20.0,
                                  activeColor: orange,
                                  inactiveColor: lightGrey,
                                  value: _enable,
                                  onToggle: (value) {
                                    setState(() {
                                      _enable = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text('Consuming 10 kWh\nwhich costs \$12',
                                style: DemoTextStyle.heading4),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: orangeBright,
                                child: Icon(Icons.event_seat_outlined,
                                    color: orange)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Hallway", style: DemoTextStyle.heading3),
                                FlutterSwitch(
                                  height: 30.0,
                                  width: 50.0,
                                  padding: 2.0,
                                  toggleSize: 26.0,
                                  borderRadius: 20.0,
                                  inactiveColor: lightGrey,
                                  activeColor: orange,
                                  value: _enable,
                                  onToggle: (value) {
                                    setState(() {
                                      _enable = !_enable;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text('Consuming 10 kWh\nwhich costs \$12',
                                style: DemoTextStyle.heading4),
                            SizedBox(height: 10),
                            Text('3 Active Devices',
                                style: DemoTextStyle.heading5)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: orangeBright,
                                child: Icon(Icons.local_drink, color: orange)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Lounge", style: DemoTextStyle.heading3),
                                FlutterSwitch(
                                  height: 30.0,
                                  width: 50.0,
                                  padding: 2.0,
                                  toggleSize: 26.0,
                                  borderRadius: 20.0,
                                  activeColor: orange,
                                  inactiveColor: lightGrey,
                                  value: _enable,
                                  onToggle: (value) {
                                    setState(() {
                                      _enable = !_enable;
                                    });
                                  },
                                ),
                                // child: CustomSwitch(switched: enableSwitch),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text('Consuming 10 kWh\nwhich costs \$12',
                                style: DemoTextStyle.heading4),
                            SizedBox(height: 10),
                            Text('1 Active Devices',
                                style: DemoTextStyle.heading5)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CardThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
