import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectionData {
  BuildContext context;
  Map<String, String> imageLabels = {};
  Map<String, String> menstrualLabels = {};
  Map<String, String> elasticityLabels = {};
  Map<String, String> colorLabels = {};
  SelectionData(this.context) {
    imageLabels = {
      'peak': AppLocalizations.of(context)!.peak,
      'peak_1': AppLocalizations.of(context)!.peak_1,
      'peak_2': AppLocalizations.of(context)!.peak_2,
      'peak_3': AppLocalizations.of(context)!.peak_3,
      'peak_p': AppLocalizations.of(context)!.peak_p,
      'g_peak_1': AppLocalizations.of(context)!.g_peak_1,
      'g_peak_2': AppLocalizations.of(context)!.g_peak_2,
      'g_peak_3': AppLocalizations.of(context)!.g_peak_3,
      'y_peak_1': AppLocalizations.of(context)!.y_peak_1,
      'y_peak_2': AppLocalizations.of(context)!.y_peak_2,
      'y_peak_3': AppLocalizations.of(context)!.y_peak_3,
      'red': AppLocalizations.of(context)!.red,
      'green': AppLocalizations.of(context)!.green,
      'yellow': AppLocalizations.of(context)!.yellow,
    };

    menstrualLabels = {
      "menstrual_h": AppLocalizations.of(context)!.menstrual_h,
      "menstrual_m": AppLocalizations.of(context)!.menstrual_m,
      "menstrual_l": AppLocalizations.of(context)!.menstrual_l,
      "menstrual_vl": AppLocalizations.of(context)!.menstrual_vl,
      "menstrual_b": AppLocalizations.of(context)!.menstrual_b,
    };

    elasticityLabels = {
      "0": AppLocalizations.of(context)!.elasticity_0,
      "2": AppLocalizations.of(context)!.elasticity_2,
      "2W": AppLocalizations.of(context)!.elasticity_2W,
      "4": AppLocalizations.of(context)!.elasticity_4,
      "6": AppLocalizations.of(context)!.elasticity_6,
      "8": AppLocalizations.of(context)!.elasticity_8,
      "10": AppLocalizations.of(context)!.elasticity_10,
      "10DL": AppLocalizations.of(context)!.elasticity_10DL,
      "10SL": AppLocalizations.of(context)!.elasticity_10SL,
      "10WL": AppLocalizations.of(context)!.elasticity_10WL,
    };
    colorLabels = {
      "color_b": AppLocalizations.of(context)!.color_b,
      "color_c": AppLocalizations.of(context)!.color_c,
      "color_ck": AppLocalizations.of(context)!.color_ck,
      "color_g": AppLocalizations.of(context)!.color_g,
      "color_k": AppLocalizations.of(context)!.color_k,
      "color_p": AppLocalizations.of(context)!.color_p,
      "color_r": AppLocalizations.of(context)!.color_r,
      "color_y": AppLocalizations.of(context)!.color_y,
    };
  }
}
