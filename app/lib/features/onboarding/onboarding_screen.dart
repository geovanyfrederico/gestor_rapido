import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isLastPage = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  // Initialize shared preferences
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Check if user has completed onboarding
    final hasCompletedOnboarding =
        _prefs.getBool('hasCompletedOnboarding') ?? false;
    if (hasCompletedOnboarding) {
      Modular.to.navigate('/entrar');
    }
  }

  // Update current page state
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
      if (_currentPage == 2) {
        _isLastPage = true;
      } else {
        _isLastPage = false;
      }
    });
  }

  // Navigate to home screen when onboarding is completed
  Future<void> _completeOnboarding() async {
    await _prefs.setBool('hasCompletedOnboarding', true);
    Modular.to.navigate('/registar');
  }

  // Build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
             OnboardingPage(
                imagePath: 'assets/images/ilustration/gr4.png',
                title: 'Bem vindo ao Gestor Rápido',
                description: 'Gerencie suas atividades comerciais de forma eficiente e sem complicações.',
              ),
              OnboardingPage(
                imagePath: 'assets/images/ilustration/gr2.png',
                title: 'Simplifique sua gestão',
                description: 'Deixe o trabalho pesado para o Gestor Rápido e tenha mais tempo para focar no crescimento de seus negócios.',
              ),
              OnboardingPage(
                imagePath: 'assets/images/ilustration/gr3.png',
                title: 'Comece agora',
                description: 'A organizar sua gestão de maneira simples e eficiente - vamos começar?',
              ),
            ],
          ),
          Positioned(
            bottom: 32.0,
            left: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.orange : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: _isLastPage
                ? TextButton(
                onPressed: _completeOnboarding,
                child:  Text('Começar',  style: TextStyle(
                    color: Colors.white
                )),

            )
                : TextButton(
              onPressed: () {
                _pageController.nextPage(
                  duration:
                  const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text('Avançar', style: TextStyle(
                  color: Colors.orange
              )),
            ),
          ),
          Positioned(
            top: 32.0,
            right: 16.0,
            child: TextButton(
              onPressed: () {
                Modular.to.navigate('/registar');
              },
              child: const Text('Finalizar',
              style: TextStyle(
                color: Colors.orange
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        SizedBox(height: 32.0),
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}

