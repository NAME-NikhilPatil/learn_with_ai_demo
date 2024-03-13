import 'package:educational_app/Screens/Quiz_Page/quizpage.dart';
import 'package:educational_app/Screens/Translation/localization/locals.dart';
import 'package:educational_app/components/Configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Quiz_Home extends StatefulWidget {
  late String subject;

  Quiz_Home({super.key, required this.subject});
  @override
  _Quiz_HomeState createState() => _Quiz_HomeState();
}

class _Quiz_HomeState extends State<Quiz_Home> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  late String subject;

  bool isDrawerOpen = false;
  @override
  void initState() {
    super.initState();
    subject = widget.subject;
  }

  List<String> images = [
    "assets/images/maths.svg",
    "assets/images/english.svg",
    "assets/images/science.svg",
    "assets/images/language.svg"
  ];

  List<String> des = [
    "Explore the world of numbers and shapes in 1st-grade math – a fun journey of learning and discovery awaits you! Test your math skills and watch your understanding grow!",
    "Dive into the world of words and sentences in 1st-grade English – explore, learn, and challenge yourself with the wonders of language!",
    "Dive into the wonders of the natural world with 1st-grade science – explore, discover, and test your knowledge in a fun and exciting learning adventure!",
    "खोजो हिंदी की दुनिया को पहली कक्षा में - एक मजेदार और शिक्षात्मक सफर में, जानो और अपनी जानकारी का परीक्षण करो!",
  ];

  Widget customcard(String langname, String image, String des) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: primaryGreen,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(100.0),
                  child: SizedBox(
                    // changing from 200 to 150 as to look better
                    height: 150.0,
                    width: 150.0,
                    child: ClipOval(
                      child: SvgPicture.asset(
                        image,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  langname,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: "Quando",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  des,
                  style: const TextStyle(
                      fontSize: 18.0, color: Colors.white, fontFamily: "Alike"),
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _container(
              0.0,
              30.0,
              10.0,
              Colors.lightBlue,
              LocaleData.quiz.getString(context),
              "assets/images/quiz.png",
            ),
            subject == 'maths'
                // || subject == 'गणित' || subject == 'ریاضی'
                ? customcard(
                    LocaleData.maths.getString(context),
                    images[0],
                    des[0],
                  )
                : Container(),
            subject == 'english'
                // ||
                // subject == 'अंग्रेज़ी' ||
                // subject == 'انگریزی'
                ? customcard(
                    LocaleData.english.getString(context),
                    images[1],
                    des[1],
                  )
                : Container(),
            subject == 'science'
                // || subject == 'विज्ञान' || subject == 'سائنس'
                ? customcard(
                    LocaleData.science.getString(context),
                    images[2],
                    des[2],
                  )
                : Container(),
            // Hindi
            subject == 'hindi'
                // || subject == 'हिंदी' || subject == 'اردو'
                ? customcard(
                    LocaleData.hindi.getString(context),
                    images[3],
                    des[3],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  _container(left, top, right, color, text, image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: left, right: right, top: top),
        height: 200,
        width: (MediaQuery.of(context).size.width - 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: (MediaQuery.of(context).size.width - 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
