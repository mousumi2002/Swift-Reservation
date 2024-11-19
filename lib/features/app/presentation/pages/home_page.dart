import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../auth/auth_cubit.dart';
import '../../../reservation/presentation/pages/create_reservation_page.dart';
import '../card_tile.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
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
        title: const Text('Hi User!'),
        actions: [
          StreamBuilder(stream: Stream.periodic(const Duration(seconds: 1)), builder: (context,snapshots){
            final time = DateFormat('hh:mm a').format(DateTime.now());
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(time),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardTile(title: 'Create Reservation', onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateReservationPage()));
            }, cardColor: Colors.blue),
            CardTile(title: 'Manage Reservation', onPressed: (){}, cardColor: Colors.amber),
            CardTile(title: 'Past Reservation', onPressed: (){}, cardColor: Colors.deepPurpleAccent),
          ],
        ),
      ),

    );
  }
}
