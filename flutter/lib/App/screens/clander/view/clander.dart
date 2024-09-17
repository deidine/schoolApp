import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/App/screens/base_screen/view/base_screen.dart';
import 'package:school/App/widgets/search_field.dart';
import 'package:school/App/widgets/empty_view.dart';
import 'package:school/App/core/enums/enums.dart';
import '../bloc/clander_bloc.dart';
import 'list_item_view.dart';
import 'loading_view.dart';

class Clander extends StatefulWidget {
  const Clander({super.key});

  @override
  State<Clander> createState() => _ClanderState();
}

class _ClanderState extends State<Clander> {
  final TextEditingController searchController = TextEditingController();
  
  

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  void init() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      BlocProvider.of<ClanderBloc>(context).add(FetchInitialData());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SearchField(
              searchController: searchController,
              onTextChange: (text) {
                BlocProvider.of<ClanderBloc>(context).add(SearchData(query: text));
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<ClanderBloc, ClanderState>(
                
                builder: (context, state) {
                  if (state.currentState == ActivityState.loading) {
                    return const LoadingView();
                  }
                  if (state.currentState == ActivityState.empty) {
                    return const EmptyView();
                  }
                  return ListView.separated(
                    itemCount: 25,
                    itemBuilder: (context, index) => ListItemView(onTap: () {}),
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}