import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';

class ScreenWidgets extends StatefulWidget {
  final int index;
  const ScreenWidgets({super.key, required this.index});

  @override
  _ScreenWidgetsState createState() => _ScreenWidgetsState();
}

class _ScreenWidgetsState extends State<ScreenWidgets> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    // Start the animation after a slight delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment: _isLoaded ? Alignment.center : Alignment.topRight,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(80)),
            ),
            child: Image.asset(
              'images/afaque${widget.index}.jpg', // Dynamically load image based on index
              width: _isLoaded ? 300 : 100,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title[widget.index],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        about[widget.index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
