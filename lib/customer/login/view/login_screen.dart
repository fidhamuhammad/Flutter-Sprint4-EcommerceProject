import 'package:e_commerce_app/customer/home/home.dart';
import 'package:e_commerce_app/customer/signup/view/signup_screen.dart';
import 'package:e_commerce_app/launch/launch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final _auth = FirebaseAuth.instance;
        final userRef = await _auth.signInWithEmailAndPassword(
          email: _usernameController.text,
          password: _passwordController.text,
        );

        // Store login state
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        // Clear text fields
        _passwordController.clear();
        _usernameController.clear();

        // Navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "LakeStore",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LaunchScreen(),
                ));
          },
          icon: const Icon(
            Icons.sell_rounded,
            color: Color.fromARGB(255, 48, 48, 49),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6076e0),
                Color(0xFF60ade0),
                Color(0xFF76b8e3),
                Color(0xFF8fc7eb)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 170, 200, 245),
                        width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 205, 236, 248),
                    size: 120,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(10.0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.all(8.0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 7, 60, 104),
                  ),
                  onPressed: () => _login(context),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Not yet registered?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 39, 112, 172),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 7, 60, 104),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}












// import 'package:e_commerce_app/customer/home/home.dart';
// import 'package:e_commerce_app/customer/signup/view/signup_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Loginscreen extends StatefulWidget {
//   Loginscreen({super.key});
  
 

//   @override
//   State<Loginscreen> createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Text(
//           "LakeStore",
//           style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w400,
//               fontStyle: FontStyle.italic),
//         ),
//         leading: Icon(
//           Icons.shopping_basket_rounded,
//           color: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: ScrollPhysics(),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color(0xFF6076e0),
//               Color(0xFF60ade0),
//               Color(0xFF76b8e3),
//               Color(0xFF8fc7eb)
//             ],
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight
//             ),
//           ),
//           height: MediaQuery.of(context).size.height,
//           child: Form(
//             key: _formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
             
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color.fromARGB(255, 170, 200, 245), width: 2),
//                     shape: BoxShape.circle
//                   ),
//                   child: const Icon(Icons.person, color: Color.fromARGB(255, 205, 236, 248),size: 120,),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: TextFormField(
//                     controller: _usernameController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'please fill these field';
//                       }
//                     },
//                     decoration: InputDecoration(                    
//                         hintText: 'username',
//                         prefixIcon: Icon(Icons.person),
//                           // labelStyle: TextStyle(color: const Color.fromARGB(172, 158, 158, 158)),
//                         contentPadding: EdgeInsets.all(10.0),                     
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                         ),
//                         ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: TextFormField(
//                     controller: _passwordController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'please fill these filed';
//                       }
//                     },
//                     decoration: InputDecoration(                    
//                         hintText: 'password',
//                         prefixIcon: Icon(Icons.lock),
//                         // labelStyle: TextStyle(color: Colors.grey),
//                       contentPadding: EdgeInsets.all(8.0),                     
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue),
//                       ),
//                         ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 7, 60, 104),
//                     ),
//                     onPressed: () async {
//                       try {
//                         final _auth = FirebaseAuth.instance;
//                         final userRef = await _auth.signInWithEmailAndPassword(
//                             email: _usernameController.text,
//                             password: _passwordController.text);
//                         _passwordController.clear();
//                         _usernameController.clear();
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => HomeScreen(),
//                             ));
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text('inavalid username or password')));
//                       }
//                     },
//                     child: Text(
//                       'SignIn',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     )),
//                 Text(
//                   'not yet registerd?',
//                   style:
//                       TextStyle(color: const Color.fromARGB(255, 39, 112, 172)),
//                 ),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 7, 60, 104),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SignupScreen(),
//                           ));
//                     },
//                     child: Text(
//                       'SignUp',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
