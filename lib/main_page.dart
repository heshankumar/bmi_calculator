import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int height = 160;
  int weight = 50;
  late double val = calculateBMI(height,  weight);
  String gender = '';

  // late double bmi =  calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        color: Colors.white,
        // padding: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             Row(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                    gender='m';
                    });
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: gender=='m'? Colors.blue.withAlpha(150): Colors.blue.withAlpha(50),
                      borderRadius: BorderRadius.circular(25),
                  
                    ),
                    
                    child: const Column(
                      children: [
                        Icon(Icons.male, size: 100,),
                        Text("Male")
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                    gender='f';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: gender=='f'? Colors.pink.withAlpha(150) : Colors.pink.withAlpha(50),
                      borderRadius: BorderRadius.circular(25),
                  
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.female , size: 100),
                        Text("Female")
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Height (cm)", style: kLabelColor,),
                      Text("$height", style: kInputColor,  ),
                      Row(children: [FloatingActionButton(onPressed: (){
                        setState(() {
                          if (height>25) height --;
                          val = calculateBMI(height, weight);
                        });
                        
                      },
                       child: const Icon(Icons.remove),),
                        const SizedBox(width: 20,), 
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            if (height<220) height ++;
                            val = calculateBMI(height, weight);
                          });
                        
                        
                       } , child: const Icon(Icons.add))],)
                      
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weight (kg)", style: kLabelColor,),
                      Text("$weight", style: kInputColor,  ),
                      Row(children: [FloatingActionButton(onPressed: (){
                        setState(() {
                          if (weight>0) weight--;
                          val = calculateBMI(height, weight);
                        });
                      } , child: const Icon(Icons.remove),), const SizedBox(width: 20,), FloatingActionButton(onPressed: (){
                        setState(() {
                          weight++;
                          val = calculateBMI( height,  weight);
                        });
                      } , child: const Icon(Icons.add))],)
                      
                    ],
                  ),
                ),
              ]
            ),

            const SizedBox(height: 50,),

            Column(
              children: [
                const Text("BMI", style: kLabelColor,),
                Text("${val.toStringAsFixed(2)}", style: kOutputColor),
                Text(isHealthy(val), style: kLabelColor),
              ],
            )
            
          ],
        ),
            ),
      ) ,
    );
    
  }

double calculateBMI(height, weight  ){
  double bmi = (weight/(height*height))*10000;
  return bmi;

}

String isHealthy(val) {
  if (val>=25){
    return "Overweight";
  }
  else if (val>18.5){
    return 'Normal';
  }
  else {
    return 'Underweight';
  }
}

}
