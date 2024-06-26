import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/shared/constants.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: whiteColor,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 140,
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/pokemon_logo.png")
                  )
                ),
              ),
              Expanded(
                child: BlocConsumer<GetPokemonCubit, GetPokemonState>(
                  listener: (context, state) {
                    if (state is GetPokemonFailed) {
                      showGLobalAlert('danger', "Gagal mengambil data pokemon", context);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetPokemonLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: infoColor,
                        )
                      );
                    }
                            
                    if (state is GetPokemonSuccess) {
                      if (state.pokemon.results != null) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              GridView.count(
                                padding: EdgeInsets.only(
                                left: 24, right: 24, top: 16, bottom: 32),
                                crossAxisCount: 2,
                                childAspectRatio: 70/50,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: state.pokemon.results!.map((pokemon) {
                                  return PokemonCard(pokemon: pokemon);
                                }).toList(),
                              ),
                              LoadMoreButton(
                                onPress: (){},
                              ),
                              SizedBox(height: 32)
                            ],
                          ),
                        );
                      }
                    }
                            
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
