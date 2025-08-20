import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  // Benzin zapravavka ikoni
  static Widget gasStation({double size = 24, Color? color}) {
    return SvgPicture.string(
      '''<svg viewBox="0 0 24 24" fill="none">
        <path d="M4 20V4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v16M4 8h10M16 8v13a1 1 0 0 0 1 1 1 1 0 0 0 1-1V8a4 4 0 0 0-4-4h-1" stroke="currentColor" stroke-width="2"/>
      </svg>''',
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }

  // Parking ikoni
  static Widget parking({double size = 24, Color? color}) {
    return SvgPicture.string(
      '''<svg viewBox="0 0 24 24" fill="none">
        <path d="M6 3h6a3 3 0 0 1 0 6H6v6H4V3h2zm0 6h6a1 1 0 1 0 0-2H6v2z" fill="currentColor"/>
      </svg>''',
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }

  // Avtomobil servisi ikoni
  static Widget carService({double size = 24, Color? color}) {
    return SvgPicture.string(
      '''<svg viewBox="0 0 24 24" fill="none">
        <path d="M7 17a2 2 0 1 0 4 0 2 2 0 0 0-4 0zM13 17a2 2 0 1 0 4 0 2 2 0 0 0-4 0zM5 11V8a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3M5 11h14v4a2 2 0 0 1-2 2h-1m-8 0H7a2 2 0 0 1-2-2v-4" stroke="currentColor" stroke-width="2"/>
      </svg>''',
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}