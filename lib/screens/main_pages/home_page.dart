import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';
import 'package:flutterpokemon/services/pokemon_services.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/view_models/main/home_view_model.dart';
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
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(24),
                    child: Text(
                      "Pokedex",
                      style: extra.black.semiBold,
                    )),
                BlocConsumer<GetPokemonCubit, GetPokemonState>(
                  listener: (context, state) {
                  },
                  builder: (context, state) {
                    if (state is GetPokemonLoading) {
                      return Expanded(child: CircularProgressIndicator());
                    }

                    // if (state is GetPokemonSuccess) {
                    //   if (state.pokemon.results != null) {
                    //     return Container(
                    //       child: Column(
                    //         children: [
                    //           GridView.count(
                    //             padding: EdgeInsets.only(
                    //             left: 24, right: 24, top: 16, bottom: 32),
                    //             crossAxisCount: 2,
                    //             childAspectRatio: 50/50,
                    //             mainAxisSpacing: 12,
                    //             crossAxisSpacing: 12,
                    //             physics: NeverScrollableScrollPhysics(),
                    //             shrinkWrap: true,
                    //             children: state.pokemon.results!.map((bantuan) {
                    //               return PokemonCard();
                    //             }).toList(),
                    //           )
                    //         ],
                    //       ),
                    //     );
                    //   }
                    // }

                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
