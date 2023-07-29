import 'package:flutter/material.dart';
import 'package:iti_projects/ecommerce/screens/auth_screen.dart';


class OnboardingScreen extends StatefulWidget {
   int num;
   OnboardingScreen({
    super.key,
    required this.num,

  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  List<String> names=[
    "Browse all the category",
    "Hello world",
    "hgfjgjjkfgkj"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/boarding${widget.num}.png",height: 300,),
            SizedBox(height: 50,),
            Text(names[widget.num-1],style: TextStyle(
              fontSize: 25
            ),),
            SizedBox(height: 20,),
            Text("In aliquip aute exercitation ut et nisi fgfgfg ut mollit. Deserunt dolor elit pariatur aute .",style: TextStyle(
                fontSize: 16,
              color: Colors.grey,
            ),),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                if(widget.num<3){
                  widget.num =widget.num+1;
                  setState(() {
                  });

                }else{
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>  AuthScreen()
                    ),

                  );
                }

              },
                child: Image.asset("assets/images/next${widget.num}.png",height: 80,))

          ],
        ),
      ),
    );
  }
}
