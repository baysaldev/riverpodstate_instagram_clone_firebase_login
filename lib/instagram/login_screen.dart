import 'package:deneme_instagram1/instagram/main_screen.dart';
import 'package:deneme_instagram1/instagram/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              'Türkçe',
              style: TextStyle(color: Colors.white),
            )),
            Center(
                child: Text(
              '',
              style: TextStyle(color: Colors.white),
            )),
            Column(
              children: [
                Container(
                    height: 60,
                    width: 180,
                    child: Image(
                      image: AssetImage('assets/img/logo.png'),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    fillColor: Colors.grey.shade700,
                    prefixIconColor: Colors.white,
                    filled: true,
                    constraints:
                        BoxConstraints.tightFor(width: 327, height: 50),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Telefon numarası, e-posta veya kullanıcı adı',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    fillColor: Colors.grey.shade700,
                    prefixIconColor: Colors.white,
                    filled: true,
                    constraints:
                        BoxConstraints.tightFor(width: 327, height: 50),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Parola',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 327,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text(
                      'GirişYap',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Giriş bilgilerinizi mi unuttunuz?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Giriş yapmak için yardım alın.",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Center(
                child: Text(
              '',
              style: TextStyle(color: Colors.white),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hesabınız yok mu?",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    " Üye olun",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
