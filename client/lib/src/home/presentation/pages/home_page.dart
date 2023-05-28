import 'package:client/src/home/presentation/bloc/google_bloc.dart';
import 'package:client/src/home/presentation/widgets/list_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 88, vertical: 24),
                  child: Image.asset(
                    'assets/logo_google.png',
                  ),
                ),
                Container(
                  height: 36,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 16, bottom: 18),
                            hintText: 'Faça sua busca',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          onFieldSubmitted: (value) {
                            if (_searchController.text.isNotEmpty) {
                              setState(() {
                                context.read<GoogleBloc>().add(
                                    GetGoogle(search: _searchController.text));
                                _searchController.text = '';
                                FocusManager.instance.primaryFocus?.unfocus();
                              });
                            }
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_searchController.text.isNotEmpty) {
                            setState(() {
                              context.read<GoogleBloc>().add(
                                  GetGoogle(search: _searchController.text));
                              _searchController.text = '';
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          }
                        },
                        child: Container(
                          height: 36,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24)),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Text(
                              'Pesquisar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<GoogleBloc, GoogleState>(
                  builder: (context, state) {
                    return switch (state) {
                      GoogleStateEmpty() => const SizedBox.shrink(),
                      GoogleStateLoading() => const CircularProgressIndicator(),
                      GoogleStateError() => Text(state.error),
                      GoogleStateSuccess() => state.entity.isEmpty
                          ? const SizedBox.shrink()
                          : ListSearch(entity: state.entity),
                    };
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
