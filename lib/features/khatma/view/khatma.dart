import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learen_3/features/auth/presentation/blocauth/bloc/auth_bloc.dart';
import 'package:learen_3/features/auth/presentation/blocauth/bloc/auth_event.dart';

class Khatma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          ),
          // Text("البريد: ${user.email ?? 'غير معرف'}")
        ],
      ),
      body: Center(child: Text("welcom"),),
      );
  }
}