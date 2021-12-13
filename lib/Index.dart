import 'package:flutter/material.dart';
import 'variable.dart';
import 'survey.dart';

main() => runApp(MyApp());

String name = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal History Survey',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  //key for form's Status
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //making Controller for Name and Age
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();

  //Call When _myHomePageState remove
  @override
  void dispose() {
    //Remove TextEditingController and assigned Listener
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  bool backColor = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backColor ? Colors.grey[600] : Colors.black,
        appBar: AppBar(
          title: Text('Personal Information'),
        ),

        //TextField For type Name
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text("Type Your Name and Age Before Survey",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 30,
                  ),

                  //Assign Name of User
                  TextFormField(
                    controller: _nameController,
                    onChanged: (newValue) => name = newValue,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return " Type Your Name";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ex) Your Name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  //TextField For Type Age
                  TextFormField(
                    controller: _ageController,
                    onChanged: (newValue) => age = newValue,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return " Type Your Age";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ex) Your Age',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          //Move to Next page
                          MaterialPageRoute(builder: (context) => Survey()),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Grey BackGround Mode"),
                  Switch(
                    value: backColor,
                    onChanged: (bool newValue) {
                      setState(() {
                        backColor = newValue;
                      });
                    },
                    activeColor: Colors.red[400],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

//Second Page
class Survey extends StatefulWidget {
  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  //key for form's Status
  GlobalKey<FormState> _surveyKey = GlobalKey<FormState>();

  //Making TextController and assign to Field
  TextEditingController _awn1 = new TextEditingController();
  TextEditingController _awn2 = new TextEditingController();
  TextEditingController _awn3 = new TextEditingController();
  TextEditingController _awn4 = new TextEditingController();
  TextEditingController _awn5 = new TextEditingController();
  TextEditingController _awn6 = new TextEditingController();

  //Call When _SurveyState remove
  @override
  void dispose() {
    _awn1.dispose();
    _awn2.dispose();
    _awn3.dispose();
    _awn4.dispose();
    _awn5.dispose();
    _awn6.dispose();
    super.dispose();
  }

  //View Sight
  @override
  bool backColor = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor ? Colors.grey[600] : Colors.black,
      appBar: AppBar(
        title: Text("Survey Page"),
      ),
      //Protect App with SafeArea
      body: SafeArea(
        //Make possible to scrollDown
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _surveyKey,
                child: Column(
                  //initiate Text Field
                  children: <Widget>[
                    Text("All Question Must be answer with 'yes'or 'no'"),
                    //Make First Question
                    TextFormField(
                      controller: _awn1,
                      onChanged: (newValue) => awn1 = newValue,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Fill the blank";
                        }
                        if (awn1 == 'yes') {
                          count++;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '1. Have you failed a lot in the past?',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    //Make 2nd Question
                    TextFormField(
                      controller: _awn2,
                      onChanged: (newValue) => awn2 = newValue,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Fill the blank";
                        }
                        if (awn2 == 'yes') {
                          count++;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            '2. Have you ever experienced something unforgettable?',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    //Make 3rd Question
                    TextFormField(
                      controller: _awn3,
                      onChanged: (newValue) => awn3 = newValue,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Fill the blank";
                        }
                        if (awn3 == 'yes') {
                          count++;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            '3. Have you ever stolen when you were young?',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    //Make 4th Question
                    TextFormField(
                      controller: _awn4,
                      onChanged: (newValue) => awn4 = newValue,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Fill the blank";
                        }
                        if (awn4 == 'yes') {
                          count++;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            '4. Have you ever been jealous or hated anyone in the past?',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    //Make 5th Question
                    TextFormField(
                      controller: _awn5,
                      onChanged: (newValue) => awn5 = newValue,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Fill the blank";
                        }
                        if (awn5 == 'yes') {
                          count++;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            '5. Have you ever thought you wanted to suicide in the past?',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    ElevatedButton(
                      child: Text("See the Result"),
                      onPressed: () {
                        if (_surveyKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            //Move to Next page
                            MaterialPageRoute(
                                builder: (context) => showResult()),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text("Grey BackGround Mode"),
                    Switch(
                      value: backColor,
                      onChanged: (bool newValue) {
                        setState(() {
                          backColor = newValue;
                        });
                      },
                      activeColor: Colors.red[400],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class showResult extends StatefulWidget {
  @override
  State<showResult> createState() => _showResultState();
}

class _showResultState extends State<showResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Page"),
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  child: Text("Move to Survey Page"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      //Move to Next page
                      MaterialPageRoute(builder: (context) => lastPage()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String result() {
  if (count == 0) {
    output =
        "$name! You're a person who can't tolerate even a small mistake! Amazing! But you can make mistakes in the future, so always be careful!";
    return output;
  } else if (count > 1 && count < 3) {
    output =
        "$name! It's okay! You have to make two or three mistakes in your life! If you don't repeat past mistakes, there will be no problem in the future!";
    return output;
  } else {
    output =
        "$name! You've done a lot of things in your life so far. It's okay. If you made this mistake after social responsibility, you might have had to pay a big price. You can be careful from now on!";
    return output;
  }
}
