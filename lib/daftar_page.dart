import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DaftarPage extends StatefulWidget {
  @override
  DaftarPageState createState() => DaftarPageState();
}

class DaftarPageState extends State<DaftarPage> {

  final _namaCtrl     = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl    = TextEditingController();

  final _namaFocus     = FocusNode();
  final _usernameFocus = FocusNode();
  final _emailFocus    = FocusNode();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _validate(String nama, String username, String email) {
    if (nama.length == 0) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Nama harus diisi!'),
      ));
      FocusScope.of(context).requestFocus(_namaFocus);
      return 0;
    } else if (username.length == 0) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Username harus diisi!'),
      ));
      FocusScope.of(context).requestFocus(_usernameFocus);
      return 0;
    } else if (email.length == 0) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Password harus diisi!'),
      ));
      FocusScope.of(context).requestFocus(_emailFocus);
      return 0;
    } else {
      return 1;
    }
  }

  _submitDaftar(String nama, String username, String email) {
    if (_validate(nama, username, email) == 1) {
      //TODO: do submit Register to Backend
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
        backgroundColor: Colors.white60,
        appBar: AppBar(
          title: Text('Daftar Akun Baru'),
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
                    Text('Nama Lengkap', style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16
                    ),),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _namaCtrl,
                      focusNode: _namaFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 14),
                      maxLength: 50,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nama Lengkap',
                        counterText: '',
                        helperText: 'Masukkan nama asli Anda',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(_usernameFocus);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
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
                        helperText: 'Username sebagai identitas profile Anda',
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(_emailFocus);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Email', style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16
                    ),),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailCtrl,
                      focusNode: _emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 14),
                      maxLength: 50,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        counterText: '',
                        helperText: 'Gunakan alamat email aktif',
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                    child: Text('KIRIM'),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _submitDaftar(
                        _namaCtrl.text,
                        _usernameCtrl.text,
                        _emailCtrl.text,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Atau daftar menggunakan'),
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
