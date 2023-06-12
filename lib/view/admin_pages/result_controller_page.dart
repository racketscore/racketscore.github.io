import 'dart:html';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/appwrite_service.dart';
import '../../model/models.dart';
import '../base_page.dart';

class ResultControllerPage extends StatefulWidget {
  final MatchDto match;

  const ResultControllerPage({super.key, required this.match});

  @override
  State<ResultControllerPage> createState() => _ResultControllerPageState();
}

class _ResultControllerPageState extends BasePageState<ResultControllerPage> {
  late final AppwriteService appwrite;

  @override
  void initState() {
    appwrite = context.read<AppwriteService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    /*Visibility(
                      visible: document.fullscreenEnabled ?? true,
                      child: IconButton(
                        icon: Icon(Icons.fullscreen),
                        onPressed: () {
                          document.documentElement?.requestFullscreen();

                        },
                      ),
                    ),*/
                  ],
                )),
          ),
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
                  children: [
                    _buildResultController(),
                    SizedBox(height: 20),
                    _buildResultOptions()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///Result Controller
  Widget _buildResultController() {
    return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        widget.match.matchName,
                        style: TextStyle(
                            fontSize: isMobile ? 20 : 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333f6e)),
                      ),
                      Visibility(
                          visible: widget.match.hasFinished,
                          child: Text("finished")),
                      SizedBox(height: 20),
                      Visibility(
                        visible: !isDesktop,
                        child: Text(
                          widget.match.teamAName,
                          style: TextStyle(
                              fontSize: isMobile ? 20 : 50,
                              color: Color(0xff535f8e)),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: isDesktop,
                            child: _buildMobileTeamsComponent(
                                teamA: widget.match.teamAName,
                                teamB: widget.match.teamBName),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Row(
                            children: List.generate(
                                widget.match.teamAGames.length, (index) {
                              return _buildSetComponent(index,
                                  resultTeamA: widget.match.teamAGames[index],
                                  resultTeamB: widget.match.teamBGames[index]);
                            }),
                          ),
                          _buildGameComponent(
                              resultTeamA: widget.match.teamAPoints,
                              resultTeamB: widget.match.teamBPoints),
                        ],
                      ),
                      Visibility(
                        visible: !isDesktop,
                        child: Text(
                          widget.match.teamBName,
                          style: TextStyle(
                              fontSize: isMobile ? 20 : 50,
                              color: Color(0xff535f8e)),
                        ),
                      ),
                    ],
                  );
  }

  Widget _buildMobileTeamsComponent({required String teamA, required String teamB}) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teamA,
            style: TextStyle(
                fontSize: isMobile ? 20 : 50, color: Color(0xff535f8e)),
          ),
          SizedBox(height: 40),
          Text(teamB,
              style: TextStyle(
                  fontSize: isMobile ? 20 : 50, color: Color(0xff535f8e)))
        ],
      ),
    );
  }

  Widget _buildSetComponent(int index,
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
                IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {
                    setState(() {
                      widget.match.incrementAGames(index);
                      appwrite.updateMatch(match: widget.match);
                    });
                  },
                ),
                Text(
                  resultTeamA.toString(),
                  style: TextStyle(
                      fontSize: isMobile ? 20 : 50, color: Color(0xff535f8e)),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      widget.match.decrementAGames(index);
                      appwrite.updateMatch(match: widget.match);
                    });
                  },
                ),
                SizedBox(height: 14),
                IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {
                    setState(() {
                      widget.match.incrementBGames(index);
                      appwrite.updateMatch(match: widget.match);
                    });
                  },
                ),
                Text(resultTeamB.toString(),
                    style: TextStyle(
                        fontSize: isMobile ? 20 : 50,
                        color: Color(0xff535f8e))),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    setState(() {
                      widget.match.decrementBGames(index);
                      appwrite.updateMatch(match: widget.match);
                    });
                  },
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildGameComponent({required int resultTeamA, required int resultTeamB}) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xffbacbfd),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: () {
                  setState(() {
                    widget.match.incrementAPoints();
                    appwrite.updateMatch(match: widget.match);
                  });
                },
              ),
              Text(resultTeamA.toString(),
                  style: TextStyle(
                      fontSize: isMobile ? 20 : 50, color: Color(0xff535f8e))),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    widget.match.decrementAPoints();
                    appwrite.updateMatch(match: widget.match);
                  });
                },
              ),
              SizedBox(height: 14),
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: () {
                  setState(() {
                    widget.match.incrementBPoints();
                    appwrite.updateMatch(match: widget.match);
                  });
                },
              ),
              Text(
                resultTeamB.toString(),
                style: TextStyle(
                    fontSize: isMobile ? 20 : 50, color: Color(0xff535f8e)),
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    widget.match.decrementBPoints();
                    appwrite.updateMatch(match: widget.match);
                  });
                },
              ),
            ],
          ),
        ));
  }

  ///Result Options
  Widget _buildResultOptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            window.open('https://racketscore.github.io'+'?event=${widget.match.id}', 'new tab');

          },
          child: Text(
            "Preview",

          ),
        ),
      ],
    );
  }
}
