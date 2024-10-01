import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
  }

class _QuizAppState extends State {
  List<Map> allQuestions =[
    {
      "question" : "Who is the founder of Microsoft?",
      "options" : ["Steve Jobs", "Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer": 1
    },
    {
      "question" : "Who is the founder of Google?",
      "options" : ["Steve Jobs", "Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer": 2
    },
    {
      "question" : "Who is the founder of SpaceX?",
      "options" : ["Steve Jobs", "Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer": 3
    },
    {
      "question" : "Who is the founder of Apple?",
      "options" : ["Steve Jobs", "Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer": 0
    },
    {
      "question" : "Who is the founder of Meta?",
      "options" : ["Steve Jobs", "Mark Zuckerberg","Lary Page","Elon Musk"],
      "correctAnswer": 1
    },
  ];
  int currentQuestionIndex = 0;
  int selectedAnswerIndex =-1;
  int totalMarks = 0;
  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if(selectedAnswerIndex != -1) {
      if(answerIndex == allQuestions [currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      }else if(selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      }else {
        return const WidgetStatePropertyAll(null);
      }
    }else{
      return const WidgetStatePropertyAll(null);
    }
  }

  void totalMarksFun(){
    if(selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]){
      totalMarks++;
    }
  }
  bool questionPage = true;
  @override
  
  Widget build(BuildContext context){
    return isQuestionScreen();
  }
  Scaffold isQuestionScreen(){
    if (questionPage == true){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style:TextStyle(
            fontSize:28,
            fontWeight: FontWeight.w900,
            color:Color.fromARGB(255, 0, 255, 217),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Column(
        children: [
          const SizedBox(
            height:30,
          ),
          //Question Number
          Row(
            children: [
              const SizedBox(
                width:130,
              ),
              Text(
                "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                style: const TextStyle(
                  fontSize : 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height:50,
          ),
          //Question
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://media.npr.org/assets/img/2012/02/17/6874.5_01c91ebc_custom-1b4ba0a7dd6493e4c9c2f7d32debf5a6cdf61b70.png?s=800&c=85&f=png",
                height: 100,
                )
              ],
            ),
          ),
          SizedBox(
            width: 380,
            height: 50,
            child:Text(
              allQuestions[currentQuestionIndex]["question"],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 176, 39, 66),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          //Option 1
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1){
                  selectedAnswerIndex = 0;
                  totalMarksFun();
                  setState(() { });
                }
              },
              child: Text(
                "A.${allQuestions[currentQuestionIndex]['options'][0]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),    
              
          const SizedBox(
            height: 25,
          ),
          //Option 2
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1){
                  selectedAnswerIndex = 1;
                  totalMarksFun();
                  setState(() { });
                }
              },
              child: Text(
                "B.${allQuestions[currentQuestionIndex]['options'][1]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ), 
          const SizedBox(
            height: 25,
          ),
          //Option 3
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1){
                  selectedAnswerIndex = 2;
                  totalMarksFun();
                  setState(() { });
                }
              },
              child: Text(
                "C.${allQuestions[currentQuestionIndex]['options'][2]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ), 
          const SizedBox(
            height: 25,
          ),
          //Option 4
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1){
                  selectedAnswerIndex = 3;
                  totalMarksFun();
                  setState(() { });
                }
              },
              child: Text(
                "D.${allQuestions[currentQuestionIndex]['options'][3]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(selectedAnswerIndex != -1) {
            //CHECKS THE CONDITION AND SHOWS THE RESULT SCREEN
            if(currentQuestionIndex < allQuestions.length - 1) {
              currentQuestionIndex++;
            }else{
              questionPage = false;
            }
            selectedAnswerIndex = -1;
            setState(() {});
          }
        },
        backgroundColor: const Color.fromARGB(255, 243, 142, 33),
        child: const Icon(
          Icons.forward,
          color: Colors.white,
        ),
      ),
    );
  }else{
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz Result",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://media.istockphoto.com/id/1780510169/photo/first-place-in-a-computer-game-winners-cup-achievements-victory-goal-achievement-concept-best.webp?b=1&s=612x612&w=0&k=20&c=bVOJRInYEmX1BLPC40GMJME4Tw8IUQYYEV0qBXW0tQA=",
            height: 300,
           ),
           const SizedBox(height: 30),
           const Text(
            "Congratulations",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.orange,
            ),
           ),
           const SizedBox(height: 30),
            Text(
           "Score: $totalMarks ",
            style: const TextStyle(
            fontSize:30,
            fontWeight : FontWeight.w900,
           ),
        ),

          ],
        ),
      ),
    );
  }
}
}

