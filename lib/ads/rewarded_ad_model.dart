
import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_helper.dart';






class AdRewarded{


//static RewardedAd _rewardedAd;
//static bool _isAdReady = false;
//static bool adShowed = false;
//
//
//
//    static void loadAd(){
//      adShowed =false;
//
//  RewardedAd.load(
//    adUnitId: AdHelper.rewardedAdUnitId,
//    request:  const AdRequest(),
//    rewardedAdLoadCallback: RewardedAdLoadCallback(
//        onAdLoaded: (ad){
//          _rewardedAd = ad;
//          _isAdReady = true;
//        },
//        onAdFailedToLoad: (error){
//          log("failed to load rewarded ad: ${error.message}");
//        },
//    ),
//  );
//}
//
//
//static void showAd (){
//   if(_isAdReady){
//     _rewardedAd.show(
//         onUserEarnedReward: (ad , rewaredItem){
//           log("rewarded item type = ${rewaredItem.type}");
//           log("rewarded item amount = ${rewaredItem.amount}");
//
//           adShowed = true;
//         }
//     );
//   }
//
//   _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
//     onAdDismissedFullScreenContent: (ad){
//       log("ad dismissed");
//       ad.dispose();
//
//     } ,
//     onAdFailedToShowFullScreenContent: (ad , error){
//       ad.dispose();
//     }
//   );
//
//
//
//}


}