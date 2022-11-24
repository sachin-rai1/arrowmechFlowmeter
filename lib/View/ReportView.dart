import 'package:flutter/material.dart';
import 'package:arrowmech/Constant.dart';
import 'package:intl/intl.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

const double width = 300.0;
const double height = 45.0;
const double fullday = -1;
const double shiftday = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _ReportViewState extends State<ReportView> {
  var selectedDate = DateTime.now();
  late double xAlign;
  late Color fulldayColor;
  late Color shiftdayColor;

  @override
  void initState() {
    super.initState();
    xAlign = fullday;
    fulldayColor = selectedColor;
    shiftdayColor = normalColor;
  }

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
        drawer: const Drawer(
          backgroundColor: Colors.red,
          width: 100,
        ),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
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
            Center(
              child: Container(
                width: width * 1.1,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Constants.primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment: Alignment(xAlign, 0),
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        width: width * 0.5,
                        height: height,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = fullday;
                          fulldayColor = selectedColor;
                          shiftdayColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: const Alignment(-1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Full Day',
                            style: TextStyle(
                              color: fulldayColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = shiftday;
                          shiftdayColor = selectedColor;
                          fulldayColor = normalColor;
                        });
                      },
                      child: Align(
                        alignment: const Alignment(1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Text(
                            'Shift Wise',
                            style: TextStyle(
                              color: shiftdayColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ToggleSwitch(
            //   minWidth: w,
            //   cornerRadius: 20.0,
            //   activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
            //   activeFgColor: Colors.white,
            //   inactiveBgColor: Colors.grey,
            //   inactiveFgColor: Colors.white,
            //   initialLabelIndex: 0,
            //   totalSwitches: 2,
            //   labels: ['True', 'False'],
            //   radiusStyle: true,
            //   onToggle: (index) {
            //     print('switched to: $index');
            //   },
            //   animate: true,
            //
            // ),

            (xAlign == shiftday) ? shiftWise(context) : fullDay(context)
          ],
        ),
      ),
    );
  }

  Widget fullDay(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Expanded(
      child: Scaffold(
        drawer:const Drawer(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Machine ",
                                style: TextStyle(
                                    fontFamily: Constants.outFit, fontSize: 15),
                              ),
                              Container(
                                  height: 32,
                                  width: w / 3,
                                  // color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      '1234567890'.toString(),
                                      style: TextStyle(
                                          fontSize: 17.5,
                                          fontFamily: Constants.outFit),
                                    ),
                                  )),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }

  Widget shiftWise(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Expanded(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 32,
                            width: w / 3.2,
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: Text("Main",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Constants.outfitBold)),
                          ),
                          Container(
                            height: 32,
                            width: w / 3.2,
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: Text("Shift 1",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Constants.outfitBold)),
                          ),
                          Container(
                            height: 32,
                            width: w / 3.2,
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: Text("Shift 2",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Machine ",
                                style: TextStyle(
                                    fontFamily: Constants.outFit, fontSize: 15),
                              ),
                              Container(
                                  height: 32,
                                  width: w / 3.2,
                                  // color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      '12345678'.toString(),
                                      style: TextStyle(
                                          fontSize: 17.5,
                                          fontFamily: Constants.outFit),
                                    ),
                                  )),
                              Container(
                                  height: 32,
                                  width: w / 3.2,
                                  // color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      '12345678'.toString(),
                                      style: TextStyle(
                                          fontSize: 17.5,
                                          fontFamily: Constants.outFit),
                                    ),
                                  )),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 32,
                            width: w / 3.2,
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: Text("Total",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Constants.outfitBold)),
                          ),
                          Container(
                            height: 32,
                            width: w / 3.2,
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: Text("200",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Constants.outfitBold)),
                          ),
                          Container(
                            height: 32,
                            width: w / 3.2,
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: Text("12345687",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Constants.outfitBold)),
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
    );
  }
}
