// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learen_3/features/auth/presentation/blocauth/bloc/auth_bloc.dart';
// import 'package:learen_3/features/auth/presentation/blocauth/bloc/auth_event.dart';
// import 'package:learen_3/features/auth/presentation/blocauth/bloc/auth_state.dart';




// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void _login() {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("يرجى ملء جميع الحقول")),
//       );
//       return;
//     }

//     context.read<AuthBloc>().add(LoginRequested(email: email, password: password));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is Authenticated) {
//             Navigator.pushReplacementNamed(context, '/home');
//           } else if (state is AuthError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const Text(
//                       "تسجيل الدخول",
//                       style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 32),
//                     TextField(
//                       controller: emailController,
//                       decoration: const InputDecoration(
//                         labelText: "البريد الإلكتروني",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     TextField(
//                       controller: passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: "كلمة المرور",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     ElevatedButton(
//                       onPressed: state is AuthLoading ? null : _login,
//                       child: state is AuthLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text("دخول"),
//                     ),
//                     const SizedBox(height: 16),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/register');
//                       },
//                       child: const Text("ليس لديك حساب؟ سجل الآن"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }