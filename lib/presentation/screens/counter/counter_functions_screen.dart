import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({Key? key}) : super(key: key);

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
        title: const Text('Counter Functions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text('Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_rounded,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {
                if (clickCounter == 0) return;

                clickCounter--;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      shape: const StadiumBorder(),
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
      backgroundColor: color,
    );
  }
}
