


import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:library_app/ads/cubit/ad_helper.dart';

class  Adinterstitial {



    static InterstitialAd interstitialAd ;
    static bool isAdReady = false ;

    static void loadInterstitialAd(String load){

      InterstitialAd.load(
          adUnitId: load,
          request: const AdRequest(),

          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              isAdReady = true;
              interstitialAd = ad ;

            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error');
            },
          ));



    }



   static void showInterstitialAd() {
     if (isAdReady) {
       interstitialAd.show();
     }

   }

}