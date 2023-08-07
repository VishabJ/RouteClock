import 'package:flutter/material.dart';

// Main function which starts the app
void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

	
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Flutter Demo',
	theme: ThemeData(
		
		// This is the theme of your application
		primarySwatch: Colors.green,
	),
	home: const MyHomePage(title: 'Clock'),
	);
}
}

class MyHomePage extends StatefulWidget {
const MyHomePage({super.key,  required this.title});

// This widget is the home page of your application.
final String title;

@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
TimeOfDay _time = TimeOfDay.now();
late TimeOfDay picked;

Future<Null> selectTime(BuildContext context) async {
	picked = (await showTimePicker(
	context: context,
	initialTime: _time,
	))!;
	setState(() {
	_time = picked;

	print(picked);
	});
}

@override
Widget build(BuildContext context) {
	
	// This method is rerun every time setState is called.
	return Scaffold(
	appBar: AppBar(
		
		// Here we take the value from the
		// MyHomePage object that was created by
		// the App.build method, and use it
		// to set our appbar title.
		title: Text(widget.title),
	),
	body: Center(
		
		// Center is a layout widget. It takes
		// a single child and positions it
		// in the middle of the parent.
		child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: [
			IconButton(
			iconSize: 80,
			icon: Icon(
				Icons.alarm,
				size: 80,
			),
			onPressed: () {
				selectTime(context);
			},
			),
			SizedBox(
			height: 60,
			),
			Text('$_time', style: TextStyle(fontSize: 40)),
		],
		), // Column
	), // Center
	); // Scaffold
}
}
