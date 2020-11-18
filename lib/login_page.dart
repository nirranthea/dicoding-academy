import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  bool  _passwordVisible = false;

  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _validate(String username, String password) {
    if (username.length == 0) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Username harus diisi!'),
      ));
      FocusScope.of(context).requestFocus(_usernameFocus);
      return 0;
    } else if (password.length == 0) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Password harus diisi!'),
      ));
      FocusScope.of(context).requestFocus(_passwordFocus);
      return 0;
    } else {
      return 1;
    }
  }

  _submitLogin(String username, String password) {
    if (_validate(username, password) == 1) {
      //TODO: do submit Login to Backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/wa_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white60,
        appBar: AppBar(
          title: Text('Login'),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('images/dicoding_logo.png'),
              onPressed: null,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Username', style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16
                    ),),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _usernameCtrl,
                      focusNode: _usernameFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 14),
                      maxLength: 50,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
                        counterText: '',
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Password', style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16
                    ),),
                    SizedBox(height: 8),
                    TextFormField(
                      obscureText: !_passwordVisible,
                      controller: _passwordCtrl,
                      focusNode: _passwordFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 14),
                      maxLength: 50,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        counterText: '',
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                          iconSize: 16,
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },),
                      ),
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 32),
                  width: 100,
                  child: RaisedButton(
                    elevation: 8,
                    color: Color(0xfffe5785),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('MASUK'),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _submitLogin(
                        _usernameCtrl.text,
                        _passwordCtrl.text,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Atau masuk dengan'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 32),
                    width: 100,
                    child: RaisedButton(
                      elevation: 8,
                      color: Colors.white,
                      textColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset('images/google.svg'),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        //TODO: do Login with Google
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 32),
                    width: 100,
                    child: RaisedButton(
                      elevation: 8,
                      color: Colors.white,
                      textColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset('images/facebook.svg'),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        //TODO: do Login with Facebook
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}