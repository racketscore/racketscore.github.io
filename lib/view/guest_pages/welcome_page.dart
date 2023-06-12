import 'package:flutter/material.dart';
import 'package:racketscore/view/guest_pages/sign_in_page.dart';

import '../base_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends BasePageState<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcfcfcf),
      appBar: null,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'How it works?',
                      ),
                      const Text(
                        'Welcome Page',
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildTeamsComponent(
                              teamA: "Bela, Tapia", teamB: "Galan, Lebron"),
                          SizedBox(
                            width: 20,
                          ),
                          _buildSetComponent(resultTeamA: 3, resultTeamB: 6),
                          SizedBox(
                            width: 20,
                          ),
                          _buildSetComponent(resultTeamA: 7, resultTeamB: 6),
                          SizedBox(
                            width: 20,
                          ),
                          _buildSetComponent(resultTeamA: 4, resultTeamB: 4),
                          SizedBox(
                            width: 20,
                          ),
                          _buildGameComponent(resultTeamA: 15, resultTeamB: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SignInPage()));
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTeamsComponent({required String teamA, required String teamB}) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teamA,
            style: TextStyle(
                fontSize: currentWidth < 600 ? 30 : 50,
                color: Color(0xff535f8e)),
          ),
          Text(teamB,
              style: TextStyle(
                  fontSize: currentWidth < 600 ? 30 : 50,
                  color: Color(0xff535f8e)))
        ],
      ),
    );
  }

  _buildSetComponent({required int resultTeamA, required int resultTeamB}) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xffedf3ff),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                resultTeamA.toString(),
                style: TextStyle(fontSize: currentWidth < 600 ? 30 : 50, color: Color(0xff535f8e)),
              ),
              Text(resultTeamB.toString(),
                  style: TextStyle(fontSize: currentWidth < 600 ? 30 : 50, color: Color(0xff535f8e)))
            ],
          ),
        ));
  }

  _buildGameComponent({required int resultTeamA, required int resultTeamB}) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xffbacbfd),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(resultTeamA.toString(),
                  style: TextStyle(fontSize: currentWidth < 600 ? 30 : 50, color: Color(0xff535f8e))),
              Text(
                resultTeamB.toString(),
                style: TextStyle(fontSize: currentWidth < 600 ? 30 : 50, color: Color(0xff535f8e)),
              )
            ],
          ),
        ));
  }
}
