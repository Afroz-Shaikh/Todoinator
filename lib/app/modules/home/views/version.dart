import 'package:flutter/material.dart';
class VersionPage extends StatelessWidget {
  const VersionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon.png'),
              Text('Todoinator',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              Text('      ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              Text('Version:  ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
              Text('Beta - 1.0.16',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

            ],
          ),
        ),
        
      ),
    );
  }
}