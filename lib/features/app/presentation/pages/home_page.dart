import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:swift_reservation/features/app/bloc/navigator_cubit.dart';
import 'package:swift_reservation/features/reservation/presentation/pages/dashboard_page.dart';
import '../../../auth/auth_cubit.dart';
import '../../../reservation/presentation/pages/create_reservation_page.dart';
import '../../../reservation/presentation/pages/manage_reservation_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigatorBarCubit(),
      child: Builder(
        builder: (context) {
          final index = context.select<NavigatorBarCubit, NavigatorBarState>((cubit) => cubit.state).index;
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                    currentIndex: index,
                    onTap: (index) =>
                        context.read<NavigatorBarCubit>().navigateTo(index),
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.manage_accounts),
                        label: 'Manage Reservation',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add),
                        label: 'Create Reservation',
                      ),
                    ],
                  ),
              drawer: Drawer(
                child: ListView(
                  children: [
                    const DrawerHeader(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Text('Swift Reservation',style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                    ListTile(
                      title: const Text('Dashboard'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashboardPage()));
                      },
                    ),
                    ListTile(
                      title: const Text('Logout'),
                      onTap: () async {
                        context.read<AuthCubit>().logout();
                      },
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                title: Text(index == 1 ? 'Create Reservation' : 'Hi User!'),
                actions: [
                  StreamBuilder(
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshots) {
                        final time = DateFormat('hh:mm a').format(DateTime.now());
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(time),
                        );
                      }),
                ],
              ),
              body: BlocBuilder<NavigatorBarCubit, NavigatorBarState>(
                builder: (context, state) {
                  if (state.index == 0) {
                    return const ManageReservationPage();
                  } else {
                    return const CreateReservationPage();
                  }
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
