import 'package:flutter/material.dart';
import 'variable.dart';
import 'Index.dart';

//Make User rate My app
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: lastPage(),
    );
  }
}

class lastPage extends StatefulWidget {
  @override
  State<lastPage> createState() => _lastPageState();
}

class _lastPageState extends State<lastPage> {
  var _ratingSliderValue = 1.0;
  var _greeting = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating My App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildRateSlider(),
            _greeTo(),
            //Button for Goback to first Page
            ElevatedButton(
                child: Text("Go back to first Page"),
                onPressed: () {
                  Navigator.push(
                    context,
                    //Move to Next page
                    MaterialPageRoute(builder: (context) => myHomePage()),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildRateSlider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Rate My App ",
        ),
        SizedBox(
          height: 70,
        ),
        //make Slider
        Slider(
          min: 1.0,
          max: 10.0,
          divisions: 9,
          //when user changed value, Slider value changed
          value: _ratingSliderValue,
          onChanged: _updateSliderValue,
          label: '${_ratingSliderValue.toInt()}',
        ),
      ],
    );
  }

  Widget _greeTo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: Text("Submit"),
          onPressed: _Result,
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Container(
            height: 120,
            width: 80,
            child: ListView(
              children: [
                Text(
                  _greeting,
                  textAlign: TextAlign.center,
                  textScaleFactor: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  //When the user drags the slider and changes it to a new value, onChanged is called, and at this time, the current value is passed over.
  // You have to change the value of the slider to the value you received from onChanged.
  void _updateSliderValue(double newValue) {
    setState(() {
      _ratingSliderValue = newValue;
    });
  }
  //show the Result depends on User Rating
  void _Result() {
    setState(() {
      if (_ratingSliderValue < 3) {
        _greeting = "I need to rip it all off and fix it!";
      } else if (_ratingSliderValue >= 3 && _ratingSliderValue < 7) {
        _greeting = "It means it's normal.\nI'll do my best to grow further.";
      } else {
        _greeting =
            "Thank you for the good evaluation!\n It gives me a lot of strength!";
      }

    });
  }
}
