import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/Authenticate/authentication.dart';
import 'package:provider/provider.dart';
import 'package:hospital/services/account.dart';
import 'package:hospital/pages/screen/profile/displayprofile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final user = Provider.of<Account>(context);

    return user != null ? DisplayProfile() : Authenticate();

  }

  @override
  // wantKeepAlive
  bool get wantKeepAlive => true;
}