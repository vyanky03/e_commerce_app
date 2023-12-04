import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/model/ad_banner.dart';
import 'package:e_commerce_app/view/home/components/caraousel_slider/banner_card.dart';
import 'package:flutter/material.dart';

class CaraouselSliderView extends StatefulWidget {
  final List<AdBanner> bannerList;
  const CaraouselSliderView({super.key, required this.bannerList});

  @override
  State<CaraouselSliderView> createState() => _CaraouselSliderViewState();
}

class _CaraouselSliderViewState extends State<CaraouselSliderView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    _bannerList = widget.bannerList
        .map((e) => BannerCard(
              imageUrl: e.image,
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _bannerList,
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.bannerList.map(
            (e) {
              int index = widget.bannerList.indexOf(e);
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color.fromRGBO(0, 0, 0, 0.9)
                      : const Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
