import 'package:get/get.dart';
import 'package:luxe_desires/app/modules/eventScreen/views/event_screen_view.dart';
import 'package:luxe_desires/app/modules/home/views/home_view.dart';
import 'package:luxe_desires/app/modules/musiclist/views/musiclist_view.dart';
import 'package:luxe_desires/app/modules/userprofile/views/userprofile_view.dart';
import 'package:luxe_desires/app/pages/ticket_screen.dart';

class MaindashboardController extends GetxController {
  var currentTab = 0.obs;

  final tabs = [
     HomeView(),
     TicketScreen(),
    const MusiclistView(),
    const UserprofileView(),
  ];



}
