// TODO Implement this library.

import 'package:flutter/material.dart'; import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget { @override

_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var _isEmpty = false;

  var _isCorrect; int ctr = 0;
  void _cancel()
  {
    ctr = 0;
    _isCorrect = null; SystemNavigator.pop();
  }

void _submit_data()
  {
    var username = usernameController.text;
    var password = passwordController.text;

    if (username.isEmpty || password.isEmpty)
    {
      setState(()
      {
        _isEmpty = true;
      });
    }
    else
      {
        if (username == 'binal' && password == '1234')
        {
          setState(()
          {
            _isCorrect = true;
            _isEmpty = false; ctr = 0;
          });
        }
        else
          {
            setState(()
            {
              _isCorrect = false;
              _isEmpty = false;
            });
    ctr += 1;
    }
  }
}

Widget getWidget() {
  if (_isCorrect != null) {
    if (_isCorrect == true) {
      return Container(
        padding: EdgeInsets.all(3), child: const Text(
        'Success',
        style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
        color: Colors.green,
      );
    } else {
      return Container(
        padding: EdgeInsets.all(3), child: ctr >= 3
          ? const Text(
          'You have reached at maximum login limit', style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold,),)
      :const Text('Failed',style: TextStyle(color: Colors.white, fontSize: 18),),

        color: ctr >= 3 ? Colors.white : Colors.red,
      );
      }
      }
  else
    {
      return const Text('');
    }
}
@override
Widget build(BuildContext context) {
  return Scaffold( appBar: AppBar
    (
    title: const Text('18IT045 - Practical 5 '),
    centerTitle: true,
    backgroundColor: Colors.grey,
  ),
    body: Container(
    alignment: Alignment.center, decoration: BoxDecoration(
    gradient: LinearGradient( begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [Colors.grey, Colors.white],),),
      child: Container( height: 340,
      width: 340, child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 15,
        margin: const EdgeInsets.all(10), child: Container(
          margin: const EdgeInsets.all(12), child: Column(
            children: [ Padding(
              padding: const EdgeInsets.all(8.0), child: const Text(
                'Login',
          style:
          TextStyle
            (
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey
            ),
          ),
        ),
            TextField(
              decoration: InputDecoration( labelText: 'Username',),
                controller: usernameController,
              ),
            TextField(
              decoration: InputDecoration( labelText: 'Password',),
              obscureText: true,
              controller: passwordController,
              ),
            SizedBox( height: 10,
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  child: const Text( 'Submit', style: TextStyle(color: Colors.white),),
                  color: ctr >= 3 ? Colors.grey[200] : Colors.blueGrey,
                  onPressed: ctr >= 3 ? () {} : _submit_data,
              ),
                FlatButton( onPressed: _cancel, child: const Text(
                'Cancel', style: TextStyle(color: Colors.white),),
                  color: Colors.blueGrey,)
                  ],
              ),
            SizedBox( height: 5,),
            _isEmpty
                ? Container(padding: EdgeInsets.all(3), child: const Text(
                  'Please Enter value', style: TextStyle(
                  color: Colors.red, fontSize: 17,
                  fontWeight: FontWeight.bold,
    ),
    ),
    )
        : Text(''), getWidget()
    ],
  ),
  ),
  ),
  ),
  ),
  backgroundColor: Colors.transparent,
  );
}
}
