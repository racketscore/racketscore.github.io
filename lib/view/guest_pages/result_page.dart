import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import '../../model/models.dart';
import '../base_page.dart';

class ResultPage extends StatefulWidget {
  final String matchId;

  const ResultPage({super.key, required this.matchId});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends BasePageState<ResultPage> {
  List<MatchSetDto> _currentResult = [];

  @override
  void loadData() {
    super.loadData();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: null,
      body: Center(
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
                Text(
                 'match_name',
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTeamsComponent(
                        teamA: 'team_a_name',
                        teamB: 'team_b_name',),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                        children: _currentResult.map((matchSet) {
                      return _buildSetComponent(
                          resultTeamA: matchSet.teamAGames,
                          resultTeamB: matchSet.teamBGames);
                    }).toList()),
                    _buildGameComponent(resultTeamA: 15, resultTeamB: 30),
                  ],
                ),
              ],
            ),
          ),
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
            style: TextStyle(fontSize: 50, color: Color(0xff535f8e)),
          ),
          Text(teamB, style: TextStyle(fontSize: 50, color: Color(0xff535f8e)))
        ],
      ),
    );
  }

  Widget _buildSetComponent(
      {required int resultTeamA, required int resultTeamB}) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xffedf3ff),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  resultTeamA.toString(),
                  style: TextStyle(fontSize: 50, color: Color(0xff535f8e)),
                ),
                Text(resultTeamB.toString(),
                    style: TextStyle(fontSize: 50, color: Color(0xff535f8e)))
              ],
            ),
          )),
    );
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
                  style: TextStyle(fontSize: 50, color: Color(0xff535f8e))),
              Text(
                resultTeamB.toString(),
                style: TextStyle(fontSize: 50, color: Color(0xff535f8e)),
              )
            ],
          ),
        ));
  }
}
