import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/plugin/position.dart';

class HomeScreenV2 extends StatelessWidget {
  const HomeScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Position position = await determinePosition();
          context.read<WeatherBloc>().add(FetchWeather(position));
        },
        child: ListView(
          children: [
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherSuccess) {
                return Column(
                  children: [
                    // const SizedBox(
                    //   height: 100,
                    // ),
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      '${state.weather.areaName}',
                      style: GoogleFonts.michroma(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    _getWeatherIcon(state.weather.weatherConditionCode,
                        state.weather.weatherIcon),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      '${state.weather.temperature!.celsius!.round()}°C',
                      style: GoogleFonts.michroma(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      '${state.weather.weatherDescription}',
                      style: GoogleFonts.michroma(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Stack(
                    children: [
                      // appBackground(),
                      Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _getWeatherIcon(int? code, String? wcode) {
    List<String> weatherCode = [
      '01d',
      '01n',
      '02d',
      '02n',
      '11d',
      '13d',
      '10d',
      '09d'
    ];

    if (weatherCode.contains(wcode)) {
      return _weatherCodeV2(wcode);
    } else {
      return _weatherIcon(code);
    }
  }

  Widget _weatherIcon(int? code) {
    ///{
    ///210,211,212,221: thunderstorm-storm.json,
    ///230,231,232: thunderstorm with rain-thunder_shower.json,
    ///600-622: snow-snow.json,
    ///701: mist-mist.json,
    ///741: fog-foggy.json,
    ///801-804: clouds-windy.json,
    ///}
    switch (code) {
      case == null:
        return Lottie.asset('assets/animations/sunny.json');
      case >= 210 && < 222:
        return Lottie.asset('assets/animations/storm.json');
      case >= 230 && < 300:
        return Lottie.asset('assets/animations.thunder_shower.json');
      // case >= 300 && < 400:
      //   return Image.asset('assets/animations.thunder_shower.json');
      // case >= 500 && < 600:
      //   return Image.asset('assets/3.png');
      case >= 600 && < 623:
        return Lottie.asset('assets/animations/snow.json');
      case == 701:
        return Lottie.asset('assets/animations/mist.json');
      case == 741:
        return Lottie.asset('assets/animations/foggy.json');
      // case >= 700 && < 800:
      //   return Image.asset('assets/5.png');
      case > 800 && <= 804:
        return Lottie.asset('assets/animations/windy.json');

      default:
        return Lottie.asset('assets/animations/sunny.json');
    }
  }

  Widget _weatherCodeV2(String? wcode) {
    //['01d','01n','02d','02n','11d','13d','10d','09d'];
    //[sunny, night, partly-cloudy, cloudy-night, storm, snow, partly-shower, rainy-night]
    switch (wcode) {
      case == null:
        return Lottie.asset('assets/animations/sunny.json');
      case '01d':
        return Lottie.asset('assets/animations/sunny.json');
      case '01n':
        return Lottie.asset('assets/animations/night.json');
      case '02d':
        return Lottie.asset('assets/animations/partly-cloudy.json');
      case '02n':
        return Lottie.asset('assets/animations/cloudy-night.json');
      case '11d':
        return Lottie.asset('assets/animations/storm.json');
      case '13d':
        return Lottie.asset('assets/animations/snow.json');
      case '10d':
        return Lottie.asset('assets/animations/partly-shower.json');
      case '09d':
        return Lottie.asset('assets/animations/rainy-night.json');

      default:
        return Lottie.asset('assets/animations/sunny.json');
    }
  }
}
