import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoinator/app/modules/home/views/version.dart';
//import 'package:giffy_dialog/giffy_dialog.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(color: Colors.black),),
      
        elevation: 1,
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
          Card(
            elevation: 0,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.info),
              title: Text('About'),
              subtitle: Text('About the Todoinator app'),
              iconColor: Colors.blueAccent,
              
              
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.question),
              title: Text('How to?'),
              subtitle: Text('How the app works?'),
              iconColor: Colors.blueAccent,
//               onTap:() {
//   showDialog(
//   context: context,builder: (_) => NetworkGiffyDialog(image: Image.asset('assets/giphy.gifq'),
//     //imageUrl:"https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
//     title: Text('Granny Eating Chocolate',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//             fontSize: 22.0,
//             fontWeight: FontWeight.w600)),
//     description:Text('This is a granny eating chocolate dialog box',textAlign: TextAlign.center,
//         ),
    
//     onOkButtonPressed: () {},
//   ) );
// } ,
              
              
              
            ),
          ),
          
          ListTile(
            leading: Icon(FontAwesomeIcons.fileAlt),
            title: Text('Terms & Conditions'),
            subtitle: Text('Privacy & terms'),
            iconColor: Colors.blueAccent,
            
            
          ),
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