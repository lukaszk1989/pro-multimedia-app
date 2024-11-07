import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/config/constance/grid_items_list.dart';
import 'package:pro_multimedia_app/src/data/model/grid_item_model.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/grid_item_widget.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var items = GridItemsList.items;

    int midIndex = (items.length / 2).ceil();
    final List<GridItemModel> leftColumnItems = items.sublist(0, midIndex);
    final List<GridItemModel> rightColumnItems = items.sublist(midIndex);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: leftColumnItems.map((item) {
                  return GridItemWidget(gridItem: item);
                }).toList(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: rightColumnItems.map((item) {
                  return GridItemWidget(gridItem: item);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
