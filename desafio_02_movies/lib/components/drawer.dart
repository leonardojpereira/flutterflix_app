import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final List<String> genders = [
    'Romance',
    'Action',
    'Comedy',
    'Horror',
    'Drama',
    'Anime',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(child: Image.asset('assets/images/logo.png')),
            const Padding(
              padding: EdgeInsets.only(top: 22.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 1,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[800],
                    ),
                    width: 100,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      genders[index],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured collections',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    title: Text('Sports'),
                    trailing: Icon(Icons.arrow_forward_sharp),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    title: Text('Documentaries'),
                    trailing: Icon(Icons.arrow_forward_sharp),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    title: Text('Podcasts'),
                    trailing: Icon(Icons.arrow_forward_sharp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
