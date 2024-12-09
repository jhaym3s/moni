import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../core/config/image.dart';
import 'listing_item.dart';

typedef ListingModel = ({
  String address,
  String image,
  int mainAxis,
  int crossAxis
});

class Listings extends StatefulWidget {
  const Listings({
    super.key,
  });

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  bool _animateListings = false;

  static List<ListingModel> listings = [
    (
      address: 'Gladkova St., 25',
      image: AssetImages.rental1,
      mainAxis: 2,
      crossAxis: 1
    ),
    (
      address: 'Gubina St., 11',
      image: AssetImages.rental2,
      mainAxis: 1,
      crossAxis: 2
    ),
    (
      address: 'Trefoleva St., 43',
      image: AssetImages.rental3,
      mainAxis: 1,
      crossAxis: 1
    ),
    (
      address: 'Sedova St., 22',
      image: AssetImages.rental4,
      mainAxis: 1,
      crossAxis: 1
    )
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3500));
      if (mounted) {
        setState(() {
          _animateListings = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
        offset: _animateListings ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius:  BorderRadius.vertical(top: Radius.circular(30)),
            color: Colors.white,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: listings
                        .map(
                          (listing) => StaggeredGridTile.count(
                            crossAxisCellCount: listing.mainAxis,
                            mainAxisCellCount: listing.crossAxis,
                            child: ListingItem(
                              image: listing.image,
                              address: listing.address,
                              alignment: listing.mainAxis > listing.crossAxis
                                  ? Alignment.center
                                  : Alignment.centerLeft,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
