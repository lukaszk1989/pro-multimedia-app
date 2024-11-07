import 'package:flutter/material.dart';

class FavouriteIcon extends StatefulWidget {
  final bool isFavourite;

  const FavouriteIcon({super.key, required this.isFavourite});

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  late bool _isFavourite;

  @override
  void initState() {
    _isFavourite = widget.isFavourite;
    super.initState();
  }

  void toggleFavouriteIcon() {
    setState(() {
      _isFavourite = !_isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toggleFavouriteIcon(),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              _isFavourite ? Colors.transparent : Colors.white.withOpacity(0.3),
          border: _isFavourite
              ? Border.all(
                  color: Colors.white,
                  width: 1,
                )
              : null,
        ),
        child: Icon(
          _isFavourite ? Icons.favorite : Icons.favorite_border,
          color: _isFavourite ? Colors.lightGreen : Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
