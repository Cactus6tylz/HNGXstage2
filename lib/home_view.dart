import 'cv_model.dart';
import 'package:flutter_application_1/editing_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required String title});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Cv cv = Cv(
      fullName: 'EZE UGOCHUKWU MICHEAL',
      slackUsername: 'Ugochukwu Micheal',
      githubHandle: 'Cactus6tylz',
      myBio:
          'I am a mobile developer experienced in dart and flutter framework, passionate about building creative and reponsive mobile apps across devices and making impact in my immediate surroundings with my skills ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.white60,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Full Name: ${cv.fullName}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('Slack Username: ${cv.slackUsername}',
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('GitHub Handle: ${cv.githubHandle}',
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    Text(
                      'Bio: ${cv.myBio}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Center(
                      child: Builder(
                        builder: (BuildContext context) {
                          return ElevatedButton(
                            onPressed: () async {
                              final updatedCv = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditingView(cv: cv),
                                ),
                              );
                              if (updatedCv != null) {
                                setState(() {
                                  cv = updatedCv;
                                });
                              }
                            },
                            child: const Text(
                              'Edit My CV',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    ),
                    //   ),
                    // ],
                  ])),
        ),
      ),
    );
  }
}
