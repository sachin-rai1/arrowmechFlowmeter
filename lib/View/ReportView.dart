import 'package:arrowmech/Constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  var selectedDate = DateTime.now();

  Future<void> chooseDate() async {
    DateTime? picked = await showDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now(),
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Constants.primaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: const Icon(
            Icons.menu_outlined,
            color: Color(0xFF757678),
            size: 40,
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: ClipRRect(
            child: Image.asset(
              'assets/images/mainLogo.png',
              height: 33,
              width: 124,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Report",
                      style:
                          TextStyle(fontSize: 22, fontFamily: Constants.outFit),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.primaryColor),
                          borderRadius: BorderRadius.circular(50)),
                      child: GestureDetector(
                        onTap: chooseDate,
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'assets/icons/calendar.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              DateFormat("dd-MM-yyyy")
                                  .format(selectedDate)
                                  .toString(),
                              style: TextStyle(
                                fontFamily: Constants.outFit,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ClipRRect(
                              child: Image.asset(
                                'assets/icons/downarrow.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Scaffold(
                body: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 8, bottom: 8),
                                    child: Text(
                                      "Main Machine 1",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Constants.outfitBold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, top: 8, bottom: 8),
                                    child: Text("Water Consumption",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: Constants.outfitBold)),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10, left: 20),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub Machine ",
                                        style: TextStyle(
                                            fontFamily: Constants.outFit,
                                            fontSize: 15),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 200,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: TextFormField(
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: Constants.outFit),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                            ),
                            Container(
                              color: const Color(0xFFE7E7E7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, top: 8, bottom: 8),
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Constants.outfitBold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 80, top: 8, bottom: 8),
                                    child: Text(
                                      "200",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: Constants.outfitBold),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
