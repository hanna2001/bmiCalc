import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_card.dart';
import 'r_card.dart';
import 'constants.dart';
import 'output_page.dart';
import 'bottom_container.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 150;
  int weight = 40;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: RCard(
                      onPress: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                      colour:
                          gender == Gender.male ? k_ActCardClr : k_InActCardClr,
                    ),
                  ),
                  Expanded(
                    child: RCard(
                      onPress: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                      colour: gender == Gender.female
                          ? k_ActCardClr
                          : k_InActCardClr,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: RCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: k_textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: k_numbStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'cm',
                          style: k_textStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: k_bot_slid_ConClr,
                          overlayColor: k_OverLAySlidClr,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: k_InActSlidClr),
                      child: Slider(
                        value: height.toDouble(),
                        min: k_sliderMin.toDouble(),
                        max: k_sliderMax.toDouble(),
                        onChanged: (double change) {
                          setState(() {
                            height = change.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
                colour: k_ActCardClr,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: RCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: k_textStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: k_numbStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      colour: k_ActCardClr,
                    ),
                  ),
                  Expanded(
                    child: RCard(
                      colour: k_ActCardClr,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: k_textStyle,
                          ),
                          Text(
                            age.toString(),
                            style: k_numbStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomContainer(
              title: 'CALCULATE',
              nextPage: () {
                if (gender == null)
                  Alert(
                      context: context,
                      title: "Gender Not Found",
                      desc: "Please Select a Gender",
                      buttons: [
                        DialogButton(
                          child: Text('okay'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: k_InActSlidClr,
                        ),
                      ]).show();
                else {
                  Calculate c = Calculate(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OutputPage(
                        bmi: c.calculateBmi(),
                        state: c.returnState(),
                        comment: c.returnComment(),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  RoundIconButton({@required this.icon, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: k_RoundButClr,
      shape: CircleBorder(),
    );
  }
}
