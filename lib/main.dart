import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'your BMI',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.amber.shade300;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("your BMI"),
      ),
      body:Container(
        color: bgcolor,
        child: Center(
            child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                      const Text("BMI", style: TextStyle(
                        fontSize: 34, fontWeight: FontWeight.w700
                      ),),

                      TextField(
                        controller: wtcontroller,
                        decoration: const InputDecoration(
                          label: Text("enter your weight (in kgs)"),
                          prefixIcon: Icon(Icons.line_weight)
                        ),
                        keyboardType: TextInputType.number,
                      ),

                      const SizedBox(height: 25,),

                      TextField(
                        controller: ftcontroller,
                        decoration: const InputDecoration(
                          label: Text("enter your height (in feet)"),
                          prefixIcon: Icon(Icons.height)
                        ),
                        keyboardType: TextInputType.number,
                      ),

                        const SizedBox(height: 25,),

                      TextField(
                        controller: incontroller,
                        decoration: const InputDecoration(
                          label: Text("enter your height (in inches)"),
                          prefixIcon: Icon(Icons.height)
                        ),
                        keyboardType: TextInputType.number,
                      ),

                      const SizedBox(height: 25,),

                      ElevatedButton(
                        onPressed: (){
                          var wt = wtcontroller.text.toString();
                          var ft = ftcontroller.text.toString();
                          var inch = incontroller.text.toString();

                          if(wt != "" && ft != "" && inch != ""){

                            //bmi calculate
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iinch = int.parse(inch);

                            var tinch = (ift * 12) + iinch;
                            var tcm = tinch * 2.54;
                            var tm = tcm/100;

                            var bmi = iwt/(tm * tm);
                              var msg = "";

                              if(bmi > 25){
                                msg = "you are overweight";
                                bgcolor = Colors.orange.shade200;
                              } else if(bmi < 18){
                                msg = "you are underweight";
                                bgcolor = Colors.red.shade200;
                              } else {
                                msg = "you are health";
                                bgcolor = Colors.green.shade200;
                              }

                              setState(() {
                                result = "$msg \n your BMI is: ${bmi.toStringAsFixed(2)}";
                              });
                            
                          } else{
                            setState(() {
                              result = "please fill all the required fields";
                            });
                          }
                        }, 
                        child: const Text("calculate")
                        ),

                        Text(result, style: const TextStyle(fontSize: 20,color: Colors.red),),
                ],
              )
          )
      ) 
      )
    );
  }
}
