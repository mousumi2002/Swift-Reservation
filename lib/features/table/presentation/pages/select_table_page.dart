import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/table_cubit.dart';

class SelectTablePage extends StatefulWidget {
  final Map<String, dynamic> reservationData;

  const SelectTablePage({super.key, required this.reservationData});
  @override
  State<SelectTablePage> createState() => _SelectTablePageState();
}

class _SelectTablePageState extends State<SelectTablePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TableCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Table Selector")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TableCubit, TableState>(
            builder: (context, state) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: state.tables.length,
                itemBuilder: (context, index) {
                  final table = state.tables[index];
                  return GestureDetector(
                    onTap: () {
                      print(widget.reservationData);
                      context.read<TableCubit>().toggleTableSelection(
                          table.id, widget.reservationData);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: table.reservationData.isNotEmpty
                            ? Colors.red
                            : table.isSelected
                                ? Colors.green
                                : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: Center(
                        child: Text(
                          "Table ${table.id}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: table.reservationData.isEmpty
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
