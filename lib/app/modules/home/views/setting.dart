import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoinator/app/modules/home/views/version.dart';

// import 'about.dart';
//import 'package:giffy_dialog/giffy_dialog.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings',style: TextStyle(color: Colors.black),),
      
        elevation: 1,
        leading: InkWell(child: Icon(CupertinoIcons.back,),onTap:(){
          Navigator.pop(context);
        } ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon.png',scale: 2,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Todoinator',style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 2,
          ),
          Card(
            elevation: 0,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.question),
              title: Text('How to?'),
              subtitle: Text('How the app works?'),
              iconColor: Colors.blueAccent,
              onTap: (){
                showDialog(context: context, builder: (BuildContext context)=>CupertinoAlertDialog(
                  title: Text('How to use the app?'),
                  content: Text("You can add Daily todo's by cliking the + button"+
            " on the bottom right, All the tasks dissapear within 24 Hours "),
            actions: [
              CupertinoDialogAction(child: Text('Got it'),onPressed: (){
                Navigator.of(context).pop();
              },)
              
            ],

                ));
              }
              
              
              
              
              
            ),
          ),
          
          // ListTile(
          //   leading: Icon(FontAwesomeIcons.fileAlt),
          //   title: Text('Terms & Conditions'),
          //   subtitle: Text('Privacy & terms'),
          //   iconColor: Colors.blueAccent,
            
            
          // ),
          ListTile(
            leading: Icon(FontAwesomeIcons.codeBranch),
            title: Text('Version'),
            subtitle: Text('Version info'),
            iconColor: Colors.blueAccent,
            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const VersionPage()),
  );
},
            
          )
        ],
      )
      
    );
  }
}