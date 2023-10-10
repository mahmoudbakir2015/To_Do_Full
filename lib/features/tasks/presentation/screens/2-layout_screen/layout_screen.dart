import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/features/tasks/presentation/controller/view_cubit/view_cubit.dart';
import 'package:todo_application/features/tasks/presentation/controller/view_cubit/view_states.dart';
import 'package:todo_application/features/tasks/presentation/resources/color_manager.dart';
import 'package:todo_application/features/tasks/presentation/resources/routes_manager.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: _getBody(context),
      floatingActionButton: _getFloatinActionButton(context),
      bottomNavigationBar: _getBottomNavigattionBar(context),
    );
  }

  BlocBuilder _getBottomNavigattionBar(context) {
    return BlocBuilder<ViewCubit, ViewCubitStates>(builder: ((context, state) {
      return BottomNavigationBar(
        selectedItemColor: ColorManager.primary,
        currentIndex: ViewCubit.get(context).currentIndex,
        onTap: (int tapedIndex) {
          ViewCubit.get(context).bottomItemTaped(tapedIndex);
        },
        items: ViewCubit.get(context).items,
      );
    }));
  }

  AppBar _getAppBar(context) => AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        centerTitle: true,
        title: BlocBuilder<ViewCubit, ViewCubitStates>(
          builder: (context, state) {
            return Text(
              ViewCubit.get(context)
                  .titelsOfAppBar[ViewCubit.get(context).currentIndex],
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      );

  Widget _getBody(context) {
    return BlocBuilder<ViewCubit, ViewCubitStates>(
      builder: (context, state) {
        return ViewCubit.get(context)
            .screens[ViewCubit.get(context).currentIndex];
      },
    );
  }

  FloatingActionButton _getFloatinActionButton(context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.primary,
      onPressed: () {
        Navigator.pushNamed(context, RoutesNames.addTaskRoute);
      },
      child: Icon(
        Icons.add,
      ),
    );
  }
}
