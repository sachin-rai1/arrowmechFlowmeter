import 'package:arrowmech/Constant.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/contactBg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: const Icon(
            Icons.menu_outlined,
            color: Color(0xFF757678),
            size: 40,
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h / 4.5),
              child: SizedBox(
                  height: h / 5,
                  width: w / 1.5,
                  child: Image.asset("assets/images/logo.png")),
            ),
            Text(
              "Get Support From Our Team",
              style: TextStyle(
                color: Colors.black,
                fontFamily: Constants.outFit,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call, color: Constants.primaryColor),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "+91 96383 21949",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Constants.outfitBold,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.mail,
                  color: Constants.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "hello@arrowmech.com",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: Constants.outfitBold,
                    fontSize: 16,
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
