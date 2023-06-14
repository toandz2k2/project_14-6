import 'dart:developer';

import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        if(state is CounterValueChangedState){
          if(state.counter > 10){
            const snackBar = SnackBar(
              content: Text('số quá lớn'),);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          else if (state.counter < 10){
              print(state.counter.toString());
          }
        }
      },
      child: Container(
        child: BlocBuilder<CounterBloc,CounterState>(
            builder: (context,state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(IncreamentEvent());
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(ResetEvent());
                    },
                    child: const Icon(Icons.exposure_zero),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(DecreamentEvent());
                      context.read<CounterBloc>().add(DecreamentEvent());
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              );
            }
        ),
      ),
    );
    // return BlocListener<CounterBloc,CounterState >(
    //   bloc: BlocProvider.of<CounterBloc>(context),
    //   listener: (BuildContext context, state) {
    //   print('hi');
    //   if(state.counter > 10){
    //     const snackBar = SnackBar(
    //         content: Text('Dang nhap thanh cong')
    //   }if
    //   },
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: <Widget>[
    //       ElevatedButton(
    //         onPressed: () {
    //           BlocProvider.of<CounterBloc>(context).add(IncreamentEvent());
    //         },
    //         child: const Icon(Icons.add),
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           BlocProvider.of<CounterBloc>(context).add(ResetEvent());
    //         },
    //         child: const Icon(Icons.exposure_zero),
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           //  BlocProvider.of<CounterBloc>(context).add(DecreamentEvent());
    //           context.read<CounterBloc>().add(DecreamentEvent());
    //         },
    //         child: const Icon(Icons.remove),
    //       ),
    //     ],
    //   ),
    // );
  }
}
