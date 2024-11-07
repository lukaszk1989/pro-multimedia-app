import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/data/model/grid_item_model.dart';

class GridItemWidget extends StatelessWidget {
  final GridItemModel gridItem;

  const GridItemWidget({super.key, required this.gridItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: gridItem.height ?? 200.0,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          if (gridItem.image != null)
            Image.asset(
              gridItem.image!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
          else
            Container(
              color: gridItem.backgroundColor ?? Colors.grey,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                width: double.infinity,
                color: Colors.white
                    .withOpacity(gridItem.leftTopIcon != null ? 0.0 : 0.2),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  gridItem.title,
                  style: TextStyle(
                    color: gridItem.textColor ?? Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (gridItem.rightTopIcon != null)
            Positioned(
              top: 8,
              right: 8,
              child: gridItem.rightTopIcon!,
            ),
          if (gridItem.leftTopIcon != null)
            Positioned(
              top: 8,
              left: 8,
              child: gridItem.leftTopIcon!,
            )
        ],
      ),
    );
  }
}
