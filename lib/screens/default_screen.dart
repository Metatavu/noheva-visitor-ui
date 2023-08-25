import "package:flutter/material.dart";

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key, required this.title});

  final String title;

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Default screen",
            ),
          ],
        ),
      ),
    );
  }
}
