import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'cubit/ad_helper.dart';







class AdBanner2 extends StatefulWidget {
  final String urlADSbanner;

   AdBanner2( this.urlADSbanner) ;
  @override
  _AdBanner2State createState() => _AdBanner2State();
}

class _AdBanner2State extends State<AdBanner2> {


  BannerAd bannerAd;
  bool isAdReady = false;

  final AdSize _adSize = AdSize.banner;

  void _creatBannerAd() {
    bannerAd = BannerAd(
      size: _adSize,
      adUnitId: '${widget.urlADSbanner}',
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdReady = true;
            });
          }
      ),
      request: const AdRequest(),
    );


    bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _creatBannerAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bannerAd.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (isAdReady) {
      return Container(
        alignment: Alignment.center,
        width: _adSize.width.toDouble(),
        height: _adSize.height.toDouble(),
        child: AdWidget(ad: bannerAd,),
      );
    }
    return Container();
  }
}
