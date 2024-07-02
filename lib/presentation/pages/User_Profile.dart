import 'package:flutter/material.dart';

import '../../Constants/Widgets/Custom_Appbar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomProfileAppBar("Profile"),
        body: ListView(
          children: [],
        ));
  }
}
