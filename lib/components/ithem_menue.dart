import 'package:flutter/material.dart';
import 'package:ghazaoman/style/app_colors.dart';

class IthemMenue extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final String image;
  final Duration duration;
  final Object tag;
  const IthemMenue(
      {super.key,
      required this.ontap,
      required this.text,
      required this.image,
      required this.duration,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double _val, child) {
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(top: _val * 20),
            child: child,
          ),
        );
      },
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bg,
          ),
          child: Column(
            children: [
              Container(
                height: 99,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(90)),
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      image,
                      height: 119,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 13.2,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
