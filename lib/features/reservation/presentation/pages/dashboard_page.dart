import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_reservation/features/reservation/bloc/dashboard_reservation_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => DashboardReservationCubit(),
            child: BlocBuilder<DashboardReservationCubit,
                DashboardReservationState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Weekly Data',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MetricCard(
                          title: 'Total\nReservations',
                          value: state.totalReservations.toString(),
                        ),
                        MetricCard(
                          title: 'Total\nPeople',
                          value: state.totalGuests.toString(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Card(
                      color: Colors.black,
                      margin: const EdgeInsets.all(10.0),
                      child: BarChart(dataSource: state.reservationsPerDay),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Tables remaining today: ${state.remainingTables}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  const MetricCard({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 125,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 20, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  const BarChart({super.key, required this.dataSource});

  final List<Map<String, dynamic>> dataSource;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryYAxis: const NumericAxis(
        labelStyle: TextStyle(color: Colors.white),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      title: const ChartTitle(
        text: 'Reservations Per Day',
        textStyle: TextStyle(color: Colors.white),
      ),
      primaryXAxis: const CategoryAxis(
        labelStyle: TextStyle(color: Colors.white),
      ),
      series: [
        ColumnSeries<Map<String, dynamic>, String>(
          dataSource: dataSource,
          xValueMapper: (data, _) => data['day'],
          yValueMapper: (data, _) => data['reservations'],
          color: Colors.blue,
          enableTooltip: true,
          name: 'Reservations',
        ),
      ],
    );
  }
}
