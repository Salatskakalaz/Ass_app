import 'package:flutter/material.dart';
import 'style.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(),
        SizedBox(),
        Center(child: ButtonNext()),
      ],
    ));
  }
}

class ButtonNext extends StatefulWidget {
  Function() onTap;

  @override
  _ButtonNextState createState() => _ButtonNextState();
}

class _ButtonNextState extends State<ButtonNext>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  Tween tween = new Tween<double>(begin: 24, end: 21);

  double size = 70;
  bool pressed;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = tween.animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    size = 70;
    pressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (e) {
        pressed = true;
        controller.forward();
        setState(() {});
      },
      onTapUp: (e) {
        pressed = false;
        controller.reverse();
        setState(() {});
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: buttonGradient),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.all(color: buttonBorder)
            //todo Border
            ),
        duration: Duration(milliseconds: 200),
        height: pressed ? size - 5 : size,
        width: pressed ? size - 5 : size,
        child: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.white,
          size: animation.value,
        ),
      ),
    );
  }
}
