import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/custom_widgets/odoo_card.dart';
import '../../../bloc/timesheet_bloc.dart';
import '../../../bloc/timesheet_event.dart';
import '../../../bloc/timesheet_state.dart';

class OdooScreen extends StatelessWidget {
  const OdooScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String formatTime(int seconds) {
      final int minutes = seconds ~/ 60;
      final int remainingSeconds = seconds % 60;
      final String formattedMinutes = minutes.toString().padLeft(2, '0');
      final String formattedSeconds =
          remainingSeconds.toString().padLeft(2, '0');
      return '$formattedMinutes:$formattedSeconds';
    }

    return BlocProvider(
      create: (context) => TimeSheetBloc()..add(OddoList()),
      child: BlocBuilder<TimeSheetBloc, TimeSheetState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
              body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
/*
                        final taskTime = task['isRunning']
                            ? formatTime(state
                                .elapsedSeconds)
                            : task['time'];*/
                        final taskTime = formatTime(state
                            .elapsedSeconds);

                        return OdooCard(
                          title: task['title'],
                          subtitle: task['subtitle'],
                          deadline: task['deadline'],
                          time: taskTime,
                          onPressed: () {
                            if (task['isRunning']) {
                              context.read<TimeSheetBloc>().add(TimerPaused());
                            } else {
                              context.read<TimeSheetBloc>().add(TimerStarted());
                            }
                            context
                                .read<TimeSheetBloc>()
                                .add(OdooToggleList(index));
                          },
                          icon: task['isRunning']
                              ? const Icon(Icons.pause, color: Colors.grey)
                              : const Icon(Icons.play_arrow,
                                  color: Colors.grey),
                        );
                      })));
        },
      ),
    );
  }
}
