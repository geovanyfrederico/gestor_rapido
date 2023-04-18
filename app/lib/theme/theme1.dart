import 'dart:ui';

import 'package:flutter/material.dart';
class Theme1 {
  Theme1._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color background = Color.fromRGBO(216, 247, 250, 1);

  /// Default colors
  static const Color primary = Color.fromRGBO(246, 168, 33, 1.0);
  static const Color primaryDark = Color.fromRGBO(0, 0, 0, 0.11372549019607843);
  static const Color darkGray = Color.fromRGBO(194, 194, 194, 1);
  static const Color blue = Color.fromRGBO(28, 132, 198, 1);     // Success colo)
  static const Color lazur = Color.fromRGBO(35, 198, 200, 1);   // Info colo)
  static const Color yellow = Color.fromRGBO(248, 172, 89, 1); // Warning colo)
  static const Color red = Color.fromRGBO(237, 85, 101, 1);   // Danger colo)
  // Various colors
  static const Color textColor = Color.fromRGBO(103, 106, 108, 1);  // Body tex
  static const Color gray = Color.fromRGBO(243, 243, 244, 1);       // Background wrapper colo)
  static const Color lightGray = Color.fromRGBO(209, 218, 222, 1);  // Default label, badg)
  static const Color labelBadgeColor = Color.fromRGBO(94, 94, 94, 1);
  static const Color lightBlue = Color.fromRGBO(243, 246, 251, 1);
  // Spinner color and margin
  static const Color spinColor = Color.fromRGBO(26, 179, 148, 1);
  // Basics
  static const Color basicLinkColor = Color.fromRGBO(51, 122, 183, 1);
  // IBOX colors ( default panel colors)
  static const Color borderColor = Color.fromRGBO(231, 234, 236, 1);     // IBox borde)
  static const Color cardTitleBg = Color.fromRGBO(255, 255, 255, 1);    // IBox Background header
  static const Color cardContentBg = Color.fromRGBO(255, 255, 255, 1);  // IBox Background content
  // Navigation
  static const Color navBg = Color.fromRGBO(47, 64, 80, 1);
  static const Color navTextColor = Color.fromRGBO(167, 177, 194, 1);
  static const Color navColor = Color.fromRGBO(165, 165, 167, 1);

 static TextStyle inputStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: primary
    );
  }

  // h1
  static TextStyle h1TextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 30,
    );
  }

// h2
  static TextStyle h2TextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 24,
    );
  }

// h3
  static TextStyle h3TextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

// h4
  static TextStyle h4TextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

// h5
  static TextStyle h5TextStyle() {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }

  // h6
  static TextStyle h6TextStyle() {
    return const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );
  }

  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: primary,
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    textStyle: const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );

  static final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    primary: primary,
    side: const BorderSide(color: primary),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  static final ButtonStyle linkButtonStyle = TextButton.styleFrom(
    foregroundColor: primary,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
}

