import 'package:Workit/models/work.dart';
import 'package:Workit/providers/work_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class Editscreen extends StatefulWidget {
  @override
  _EditscreenState createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  final _forms = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isInit = true;

  var _editWork = Work(
    id: null,
    worktype: "",
    username: "",
    workDetail: "",
    contact: "",
    location: "",
    pay: 0,
  );

  var initialValues = {
    "worktype": "",
    "username": "",
    "workDetail": "",
    "contact": "",
    "location": "",
    "pay": "",
  };

  @override
  void initState() {
    super.initState();
    // _imageUrlController.addListener(_updateImageUrl);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final String productId = ModalRoute.of(context).settings.arguments;
      print(productId);
      if (productId != null) {
        _editWork = Provider.of<WorkProvider>(context, listen: false)
            .findById(productId);
        initialValues = {
          "worktype": _editWork.worktype,
          "username": _editWork.username,
          "workDetail": _editWork.workDetail,
          "contact": _editWork.contact,
          "location": _editWork.location,
          "pay": _editWork.pay.toString(),
        };
      }
    }
    _isInit = false;
  }
//to save and validate the form

  Future<void> _saveForm() async {
    final isValid = _forms.currentState.validate();
    if (!isValid) {
      return;
    }
    _forms.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_editWork.id != null) {
      try {
        await Provider.of<WorkProvider>(context, listen: false)
            .updateWork(_editWork.id, _editWork);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Error Occurred'),
                  content:
                      Text("Something has occurred! Product couldn't be added"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ));
      }
    } else {
      try {
        await Provider.of<WorkProvider>(context, listen: false)
            .addWork(_editWork);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Error Occurred'),
                  content:
                      Text("Something has occurred! Product couldn't be added"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ));
      }
    }
    setState(
      () {
        _isLoading = false;
      },
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
            ))
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: _forms,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: deviceSize.width,
                        height: 878,
                        //  color: Colors.teal,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Work",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 20,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              initialValue: initialValues['username'],
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.green,
                                labelText: "Enter your name",
                                hintText: "for eg. Hemsa",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)),
                                labelStyle: TextStyle(
                                  color: Color(0xff00C484),
                                ),
                              ),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'The name must not be Empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editWork = Work(
                                  id: _editWork.id,
                                  worktype: _editWork.worktype,
                                  username: value.trim(),
                                  workDetail: _editWork.workDetail,
                                  contact: _editWork.contact,
                                  location: _editWork.location,
                                  pay: _editWork.pay,
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              initialValue: initialValues['worktype'],
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.green,
                                labelText: "WorkType",
                                hintText: "for eg. Cleaning or Deliviry",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)),
                                labelStyle: TextStyle(
                                  color: Color(0xff00C484),
                                ),
                              ),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'The Title must not be Empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editWork = Work(
                                  id: _editWork.id,
                                  worktype: value.trim(),
                                  username: _editWork.username,
                                  workDetail: _editWork.workDetail,
                                  contact: _editWork.contact,
                                  location: _editWork.location,
                                  pay: _editWork.pay,
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              initialValue: initialValues['workDetail'],
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.green,
                                labelText: "Work Description",
                                hintText:
                                    "Better make it short, sweet and clean. ",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)),
                                labelStyle: TextStyle(
                                  color: Color(0xff00C484),
                                ),
                              ),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'Description must not be empty';
                                }
                                if (value.length < 10) {
                                  return 'The description must be atleast 10 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editWork = Work(
                                  id: _editWork.id,
                                  worktype: _editWork.worktype,
                                  username: _editWork.username,
                                  workDetail: value.trim(),
                                  contact: _editWork.contact,
                                  location: _editWork.location,
                                  pay: _editWork.pay,
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              initialValue: initialValues['pay'],
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.green,
                                labelText: "Payment",
                                hintText: "for eg. 1200/-",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)),
                                labelStyle: TextStyle(
                                  color: Color(0xff00C484),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'The payment must not be Empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editWork = Work(
                                  id: _editWork.id,
                                  worktype: _editWork.worktype,
                                  username: _editWork.username,
                                  workDetail: _editWork.workDetail,
                                  contact: _editWork.contact,
                                  location: _editWork.location,
                                  pay: double.parse(value),
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              initialValue: initialValues['contact'],
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.green,
                                labelText: "Your Contact Number",
                                hintText: "for eg. +9779868768895",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)),
                                labelStyle: TextStyle(
                                  color: Color(0xff00C484),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'The Contact must not be Empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editWork = Work(
                                  id: _editWork.id,
                                  worktype: _editWork.worktype,
                                  username: _editWork.username,
                                  workDetail: _editWork.workDetail,
                                  contact: value,
                                  location: _editWork.location,
                                  pay: _editWork.pay,
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              initialValue: initialValues['location'],
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                fillColor: Colors.green,
                                labelText: "Your Current Address",
                                hintText: "for eg. Tikapur, Kailali",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3)),
                                labelStyle: TextStyle(
                                  color: Color(0xff00C484),
                                ),
                              ),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'The address must not be Empty';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editWork = Work(
                                  id: _editWork.id,
                                  worktype: _editWork.worktype,
                                  username: _editWork.username,
                                  workDetail: _editWork.workDetail,
                                  contact: _editWork.contact,
                                  location: value.trim(),
                                  pay: _editWork.pay,
                                );
                              },
                            ),
                            SizedBox(height: 40),
                            Container(
                              height: 45,
                              width: 140,
                              child: FlatButton(
                                onPressed: () {
                                  _saveForm();
                                },
                                child: _editWork.id != null
                                    ? Text(
                                        "Update",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white70,
                                        ),
                                      )
                                    : Text(
                                        "Add Work",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white70,
                                        ),
                                      ),
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              height: 100,
                              width: deviceSize.width * 0.85,
                              //  color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //  crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    width: deviceSize.width * 0.12,
                                    //  color: Colors.blue,
                                    child: Text(
                                      "Note:",
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black.withOpacity(0.8),
                                        //Color(0xff2d2926),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Container(
                                      height: 100,
                                      width: deviceSize.width * 0.73,
                                      // color: Colors.green,
                                      // color: Colors.teal,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          "The works you post here is seen by all the workit users, after you get someone work for you, only make the payment when the worker fully completes the assigned work.",
                                          style: GoogleFonts.nunito(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Colors.black.withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                //style: TextStyle(color: Colors.black, fontSize: 36),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Work',
                                      style: GoogleFonts.rubik(
                                        color: Color(0xff00C484),
                                        fontSize: 27,
                                        //  letterSpacing: 2,
                                        //  fontFamily: "Menlo",
                                        fontWeight: FontWeight.w600,
                                      )),
                                  TextSpan(
                                    text: 'it',
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        color: Color(0xff2F2F2F),
                                        fontSize: 27,
                                        //letterSpacing: 2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Inc.',
                                    style: GoogleFonts.notoSans(
                                      textStyle: TextStyle(
                                        color: Color(0xff2F2F2F),
                                        fontSize: 24,
                                        //letterSpacing: 2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
