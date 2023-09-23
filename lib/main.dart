import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatefulWidget {
  const Destini({super.key});

  @override
  State<Destini> createState() => _DestiniState();
}

StoryBrain storyBrain = new StoryBrain();


class _DestiniState extends State<Destini> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/appbackground.png"),fit: BoxFit.cover),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: GoogleFonts.breeSerif(fontSize: 20, color: Color.fromARGB(187, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                      storyBrain.nextStory(1);
                      });
                      
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[200]),
                    child: Text(storyBrain.getchoice1(),style: const TextStyle(fontSize: 18),),
                  ),
                ),
              ),
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      
                      onPressed: () {
                        setState(() {
                        storyBrain.nextStory(2);
                        });
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[200]),
                      child: Text(storyBrain.getchoice2(),style: const TextStyle(fontSize: 18),),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
