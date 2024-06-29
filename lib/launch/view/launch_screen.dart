import 'package:animated_background/animated_background.dart';
import 'package:e_commerce_app/customer/customerlaunch/view/customerlaunch.dart';
import 'package:e_commerce_app/seller/sellerlaunch/view/sellerlaunch.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with TickerProviderStateMixin {
  final Color startColor = Color.fromARGB(255, 199, 225, 247);
  final Color endColor = Color.fromARGB(255, 21, 79, 126);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background container
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6076e0),
                  Color(0xFF60ade0),
                  Color(0xFF76b8e3),
                  Color(0xFF8fc7eb)
                ],
              ),
            ),
          ),

          // Animated background with particles
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                options: const ParticleOptions(
              spawnMaxRadius: 20,
              spawnMinSpeed: 10.00,
              particleCount: 68,
              spawnMaxSpeed: 50,
              minOpacity: 0.3,
              spawnOpacity: 0.4,
              baseColor: Color.fromARGB(255, 199, 225, 247),
              // image: Image(image: AssetImage('assets/images/sell.jpeg'))
            )),
            vsync: this,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: Color.fromARGB(255, 4, 66, 124),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomerLaunch(),
                              ));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_2_rounded, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              'Customer',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: Color.fromARGB(255, 4, 66, 124),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SellersLaunch(),
                              ));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.sell_rounded, color: Colors.white),
                            Text(
                              'Seller',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
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
















// import 'package:e_commerce_app/customer/customerlaunch/view/customerlaunch.dart';
// import 'package:e_commerce_app/seller/sellerlaunch/view/sellerlaunch.dart';
// import 'package:flutter/material.dart';

// class LaunchScreen extends StatelessWidget {
//   const LaunchScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0)),
//                     backgroundColor: Color.fromARGB(255, 4, 66, 124),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CustomerLaunch(),
//                         ));
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.person_2_rounded, color: Colors.white),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'Customer',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0)),
//                     backgroundColor: Color.fromARGB(255, 4, 66, 124),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SellersLaunch(),
//                         ));
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.sell_rounded, color: Colors.white),
//                       Text(
//                         'Seller',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

 