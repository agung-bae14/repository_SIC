part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const PRESENSI = _Paths.PRESENSI;
  static const PROFILE = _Paths.PROFILE;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const LEAVE = _Paths.LEAVE;
  static const REQ_LEAVE = _Paths.REQ_LEAVE;
  static const OVERTIME = _Paths.OVERTIME;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/';
  static const LOGIN = '/login';
  static const PRESENSI = '/presensi';
  static const PROFILE = '/profile';
  static const EDIT_PROFILE = '/edit-profile';
  static const LEAVE = '/leave';
  static const REQ_LEAVE = '/req-leave';
  static const OVERTIME = '/overtime';
}