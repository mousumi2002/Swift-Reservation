import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/auth_cubit.dart';
import '../../../auth/auth_state.dart';
import '../../../auth/presentation/pages/login_page.dart';
import 'home_page.dart';

class AppHomepage extends StatefulWidget {
  const AppHomepage({super.key});

  @override
  State<AppHomepage> createState() => _AppHomepageState();
}

class _AppHomepageState extends State<AppHomepage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if(state.isSignedIn){
          return const HomePage();
        }
        else {
          return const LoginPage();
        }
      },
      buildWhen: (previous, current) => previous.isSignedIn != current.isSignedIn,
    );
  }
}
