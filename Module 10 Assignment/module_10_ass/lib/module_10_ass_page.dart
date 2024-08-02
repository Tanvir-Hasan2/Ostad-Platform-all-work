import 'package:flutter/material.dart';

class Module10AssPage extends StatelessWidget {
  static const String routeName = '/';
  const Module10AssPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Greeting App'),
       centerTitle: false,
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const Text(
             'Hello, World!',
             style: TextStyle(
               color: Colors.red,
               fontWeight: FontWeight.bold,
               fontSize: 24,
             ),
           ),
           const SizedBox(height: 10),
           const Text(
             'Welcome to Flutter!',
             style: TextStyle(
               fontSize: 18,
             ),
           ),
           const SizedBox(height: 20),
           Image.network(
             'https://media.licdn.com/dms/image/v2/D5603AQHIBYin-kdPRg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1718313341534?e=1727913600&v=beta&t=bBtW892QILYfQVkBIgv1JcWxi_Xiq-QhPEe23V01IAw', // Replace this URL with your desired image URL or asset path.
             height: 100,
           ),
           const SizedBox(height: 20),
           ElevatedButton(
             style: ButtonStyle(
                 foregroundColor: WidgetStateProperty.all<Color>(Colors.black87),
                 backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                 shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                     )
                 )
             ),
             onPressed: () {
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                   content: Text('Button Pressed!'),
                 ),
               );
             },
             child: const Text('Press Me'),
           ),
         ],
       ),
     ),
   );
  }
}
