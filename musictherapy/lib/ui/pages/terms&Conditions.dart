import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musictherapy/ui/pages/signInPage.dart';
import 'package:musictherapy/ui/pages/signUpPage.dart';

class TermsAndConditions extends StatelessWidget {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final orange = const Color(0xFFF57E00);
    final green = const Color(0xFF04A489);
    final blue = const Color(0xFF1E325C);
    final white = const Color(0xFFFFFBF2);
    final yellow = const Color(0xFFFFC247);
    final honeydew = const Color(0xFFF1FAEE);
    final sectionBoxSize = width * 0.8;

    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
          //-----------------------------------
// Back Button:
          Positioned(
            top: 60,
            left: 40,
            child: Container(
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10000),
                  shadowColor: orange,
                  color: Colors.white,
                  elevation: 3,
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 12,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Image.asset(
                        "assets/images/navigation/arrow.jpeg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
//-----------------------------------
// Forgot Password:
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  height: 0.08 * height,
                  width: sectionBoxSize,
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Terms Of Service',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
//-----------------------------------
// Text:
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: <Widget>[
                            Text('Welcome to melomotion!\n',
                                style: TextStyle(fontSize: 24)),
                            Text('If you are under 18',
                                style: TextStyle(
                                    color: orange,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                '\nIf you are under the age of 18, you can only'
                                ' use this app with the permission of '
                                'your parent/guardian. Please ask them to read through this document. You can only sign up for an account and tick the box to accept these terms and conditions and privacy policy if they agree.\n\n'
                                'Your parent/guardian should monitor you when'
                                ' you are using this app and performing '
                                'exercises. If you connect your account '
                                'to an admin, you also need to ask your '
                                'parent/guardian first.\n',
                                style: TextStyle(
                                  color: orange,
                                  fontSize: 20,
                                )),
                            Text('General Information\n',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(
                                'These terms and conditions outline the rules'
                                ' and regulations for the use of '
                                'melomotion. By ticking the box you '
                                'accept these terms and conditions and '
                                'agree to our privacy policy.\n\n'
                                'The team\'s contact email address is: '
                                'dapp2group5@gmail.com.\n\n'
                                ' Our Terms and Conditions were created '
                                'with the help of the App Terms and '
                                'Conditions Generator at https://www'
                                '.app-privacy-policy.com/app-terms-conditions-generator/\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text(
                                'Parental/Guardian consent and responsibility\n',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(
                                'This app may be used by under-18s, but only'
                                ' with parental/guardian consent. Those under'
                                ' the age of 18 must ask for '
                                'parental/guardian permission when ticking '
                                'the box to accept these terms and conditions'
                                ' during account sign-up. Parents/guardians '
                                'agree to monitor children whilst they are '
                                'using this app and they are held responsible'
                                ' for the child’s safety when performing the '
                                'exercises.\n\n'
                                'This app allows a user\'s exercises to be '
                                'edited and viewed by an admin. By ticking '
                                'this box, parents/guardians agree to take '
                                'full responsibility for ensuring that the '
                                'admin chosen is trustworthy. Melomotion does'
                                ' not take any liability for the choice of '
                                'admin.\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('License\n',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(
                                'Unless otherwise stated, melomotion owns '
                                'the intellectual property rights for all '
                                'material on melomotion. All intellectual '
                                'property rights are reserved. You may access'
                                ' this from melomotion for your own personal '
                                'use subjected to restrictions set in these '
                                'terms and conditions.\n\n'
                                'You must not:\n\n'
                                '- Republish material from melomotion\n'
                                '- Sell, rent or sub-license material from '
                                'melomotion\n'
                                '- Reproduce, duplicate or copy material from'
                                ' melomotion\n'
                                '- Redistribute content from melomotion\n\n'
                                'This app allows users to upload content, '
                                'including videos. Melomotion does not '
                                'filter, edit, publish or review content '
                                'uploaded prior to their presence on the app.'
                                ' Content uploaded by users does not reflect '
                                'the views and opinions of melomotion. To the'
                                ' extent permitted by applicable laws, '
                                'melomotion shall not be liable for the '
                                'content or for any liability, damages or '
                                'expenses caused and/or suffered as a result '
                                'of any use of and/or posting of and/or '
                                'appearance of this content on the app.\n\n'
                                'Melomotion reserves the right to monitor all'
                                ' uploaded content and to remove any uploaded'
                                ' content which can be considered '
                                'inappropriate, offensive or causes breach of'
                                ' these Terms and Conditions.\n\n'
                                'You warrant and represent that:\n\n'
                                '- You are entitled to post the content on '
                                'our app and have all necessary licenses and '
                                'consents to do so;\n'
                                '- The content does not invade any '
                                'intellectual property right, including '
                                'without limitation copyright, patent or trademark of any third party;\n'
                                '- The content does not contain any '
                                'defamatory, libelous, offensive, indecent or'
                                ' otherwise unlawful material which is an invasion of privacy;\n'
                                '- The content will not be used to solicit or'
                                ' promote business or custom or present '
                                'commercial activities or unlawful activity;\n'
                                '- All movements suggested in your content '
                                    'are healthy and safe, taking into '
                                    'account the conditions and needs of '
                                    'users who may view your content.\n\n'
                                'You hereby grant melomotion a non-exclusive '
                                    'license to use, reproduce, edit and '
                                    'authorize others to use, reproduce and '
                                    'edit any of your uploaded content in any'
                                    ' and all forms, formats or media.\n',

                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('Reservation of Rights\n',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('We reserve the right to request that you '
                                'remove all uploaded content or any '
                                'particular content to our app. You agree to '
                                'immediately remove all of your content in '
                                'our app upon request. We also reserve the '
                                'right to amend these terms and conditions at'
                                ' any time. By continuously using our app, '
                                'you agree to be bound to and follow these '
                                'terms and conditions.\n\n'
                                'If you find any content on our app that is offensive for any'
                                ' reason, you are free to contact and inform '
                                'us any moment. We will consider requests to '
                                'remove content but we are not obligated to or so or to respond to you directly.\n\n'
                                'We do not warrant the completeness or '
                                'accuracy of the information on this app; nor'
                                ' do we guarantee that the app remains '
                                'available or that the material on the app is'
                                ' kept up to date.\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('Disclaimer\n',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('To the maximum extent permitted by '
                                'applicable law, we exclude all '
                                'representations, warranties and conditions '
                                'relating to our app. Nothing in this '
                                'disclaimer will:\n\n'
                                '- limit or exclude our or your liability for '
                                'death or personal injury;\n'
                                'limit any of our '
                                'or your liabilities in any way that is not '
                                'permitted under applicable law; or\n'
                                'exclude any of our or your liabilities that '
                                'may not be excluded under applicable law.\n\n'
                                'The limitations and prohibitions of '
                                'liability set in this Section and elsewhere '
                                'in this disclaimer: (a) are subject to the '
                                'preceding paragraph; and (b) govern all '
                                'liabilities arising under the disclaimer, '
                                'including liabilities arising in contract, '
                                'in tort and for breach of statutory duty.\n\n'
                                'By using this app, you understand that:\n\n'
                                '- All exercises in the app are recommendations'
                                ' only and have not been vetted by a '
                                'healthcare professional;\n'
                                '- We are not responsible for the content '
                                'uploaded by users and so exercises must be '
                                'completed at your own risk.\n\n'
                                'As long as the app and the information and '
                                'services on the app are provided free of '
                                'charge, we will not be liable for any loss '
                                'or damage of any nature.\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('\nPrivacy Policy',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            Text('\nAt melomotion, one of our main priorities '
                                'is the privacy of our users.\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('Data collected\n',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('We may collect the following Data, which '
                                'includes personal Data, from you:\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration:TextDecoration.underline,
                                )),
                            Text('a. Log in information including email '
                                'address, username, password and time of log '
                                'in.\n'
                                'b. Exercise data (number of repetitions, '
                                'exercise performed, exercise start and end '
                                'timestamps)\n'
                                'c. Data points of body parts during exercise'
                                '.\n'
                                'd. Exercise demonstration videos.\n'
                                'Note that the camera recording of an exercise session '
                                'itself is not stored.\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('How we collect Data\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration:TextDecoration.underline,
                                )),
                            Text('We collect Data in the following ways:\n'
                                'a. When you register with us and set up an '
                                'account to receive our services.\n'
                                'b. When you are doing exercise, the Arduino '
                                'takes the data and sends information to the '
                                'app via bluetooth.\n'
                                'c. When you are doing exercise, the video '
                                'footage from the camera of your device is '
                                'used to analyse your performance.\n'
                                'd. When you upload exercise demonstration '
                                'video content as an admin in our app.\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('Our use of Data\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration:TextDecoration.underline,
                                )),
                            Text('Any or all of the above Data may be '
                                'required by us from time to time in order to'
                                ' provide you with the best possible service and experience when using our App. Specifically, Data may be used by us for the following reasons:\n'
                                'a. User log in.\n'
                                'b. Internal record keeping.\n'
                                'c. Exercise performance analysis and '
                                'feedback.\n\n'
                                'When you register with us and set '
                                'up an account to receive our services, the '
                                'legal basis for this processing is the '
                                'performance of a contract between you and us'
                                ' and/or taking steps, at your request, to '
                                'enter into such a contract.\n',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text('Keeping Data secure\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration:TextDecoration.underline,
                                )),
                            Text('We will use technical and organisational '
                                'measures to safeguard your Data, for '
                                'example:\n'
                                'a. Access to your account is controlled by a'
                                ' password and a username that is unique to '
                                'you.\n'
                                'b. We store your data on secure servers.\n\n'
                                'Technical and organisational measures '
                                'include measures to deal with any suspected '
                            'data breach. If you suspect any misuse or loss '
                                'or unauthorised access to your Data, please '
                                'let us know immediately by contacting us via'
                                ' the following email address: dapp2group5@gmail.com.',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ],

                          /*style: TextStyle(
                              color: orange,
                              fontSize: 20,*/
                        ),
                      ),
                    ),
                  ),
                ),

//-----------------------------------
// Submit Button:
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.7,
                  child: GestureDetector(
                    onTap: () {
                      //auth.sendPasswordResetEmail(email: _email);
                      Navigator.of(context).pop();
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: blue,
                      color: green,
                      elevation: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              color: white,
                              //fontFamily: 'Museo',
                              fontSize: 38,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
