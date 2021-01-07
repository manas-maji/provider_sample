import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:provider_sample/language.dart';
import 'package:provider_sample/riverpods.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Sample'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Theme.of(context).primaryColor,
            ),
            RaisedButton(
              child: Text('Change Language'),
              onPressed: () {
                _changeLanguage(context);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Consumer(
            builder: (context, watch, child) {
              AsyncValue<Language> value = watch(languageProvider);
              return value.when(
                  data: (language) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(language.firstName),
                          Divider(),
                          Text(language.lastName),
                          Divider(),
                          Text(language.dateOfBirth),
                          Divider(),
                          Text(language.country),
                          Divider(),
                          Text(language.state),
                          Divider(),
                          Text(language.city),
                          Divider(),
                          Text(language.emailId),
                          Divider(),
                          Text(language.postalAddress),
                          Divider(),
                          Text(language.pincode),
                          Divider(),
                          Text(language.panCard),
                          Divider(),
                          Text(language.voterId),
                          Divider(),
                          Text(language.home),
                          Divider(),
                          Text(language.scan),
                          Divider(),
                          Text(language.profile),
                          Divider(),
                          Text(language.notifications),
                          Divider(),
                          Text(language.myDashBoard),
                        ],
                      ),
                  loading: () => Center(child: Text('Loading..')),
                  error: (e, st) => Text(e.toString()));
            },
          ),
        ),
      ),
      floatingActionButton: RaisedButton(
        child: Text('Change Language'),
        onPressed: () {
          _changeLanguage(context);
        },
      ),
    );
  }

  void _changeLanguage(BuildContext context) {
    context.read(languageCodeProvider).changeLanguageCode(
        context.read(languageCodeProvider.state) == 'eng' ? 'hindi' : 'eng');
  }
}
