import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/view_models/main/home_view_model.dart';
import 'package:flutterpokemon/widgets/main/load_more_button.dart';
import 'package:flutterpokemon/widgets/main/pokemon_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late var homeViewModel = HomeViewModel(context);

  @override
  void initState() {
    super.initState();
    homeViewModel.getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 50,
        width: 140,
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pokemon_logo.png")
          )
        ),
      );
    }

    Widget renderList(PokemonModel pokemon) {
      return GridView.count(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: 32
        ),
        crossAxisCount: 2,
        childAspectRatio: 70 / 50,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: pokemon.results!.map((pokemon) {
          return PokemonCard(pokemon: pokemon);
        }).toList(),
      );
    }

    void stateListener(GetPokemonState state) {
      if (state is GetPokemonFailed) {
        showGLobalAlert('danger', "Failed to get Pokemon Data", context);
      }
      if (state is GetPokemonExtendFailed) {
        showGLobalAlert('danger', "Failed to load more Pokemon Data", context);
      }
    }

    Widget onGetLoading(GetPokemonLoading state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: infoColor,
            ),
            SizedBox(height: 12),
            Text(
              "Loading Pokemon Data ...",
              style: medium.black.semiBold,
            ),
            Text(
              "${state.count} / 20",
              style: regular.black.semiBold,
            )
          ],
        )
      );
    }

    Widget onGetFailed(GetPokemonFailed state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Failed to get Pokemon Data",
              style: base.semiBold.copyWith(color: errorColor),
            ),
            SizedBox(
              height: 12,
            ),
            LoadMoreButton(
              title: "Try Again",
              color: errorColor,
              onPress: () {
                this.homeViewModel.getAllPokemons();
              }
            ),
          ],
        )
      );
    }

    Widget onGetSuccess(GetPokemonSuccess state) {
      if (state.pokemon.results != null) {
        return SingleChildScrollView(
          child: Column(
            children: [
              renderList(state.pokemon),
              LoadMoreButton(
                onPress: () {
                  this.homeViewModel.extendPokemons(state.pokemon);
                },
              ),
              SizedBox(height: 32)
            ],
          ),
        );
      }
      return Container();
    }

    Widget onExtendLoading(GetPokemonExtendsLoading state) {
      if (state.pokemon.results != null) {
        return SingleChildScrollView(
          child: Column(
            children: [
              renderList(state.pokemon),
              CircularProgressIndicator(
                color: infoColor,
              ),
              SizedBox(height: 12),
              Text(
                "Loading More Pokemon Data ...",
                style: medium.black.semiBold,
              ),
              Text(
                "${state.extendCount} / 20",
                style: regular.black.semiBold,
              ),
              SizedBox(height: 32)
            ],
          ),
        );
      }
      return Container();
    }

    Widget onExtendFailed(GetPokemonExtendFailed state) {
      if (state.pokemon.results != null) {
        return SingleChildScrollView(
          child: Column(
            children: [
              renderList(state.pokemon),
              LoadMoreButton(
                title: "Try Load More Again",
                color: errorColor,
                onPress: () {
                  this.homeViewModel.extendPokemons(state.pokemon);
                },
              ),
              SizedBox(height: 32)
            ],
          ),
        );
      }
      return Container();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: whiteColor,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              Expanded(
                child: BlocConsumer<GetPokemonCubit, GetPokemonState>(
                  listener: (context, state) {
                    stateListener(state);
                  },
                  builder: (context, state) {
                    if (state is GetPokemonLoading) return onGetLoading(state);
                    if (state is GetPokemonFailed) return onGetFailed(state);
                    if (state is GetPokemonSuccess) return onGetSuccess(state);
                    if (state is GetPokemonExtendsLoading) return onExtendLoading(state);
                    if (state is GetPokemonExtendFailed) return onExtendFailed(state);

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
