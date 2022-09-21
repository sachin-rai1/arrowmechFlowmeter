import 'package:arrowmech/Constant.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    final w = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/loginBg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 80, right: 80, top: 60),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  "Welcome To",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: Constants.outFit),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Flow meter Monitoring",
                    style: TextStyle(
                        fontFamily: Constants.outfitBold, fontSize: 34),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20, left: 30),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                        fontFamily: Constants.outfitBold),
                  ),
                ),
                SizedBox(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Enter email id '),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20, left: 30),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 14, fontFamily: Constants.outfitBold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter password'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: Checkbox(
                        shape: const ContinuousRectangleBorder(),
                        value: value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                        activeColor: Constants.primaryColor,
                      ),
                    ),
                    Text(
                      "Remember Me",
                      style:
                          TextStyle(fontFamily: Constants.outFit, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: w,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/ContactUs');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.primaryColor),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontFamily: Constants.outFit, fontSize: 16),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
