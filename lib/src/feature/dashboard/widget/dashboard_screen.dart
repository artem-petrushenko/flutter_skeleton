import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/common/widget/scaffold/logger_scaffold.dart';
import 'package:flutter_skeleton/src/feature/dashboard/bloc/pokemon_bloc.dart';
import 'package:flutter_skeleton/src/feature/initialization/widget/dependencies_scope.dart';

/// {@template dashboard_screen}
/// Protected screen, visible to authenticated users only.
/// {@endtemplate}
class DashboardScreen extends StatefulWidget {
  /// {@macro dashboard_screen}
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final PokemonBloc _pokemonBloc;

  @override
  void initState() {
    _pokemonBloc = PokemonBloc(DependenciesScope.of(context).pokemonRepository);
    super.initState();
  }

  void _loadPokemons({Completer? completer}) {
    _pokemonBloc.add(PokemonEvent.load(completer: completer));
  }

  @override
  Widget build(BuildContext context) => LoggerScaffold(
        body: RefreshIndicator(
          onRefresh: () {
            final completer = Completer();
            _loadPokemons(completer: completer);
            return completer.future;
          },
          child: BlocBuilder<PokemonBloc, PokemonState>(
            bloc: _pokemonBloc,
            builder: (context, state) => CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('Dashboard'),
                ),
                if (state.isIdle)
                  SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No pokemons loaded'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _loadPokemons,
                          child: const Text('Load pokemons'),
                        ),
                      ],
                    ),
                  ),
                if (state.pokemons.isNotEmpty)
                  SliverList.builder(
                    itemCount: state.pokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = state.pokemons[index];
                      return ListTile(
                        title: Text(pokemon.name),
                        subtitle: Text(pokemon.type),
                      );
                    },
                  ),
                if (state.isLoading)
                  const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
