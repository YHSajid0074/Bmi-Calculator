import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color male=inactive;
Color female=inactive;

enum Gender{
  male,
  female,
}


const inactive=Color(0xFF1D1E33);
const active = Color(0xFF2D2E43);


void updateColor(Gender gender){
if(gender==Gender.male){
  if(male==inactive){
    male=active;
  }else{
    male=inactive;
  }
}
else if(gender==Gender.female){
  if(female==inactive){
   female=active;
  }else{
    female=inactive;
  }
}

}




class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.colour, required this.cardChild}); // Named parameters with `required`

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.male);

                      });
                    },

                    child: ReusableCard(
                      colour: male,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80,

                          ),
                          SizedBox(height: 15),
                          Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(

                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.female);

                      });
                    },

                    child: ReusableCard(
                      colour: female,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80,

                          ),
                          SizedBox(height: 15),
                          Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text('Height',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('180',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            Text('cm',
                            style: TextStyle(
                              fontSize: 30,
                            ),)
                          ],
                        ),




                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
