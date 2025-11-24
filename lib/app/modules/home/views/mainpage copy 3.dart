// import 'package:flutter/material.dart';
// import 'dart:math';

// /// Half Circle
// class HalfCircleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(size.width / 2, size.height / 2);
//     path.arcTo(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       -pi / 2, // start
//       pi,      // 180° sweep
//       false,
//     );
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// /// Quarter Circle
// class QuarterCircleClipper extends CustomClipper<Path> {
//   final double startAngle;
//   QuarterCircleClipper(this.startAngle);

//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(size.width / 2, size.height / 2);
//     path.arcTo(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       startAngle,
//       pi / 2, // 90° sweep
//       false,
//     );
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
// class GreenHalfCircle extends StatelessWidget {
//   const GreenHalfCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 31.37,
//       left: 31.38,
//       child: Transform.rotate(
//         angle: -90 * pi / 180,
//         child: ClipPath(
//           clipper: HalfCircleClipper(),
//           child: Container(
//             width: 224.2693,
//             height: 224.2693,
//             color: Colors.green,
//           ),
//         ),
//       ),
//     );
//   } 
// }

// class YellowQuarterCircle extends StatelessWidget {
//   const YellowQuarterCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: -0,
//       left: -0,
//       child: Transform.rotate(
//         angle: -150 * pi / 180,
//         child: ClipPath(
//           clipper: QuarterCircleClipper(0),
//           child: Container(
//             width: 210.1,
//             height: 210.1,
//             color: Colors.yellow,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RedQuarterCircle extends StatelessWidget {
//   const RedQuarterCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 9.26,
//       left: 9.26,
//       child: Transform.rotate(
//         angle: 150 * pi / 180,
//         child: ClipPath(
//           clipper: QuarterCircleClipper(pi / 2),
//           child: Container(
//             width: 196.5458,
//             height: 196.5458,
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GreyCircle extends StatelessWidget {
//   const GreyCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 54.03,
//       left: 54.03,
//       child: Container(
//         width: 178.9506,
//         height: 178.9506,
//         decoration: BoxDecoration(
//           color: Colors.grey.withOpacity(0.1),
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }

// class WhiteCircle extends StatelessWidget {
//   const WhiteCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 79.6,
//       left: 79.6,
//       child: Container(
//         width: 127.8219,
//         height: 127.8219,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
class GreyCircle extends StatelessWidget {
  const GreyCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178.9506,
      height: 178.9506,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
    );
  }
}

class WhiteCircle extends StatelessWidget {
  const WhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127.8219,
      height: 127.8219,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class QuarterCircleClipper extends CustomClipper<Path> {
  final double startAngle;
  final double sweepAngle;
  QuarterCircleClipper(this.startAngle, this.sweepAngle);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, size.height / 2);
    path.arcTo(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
class GreenHalfCircle extends StatelessWidget {
  const GreenHalfCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(-pi / 2, pi), // 180°
      child: Container(
        width: 224.2693,
        height: 224.2693,      decoration: BoxDecoration( color: Colors.green,borderRadius: BorderRadius.circular(5)),
       
      ),
    );
  }
}
// class YellowArc extends StatelessWidget {
//   const YellowArc({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: QuarterCircleClipper(
//         -pi / 2 + pi + pi / 2, // start after red
//         pi / 3,                // 60° sweep (less than quarter)
//       ),
//       child: Container(
//         width: 210.1,
//         height: 210.1,
//         color: Colors.yellow,
//       ),
//     );
//   }
// }

// class RedQuarterCircle extends StatelessWidget {
//   const RedQuarterCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: QuarterCircleClipper(-pi / 2 + pi, pi / 2), // after green
//       child: Container(
//         width: 196.5458,
//         height: 196.5458,
//         color: Colors.red,
//       ),
//     );
//   }
// }

class RedQuarterCircle extends StatelessWidget {
  const RedQuarterCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(
        -pi / 2 + pi + pi / 3, // start after green + yellow
        pi / 2,                // keep 90° sweep
      ),
      child: Container(
        width: 196.5458,
        height: 196.5458,
            decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}

class YellowArc extends StatelessWidget {
  const YellowArc({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: QuarterCircleClipper(
        
        -pi / 2 + pi, // start right after green
        pi / 3,       // 60° sweep (unchanged)
      ),
      child: Container(
      decoration: BoxDecoration(   color: Colors.yellow,borderRadius: BorderRadius.circular(5)),  width: 210.1,
        height: 210.1,
     
      ),
    );
  }
}
