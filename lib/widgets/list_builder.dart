import 'package:Workit/providers/work_provider.dart';
import 'package:Workit/widgets/big_card.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fromProvider =
        Provider.of<WorkProvider>(context, listen: false).items;
    return ListView.builder(
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: fromProvider[index],
        child: BigCard(),
      ),
      itemCount: fromProvider.length,
    );
  }
}
