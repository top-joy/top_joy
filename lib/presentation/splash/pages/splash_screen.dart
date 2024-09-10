import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/core/navigation/app_router.gr.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/src/gen/assets.gen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _ballController;
  late final Animation<double> _ballAnimation;
  late final Animation<double> _ballRotation;
  late final AnimationController _textController;
  late final Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _isRegistor();

    _ballController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _ballAnimation = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(parent: _ballController, curve: Curves.bounceOut),
    );

    _ballRotation = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(parent: _ballController, curve: Curves.easeInOut),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _textAnimation =
        CurvedAnimation(parent: _textController, curve: Curves.easeIn);

    _ballController.forward();
    Future.delayed(
      const Duration(seconds: 2),
      () => _textController.forward(),
    );

    Future.delayed(
      const Duration(seconds: 4),
      () {
        context.router.replace(const MainRoute());
      },
    );
  }

  Future<void> _isRegistor() async {
    bool registor = false;
    SharedPreferences sharedPreferences = getIt<SharedPreferences>();
    registor = sharedPreferences.getBool('isRegistor') ?? false;
    if (registor) {
    } else {
      sharedPreferences.setBool('isRegistor', false);
    }
  }

  @override
  void dispose() {
    _ballController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent.shade100,
            Colors.blueAccent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _ballAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _ballAnimation.value),
                    child: Transform.rotate(
                      angle: _ballRotation.value,
                      child: Assets.images.soccer.image(
                        height: 120,
                        width: 120,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: _textAnimation,
                child: const Column(
                  children: [
                    Text(
                      'TopJoy',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sevimli stadioningizni band qiling!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black38,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
