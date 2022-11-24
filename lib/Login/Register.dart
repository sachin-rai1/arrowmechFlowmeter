import 'package:arrowmech/Login/LoginPageView.dart';
import 'package:flutter/material.dart';
import 'package:arrowmech/Constant.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();

}

class _SignUpState extends State<SignUp> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController roleTextController = TextEditingController();
  bool value = false;

  String sdkKey = "cc5b789070ebefd920791ca8b2fe08d92e956eca572e1d8b807a3e2338fdd0dc/stage";
  Color bgColor = Colors.white;
  @override
  void initState() {
    super.initState();
    initAlan();
  }
  initAlan(){
    AlanVoice.addButton(sdkKey , bottomMargin: 100 , buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);
    AlanVoice.callbacks.add((command)=> _handleCommand(command.data));

    }


  _handleCommand(Map<String, dynamic> response) {

    switch (response["command"]) {
      case "next_page":
        Get.to(const LoginPage());
        break;
      case "prev_page":
        Get.back();
        break;
      case "change_bg_color":
        setState(() {
          bgColor = Colors.yellow;
        });
        break;
      case "disable":
        AlanVoice.deactivate();
        break;
      default:
        print("no match found");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                ), //
                Container(
                  padding: const EdgeInsets.only(bottom: 20, left: 30),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "UserName",
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
                        controller: userNameTextController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Enter User Name '),
                      )),
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
                        controller: emailTextController,
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
                    controller: passTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter password'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20, left: 30),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Role ID",
                    style: TextStyle(
                        fontSize: 14, fontFamily: Constants.outfitBold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: roleTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter Role'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: w,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.primaryColor),
                        child: Text(
                          'Sign Up',
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
