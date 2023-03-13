import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int idx = 0; //index yang aktif

  //event saat button di-tap
  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Image.network(
                        'https://picsum.photos/250?image=4',
                        height: 130,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
            Center(
              child: Column(
                children: [
                  Icon(Icons.check_circle_outline_rounded, size: 100),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    'No New Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                      "You're caught up check back for notification, campus alert and more"),
                  Center(
                    child: Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(20),
                          children: [
                            Container(
                                decoration: BoxDecoration(border: Border.all()),
                                padding: EdgeInsets.all(14),
                                child: Column(children: [
                                  Text('Campuss alert',
                                      style: TextStyle(color: Colors.red)),
                                  Text('Notifikasi ke-0')
                                ])),
                            Container(
                                decoration: BoxDecoration(border: Border.all()),
                                padding: EdgeInsets.all(14),
                                child: Column(children: [
                                  Text('Campuss alert',
                                      style: TextStyle(color: Colors.red)),
                                  Text('Notifikasi ke-1')
                                ])),
                            Container(
                                decoration: BoxDecoration(border: Border.all()),
                                padding: EdgeInsets.all(14),
                                child: Column(children: [
                                  Text('Campuss alert',
                                      style: TextStyle(color: Colors.red)),
                                  Text('Notifikasi ke-2')
                                ])),
                            Container(
                                decoration: BoxDecoration(border: Border.all()),
                                padding: EdgeInsets.all(14),
                                child: Column(children: [
                                  Text('Campuss alert',
                                      style: TextStyle(color: Colors.red)),
                                  Text('Notifikasi ke-3')
                                ])),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: idx,
            selectedItemColor: Colors.red,
            onTap: onItemTap, //event saat button di tap
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.compass_calibration), label: " Compass"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity), label: " Activity"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: " People"),
            ]),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 11'),
            content: const Text(
                'Muhammad Yusuf Bahtiar (muhammadbahtiar10@upi.edu) ; Rasyid Andriansyah (rasyidandriansyah15@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
