import 'package:client/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_repository/home_repository.dart';
import 'package:store/modules/home/bloc/home_bloc.dart';
import 'package:store/modules/home/view/widgets/all_product_widgets.dart';
import 'package:store/modules/home/view/widgets/best_product_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc(homeRepository: context.read<HomeRepository>())
            ..add(HomeEventStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Our Portofolio',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == GlobalStatusState.initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == GlobalStatusState.success) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BestProductWidget(
                          bestProduct: state.productModels?.bestProduct,
                        ),
                        const Text('All Product'),
                        const SizedBox(
                          height: 12,
                        ),
                        AllProductWidgets(
                          allProduct: state.productModels?.allProduct,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }

            if (state.status == GlobalStatusState.failed) {
              return Center(
                child: Text(state.message ?? ''),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
