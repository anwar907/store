import 'package:client/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_repository/home_repository.dart';
import 'package:store/modules/home/bloc/home_bloc.dart';

class FormProductWidgets extends StatelessWidget {
  FormProductWidgets({super.key, this.product});

  final Product? product;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = product?.name ?? '';
    desController.text = product?.description ?? '';
    return BlocProvider(
      create: (context) =>
          HomeBloc(homeRepository: context.read<HomeRepository>()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Create Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status == GlobalStatusState.success) {
              const snackBar = SnackBar(
                content: Text('Berhasil diupload'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product?.imageUrl ?? ''),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLines: 5,
                        controller: desController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: 'Description',
                          alignLabelWithHint: true,
                          hintStyle: const TextStyle(
                            textBaseline: TextBaseline.ideographic,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                HomeEventSubmit(
                                  description: desController.text,
                                  name: nameController.text,
                                  imageUrl: product?.imageUrl,
                                ),
                              );
                          // HomeBloc(homeRepository: context.read<HomeRepository>())
                          //     .add(
                          //   HomeEventSubmit(
                          //     description: desController.text,
                          //     name: nameController.text,
                          //     imageUrl: product?.imageUrl,
                          //   ),
                          // );
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(
                            Size(
                              MediaQuery.of(context).size.width / 1.5,
                              45,
                            ),
                          ),
                        ),
                        child: const Text('UPLOAD'),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
