import 'package:navnny_vanny/screens/book_nanny.dart';
import 'package:navnny_vanny/screens/how_it_works.dart';
import 'package:navnny_vanny/screens/mainPage.dart';
import 'package:navnny_vanny/screens/my_profile.dart';
import 'package:navnny_vanny/screens/support.dart';
import 'package:navnny_vanny/screens/why_nanny_vanny.dart';

import '../screens/my_bookings.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => MainPage());
    register<BookNanny>(() => BookNanny());
    register<HowItWorks>(() => HowItWorks());
    register<WhyNannyVanny>(() => WhyNannyVanny());
    register<MyBookings>(() => MyBookings());
    register<MyProfile>(() => MyProfile());
    register<Support>(() => Support());
  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}
