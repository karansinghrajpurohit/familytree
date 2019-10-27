import 'package:familytree/core/models/authentication/user_model.dart';
import 'package:familytree/core/models/family/family_model.dart';
import 'package:familytree/core/providers/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> dependentServices = [
  Provider(
    builder: (BuildContext context) => FirebaseAuthProvider(),
  ),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (BuildContext context) =>
        Provider.of<FirebaseAuthProvider>(context, listen: false).user,
  ),
  StreamProvider<FamilyModel>(
    builder: (BuildContext context) =>
        Provider.of<FirebaseAuthProvider>(context, listen: false).family,
  ),
];