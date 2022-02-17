import 'package:anime_facts_bloc/modules/anime_list/presenter/bloc/states/anime_state.dart';
import 'package:anime_facts_bloc/modules/anime_list/presenter/cubit/anime_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FactPageCubit extends StatefulWidget {
  final String? animeName;
  const FactPageCubit({Key? key, this.animeName}) : super(key: key);

  @override
  State<FactPageCubit> createState() => _FactPageCubitState();
}

class _FactPageCubitState extends State<FactPageCubit> {
  @override
  void initState() {
    Modular.get<AnimeControllerCubit>().getFactList(anime: widget.animeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.get<AnimeControllerCubit>().getAnimeList();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.animeName!),
        ),
        body: BlocBuilder<AnimeControllerCubit, AnimeState>(
          bloc: Modular.get<AnimeControllerCubit>(),
          builder: (context, state) {
            if (state is SuccessFactState) {
              return ListView.builder(
                itemCount: state.facts.length,
                itemBuilder: (context, index) {
                  final fact = state.facts[index];

                  return Container(
                    margin: const EdgeInsetsDirectional.all(20),
                    child: Text(fact.fact!),
                  );
                },
              );
            }
            if (state is LoadingAnimeState) {
              return const Center(
                child: CircularProgressIndicator(),
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
