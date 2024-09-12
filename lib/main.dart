import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xff8f8f8f),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfff5ceb8),
                child: Container(
                  margin: const EdgeInsets.only(right: 40, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/path.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Good Morning \nDulanjali",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    categoryWidget('img1', "Diet Plan"),
                    categoryWidget('img2', "Exercises"),
                    categoryWidget('img3', "Medical Tips"),
                    categoryWidget('img4', "Yoga"),
                  ],
                ),
              ),
            Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Column(
                children: <Widget>[
                  Icon(Icons.calendar_month),
                  Text('Today'),
               ],
              ),
                Column(
                children: <Widget>[
                  Icon(Icons.settings,
                  color: Colors.orange,
                  size: 30,
                ),
                  Text('Settings',
                  style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
             ],
            ),
                 Column(
                  children: <Widget>[
                   Icon(Icons.calendar_month),
                   Text('Tomorrow'),
              ],
             ),
            ],
          ),
        )
       ],
          )
        ],
      ),
    );
  }

  Container categoryWidget(String img, String title) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {openProductPage('$img', '$title');},
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/$img.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  void openProductPage(String img, String title) {
    Navigator.pushNamed(context, 'productPage', arguments: {'image': img, 'title': title},
    );
  }
}
