import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/language_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;

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
                languageProvider.changeLanguage(
                    language.languageCode == 'eng' ? 'hindi' : 'eng');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: language == null
          ? CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
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
              ),
            ),
      floatingActionButton: RaisedButton(
        child: Text('Change Language'),
        onPressed: () {
          languageProvider
              .changeLanguage(language.languageCode == 'eng' ? 'hindi' : 'eng');
        },
      ),
    );
  }
}
