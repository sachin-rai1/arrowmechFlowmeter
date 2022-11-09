import 'package:arrowmech/Constant.dart';
import 'package:flutter/material.dart';

class SubMachine extends StatefulWidget {
  const SubMachine({Key? key}) : super(key: key);

  @override
  State<SubMachine> createState() => _SubMachineState();
}

class _SubMachineState extends State<SubMachine> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 30),
                height: 80,
                width: 200,
                // color: Colors.redAccent,
                child: Image.asset('assets/images/mainLogo.png')),
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Machine",
                      style: TextStyle(
                          fontSize: 22, fontFamily: Constants.outfitBold),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _displayTextInputDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Constants.primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: Constants.outFit),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.add_box_outlined)
                              ],
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Scaffold(
                body: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFF8F8F8),
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
                                      "Sub Machine 1",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: Constants.outfitBold),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8, right: 20),
                                      child: SizedBox(
                                        height: 25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              child: Image.asset(
                                                  'assets/icons/edit.png'),
                                              onTap: () {
                                                _updateDialog(context,
                                                    int.parse(1.toString()));
                                              },
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _deleteMachineDialog(context,
                                                    int.parse(1.toString()));
                                              },
                                              child: Image.asset(
                                                  'assets/icons/delete.png'),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10, left: 20),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "IOT Device ID",
                                            style: TextStyle(
                                                fontFamily: Constants.outFit,
                                                fontSize: 15),
                                          ),
                                          Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: Text(
                                                "0",
                                                style: TextStyle(
                                                    fontFamily:
                                                        Constants.outfitBold,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Local Device ID",
                                            style: TextStyle(
                                                fontFamily: Constants.outFit,
                                                fontSize: 15),
                                          ),
                                          Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: Text(
                                                "0",
                                                style: TextStyle(
                                                    fontFamily:
                                                        Constants.outfitBold,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 1,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                            ),
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

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: _formKey,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              title: Text(
                "Add New Machine",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20,
                  fontFamily: Constants.outfitBold,
                ),
              ),
              content: Builder(
                builder: (context) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return SizedBox(
                    height: height / 6,
                    width: width / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Sub Category Required' : null,
                            // controller: controller.machineNameTextController,
                            style: TextStyle(
                              fontFamily: Constants.outFit,
                              // color: Constants.textColor,
                            ),
                            decoration: InputDecoration(
                                hintText: "Sub Category Name",
                                contentPadding: const EdgeInsets.only(
                                    bottom: 20.0, left: 10.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.outFit,
                                    fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.outFit,
                                    fontSize: 14),
                                // hintText: "first name",
                                fillColor: Colors.white70),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: width / 3.2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    value!.isEmpty ? 'IOT ID Required' : null,
                                // controller: controller.averageTextController,
                                style: TextStyle(
                                  fontFamily: Constants.outFit,
                                  // color: Constants.textColor,
                                ),
                                decoration: InputDecoration(
                                    hintText: "IOT Device ID",
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 20.0, left: 10.0),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    labelStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    // hintText: "first name",
                                    fillColor: Colors.white70),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 60,
                              width: width / 3.2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    value!.isEmpty ? 'Local Id Required' : null,
                                // controller: controller.deviationTextController,
                                style: TextStyle(
                                  fontFamily: Constants.outFit,
                                  // color: Constants.textColor,
                                ),
                                decoration: InputDecoration(
                                    hintText: "Local Device ID",
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 20.0, left: 10.0),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    labelStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    // hintText: "first name",
                                    fillColor: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              actions: <Widget>[
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                        }
                      },
                      style: ButtonStyle(
                          textStyle:
                              MaterialStateProperty.all<TextStyle>(TextStyle(
                            fontSize: 16,
                            fontFamily: Constants.outFit,
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.primaryColor)),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 16,
                          fontFamily: Constants.outFit,
                        ),
                      ),
                    )),
              ],
            ),
          );
        });
  }

  Future<void> _updateDialog(BuildContext context, int id) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            title: Text(
              "Update Machine",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: Constants.outfitBold,
              ),
            ),
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;
                return Form(
                  key: _formKey,
                  child: SizedBox(
                    height: height / 6,
                    width: width / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value) =>
                                value!.isEmpty ? 'Sub Category Required' : null,
                            // controller: controller.machineNameTextController,
                            style: TextStyle(
                              fontFamily: Constants.outFit,
                              // color: Constants.textColor,
                            ),
                            decoration: InputDecoration(
                                hintText: "Sub Category Name",
                                contentPadding: const EdgeInsets.only(
                                    bottom: 20.0, left: 10.0),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.outFit,
                                    fontSize: 14),
                                labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: Constants.outFit,
                                    fontSize: 14),
                                // hintText: "first name",
                                fillColor: Colors.white70),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: width / 3.2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    value!.isEmpty ? 'IOT ID Required' : null,
                                // controller: controller.averageTextController,
                                style: TextStyle(
                                  fontFamily: Constants.outFit,
                                  // color: Constants.textColor,
                                ),
                                decoration: InputDecoration(
                                    hintText: "IOT Device ID",
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 20.0, left: 10.0),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    labelStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    // hintText: "first name",
                                    fillColor: Colors.white70),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 60,
                              width: width / 3.2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    value!.isEmpty ? 'Local Id Required' : null,
                                // controller: controller.deviationTextController,
                                style: TextStyle(
                                  fontFamily: Constants.outFit,
                                  // color: Constants.textColor,
                                ),
                                decoration: InputDecoration(
                                    hintText: "Local Device ID",
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 20.0, left: 10.0),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    labelStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: Constants.outFit,
                                        fontSize: 14),
                                    // hintText: "first name",
                                    fillColor: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            actions: <Widget>[
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                    }
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        fontSize: 16,
                        fontFamily: Constants.outFit,
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.update,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text(
                        "Update",
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 14,
                          fontFamily: Constants.outFit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<void> _deleteMachineDialog(BuildContext context, int id) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            title: Text(
              "Are you sure to Delete ?",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: Constants.outFit,
              ),
            ),
            actions: <Widget>[
              Container(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.back();
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        fontSize: 16,
                        fontFamily: Constants.outFit,
                      )),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontFamily: Constants.outFit,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                        fontSize: 16,
                        fontFamily: Constants.outFit,
                      )),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontFamily: Constants.outFit,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

