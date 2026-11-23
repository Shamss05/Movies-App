import 'package:flutter/material.dart';

import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key,});
  static const String routeName = 'onBoarding_screen';


  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      imagePath: 'assets/Movies Posters Group.png',
      title: 'Find Your Next\nFavorite Movie Here',
      description: 'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      primaryButtonText: 'Explore Now',
      gradientColors:[Color(0xFF1E1E1E).withValues(alpha: 0),
        Color(0xFF121312).withValues(alpha: .5),
        Color(0xFF121312).withValues(alpha: .91),
        Color(0xFF121312),] ,


    ),
    OnboardingData(
      imagePath: 'assets/xl_Avengures .png',
      title: 'Discover Movies',
      description: 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      primaryButtonText: 'Next',
     gradientColors: [  Color(0xFF084250).withValues(alpha:0 ), Color(0xFF084250),],
    ),
    OnboardingData(
      imagePath: 'assets/The Godfather 1.png',
      title: 'Explore All Genres',
      description: 'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      primaryButtonText: 'Next',
      gradientColors: [Color(0xFF85210E).withValues(alpha: 0),Color(0xFF85210E),]
    ),
    OnboardingData(
      imagePath: 'assets/xl_bad-boys-ride-or-die-movie-poster_591dcde0 1.png',
      title: 'Create Watchlists',
      description: 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      primaryButtonText: 'Next',
      gradientColors: [Color(0xFF4C2471).withValues(alpha: 0),Color(0xFF4C2471),]
    ),
    OnboardingData(
      imagePath: 'assets/xl_Dr .png',
      title: 'Rate, Review, and Learn',
      description: "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      primaryButtonText: 'Next',
      gradientColors: [Color(0xFF601321).withValues(alpha: 0), Color(0xFF601321),],
    ),
    OnboardingData(
      imagePath: 'assets/1917_-_Sam_Mendes_-_Hollywood_War_Film_Classic_English_Movie_Poster_9ef86295-4756-4c71-bb4e-20745c5fbc1a 1.png',
      title: 'Start Watching Now',
      description: '',
      primaryButtonText: 'Finish',
      gradientColors: [Color(0xFF2A2C30).withValues(alpha: 0), Color(0xFF2A2C30),]
    ),
  ];

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = _pages[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                _pages[index].imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: _pages[_currentIndex].gradientColors
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(46),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: .center,
                children: [

                  Text(
                    currentItem.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),


                  Text(
                    currentItem.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: _nextPage,
                    child: Text(currentItem.primaryButtonText),
                  ),


                  if (_currentIndex > 0) ...[
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: _previousPage,
                      child: const Text('Back'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}