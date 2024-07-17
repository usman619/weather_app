import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/plugin/position.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/widget/app_background.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: determinePosition(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BlocProvider(
                  create: (context) => WeatherBloc()
                    ..add(
                      FetchWeather(snapshot.data as Position),
                    ),
                  child: const HomeScreen(),
                );
              } else {
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
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        40, 1.2 * kToolbarHeight, 40, 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          appBackground(),
                          const Center(
                            child: CupertinoActivityIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }));
  }
}
