import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegant Flutter Transitions',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegant Transitions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTransitionButton(
              label: 'Shared Axis Transition',
              transitionType: ContainerTransitionType.fadeThrough,
              targetPage: DetailPage(title: 'Shared Axis Transition Page'),
            ),
            SizedBox(height: 20),
            CustomTransitionButton(
              label: 'Fade Through Transition',
              transitionType: ContainerTransitionType.fade,
              targetPage: DetailPage(title: 'Fade Through Transition Page'),
            ),
            SizedBox(height: 20),
            CustomTransitionButton(
              label: 'Fade Scale Transition',
              transitionType: ContainerTransitionType.fadeThrough,
              targetPage: DetailPage(title: 'Fade Scale Transition Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTransitionButton extends StatelessWidget {
  final String label;
  final ContainerTransitionType transitionType;
  final Widget targetPage;

  CustomTransitionButton({
    required this.label,
    required this.transitionType,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: transitionType,
      transitionDuration: Duration(milliseconds: 500),
      closedElevation: 5.0,
      openElevation: 5.0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      closedColor: Colors.indigo,
      openColor: Colors.white,
      closedBuilder: (context, action) {
        return Container(
          height: 60,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      openBuilder: (context, action) {
        return targetPage;
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
