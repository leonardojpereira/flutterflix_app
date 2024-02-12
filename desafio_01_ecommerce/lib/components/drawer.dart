import 'package:flutter/material.dart';
import 'package:flutter_05_ecommerce/pages/intro_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
          children: [
             DrawerHeader(child: Image.asset('lib/images/nike_logo.png', color: Colors.white,)),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => IntroPage())
              ),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text('Home', style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.white,),
              title: Text('About', style: TextStyle(color: Colors.white),),
            ),
          ),
          ],
         ),
    
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white,),
              title: Text('Logout', style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
