import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/di/di.dart';
import 'package:untitled2/presentation/ui/screen/managers/States.dart';
import 'package:untitled2/presentation/ui/screen/managers/events.dart';
import 'package:untitled2/presentation/ui/screen/managers/view_model.dart';

class DemoScreen extends StatelessWidget {
  DemoScreen({super.key});

  final viewModel = getIt<ViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => viewModel,
        child: BlocBuilder<ViewModel, States>(
          builder: (context, state) {
            if(state is OnLoadingState){
              return Center(child: CircularProgressIndicator());
            }
            if (state is OnSuccessState) {
              return Center(child: Text(state.data));
            }
            return Center(
              child: ButtonView(
                onPress: () {
                  viewModel.onEvent(SafeApiCallEvent());
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget ButtonView({required VoidCallback onPress}) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text("Safe api call demo"),
    );
  }
}
