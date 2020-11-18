import 'package:dicoding_mobile/daftar_page.dart';
import 'package:dicoding_mobile/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dicoding Mobile'),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('images/dicoding_logo.png'),
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(bottom: 32),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xff343a40),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Dicoding Academy',
                    style: TextStyle(fontSize: 28, color: Colors.white), textAlign: TextAlign.center,),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('images/dicoding_academy.png')),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 32),
                    width: 100,
                    child: RaisedButton(
                      elevation: 8,
                      color: Colors.white,
                      textColor: Color(0xfffe5785),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Color(0xfffe5785), width: 0.5)
                      ),
                      child: Text('Masuk'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginPage()
                        ));
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 32),
                    width: 100,
                    child: RaisedButton(
                      elevation: 8,
                      color: Color(0xfffe5785),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('Daftar'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DaftarPage()
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}