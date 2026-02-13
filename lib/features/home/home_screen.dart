import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeCubit, HomeState>
              (buildWhen: (previous, current) => current is ChangeActiveIndexState,
                builder: (context, state)
            {
                return SizedBox(
                    height: 100,
                    child: ListView.separated(scrollDirection: Axis.horizontal, itemBuilder: (context, index)
                    {
                      return InkWell(onTap: ()
                      {
                        context.read<HomeCubit>().changeActiveIndex(index);
                        },
                          child: CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 30,
                              child: context.read<HomeCubit>().activeIndex == index ? Icon(Icons.check) : null
                          )
                      );
                    },
                        separatorBuilder: (context, index) => SizedBox(width: 10), itemCount: 15)
                );
              }
            ),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) => current is IncrementState || current is DecrementState,
                builder: (context, state)
            {
              print('Built');
                return Row(
                  spacing: 50,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){context.read<HomeCubit>().decrement();}, icon: Icon(Icons.remove, size: 50)),
                    Text(context.read<HomeCubit>().counter.toString(), style: TextStyle(fontSize: 50),),
                    IconButton(onPressed: (){context.read<HomeCubit>().increment();}, icon: Icon(Icons.add, size: 50))
                  ],
                );
              }
            )
          ]
        ),
      ),
    );
  }
}