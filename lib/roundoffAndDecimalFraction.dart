// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:intl/intl.dart';


// class RoundoffORdecimapFraction {
//   static String RoundoffORdecimapFractionConvertion({
//     required bool isQty,
//     required bool isPrice,
//     required double value,
//     required bool isNetTotal,
//     bool? hideCurrencySymbol,
//   }) {
//     String returnvalue = value.toString();
//     if (isQty == true) {
//       var model_qtydecimalvalue = Settings_generalSettings_controller
//           .model_quantitydecimalfraction!
//           .settingsData![0]
//           .settingsdata!
//           .qUANTITYDECIMALFRACTION!
//           .firstWhereOrNull((element) => element.active == true);
//       if (model_qtydecimalvalue == null) {
//         return value.toStringAsFixed(2);
//       } else {
//         return value.toStringAsFixed(
//             int.tryParse(model_qtydecimalvalue.name.toString()) ?? 2);
//       }
//     } else if (isPrice == true) {
//       if (isNetTotal == true) {
//         var model_currency_symbol = Settings_generalSettings_controller
//             .model_curencysymbol!.settingsData![0].settingsdata!.cURRENCYSYMBOL!
//             .firstWhereOrNull((element) => element.active == true);
//         var format = NumberFormat.simpleCurrency(
//             locale: Platform.localeName, name: model_currency_symbol!.code!);

//         var model_nettotalroundoff = Settings_generalSettings_controller
//             .model_billtotalroundoff!
//             .settingsData![0]
//             .settingsdata!
//             .bILLTOTALROUNDOFF!
//             .firstWhereOrNull((element) => element.active == true);
//         if (model_nettotalroundoff == null ||
//             model_nettotalroundoff.name == "OFF") {
//           //off
//           var model_pricedecimalfraction = Settings_generalSettings_controller
//               .model_pricedecimalfraction!
//               .settingsData![0]
//               .settingsdata!
//               .pRICEDECIMALFRACTION!
//               .firstWhereOrNull((element) => element.active == true);
//           if (model_pricedecimalfraction == null) {
//             if (hideCurrencySymbol ?? false) {
//               return value.toStringAsFixed(2);
//             } else {
//               return model_currency_symbol.position == 'L'
//                   ? '${format.currencySymbol}${value.toStringAsFixed(2)}'
//                   : '${value.toStringAsFixed(2)} ${format.currencySymbol}';
//             }
//           } else {
//             if (hideCurrencySymbol ?? false) {
//               return value.toStringAsFixed(
//                   int.tryParse(model_pricedecimalfraction.name.toString()) ??
//                       2);
//             } else {
//               return model_currency_symbol.position == 'L'
//                   ? '${format.currencySymbol}${value.toStringAsFixed(int.tryParse(model_pricedecimalfraction.name.toString()) ?? 2)}'
//                   : '${value.toStringAsFixed(int.tryParse(model_pricedecimalfraction.name.toString()) ?? 2)} ${format.currencySymbol}';
//             }
//           }
//         } else {
//           //on
//           if (hideCurrencySymbol ?? false) {
//             return value.round().toString();
//           } else {
//             return model_currency_symbol.position == 'L'
//                 ? '${format.currencySymbol}${value.round().toString()}'
//                 : '${value.round().toString()} ${format.currencySymbol}';
//           }
//         }
//       } else {
//         //not a net total
//         var model_pricedecimalfraction = Settings_generalSettings_controller
//             .model_pricedecimalfraction!
//             .settingsData![0]
//             .settingsdata!
//             .pRICEDECIMALFRACTION!
//             .firstWhereOrNull((element) => element.active == true);
//         if (model_pricedecimalfraction == null) {
//           return value.toStringAsFixed(2);
//         } else {
//           return value.toStringAsFixed(
//               int.tryParse(model_pricedecimalfraction.name.toString()) ?? 2);
//         }
//       }
//     }
//     return returnvalue;
//   }
// }
