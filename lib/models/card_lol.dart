import 'package:flutter/material.dart';

class CardChampData {
  final String title;
  final String subtitile;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  const CardChampData({
    required this.title,
    required this.subtitile,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.background

  });
}

class CardChamp extends StatelessWidget {
  const CardChamp({required this.data, super.key});

  final CardChampData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(data.background != null) data.background!,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Text(
                data.title.toUpperCase(),
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              Spacer(flex: 5,),
              Flexible(
                flex: 20, 
                child: Image(image: data.image),
                ),              
              Spacer(flex: 5,),
              Text(
                data.subtitile,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              Spacer(flex: 12,),
            ],
          ),
        ),
      ],
    );
  }
}
