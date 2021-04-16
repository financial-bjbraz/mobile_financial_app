import 'dart:math';

import 'package:bank_app/entities/user.dart';
import 'package:bank_app/services/user_repository.dart';
import 'package:bank_app/services/postRepository.dart';
import 'package:bank_app/entities/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdCard extends StatefulWidget {
  const ThirdCard({Key key, this.user}) : super(key: key);
  final User user;

  @override
  _ThirdCardState createState() => _ThirdCardState(this.user);
}

class _ThirdCardState extends State<ThirdCard>
    with AutomaticKeepAliveClientMixin {
  bool _buttonPressed = false;
  List<Post> posts = [];
  Post post;
  final User user;
  var randon = Random();

  _ThirdCardState(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/gift-outline.svg",
            color: Colors.grey,
            semanticsLabel: "gift",
          ),
          Column(
            children: [
              Text(
                "Nubank Rewards",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços realmente úteis.",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 0.7, color: Colors.purple[800]),
            ),
            child: RaisedButton(
              child: Text(
                "ATIVE O SEU REWARDS " + (user.getBalance().toString()),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              textColor: _buttonPressed ? Colors.white : Colors.purple[800],
              disabledTextColor: Colors.white,
              highlightColor: Colors.purple[800],
              onHighlightChanged: (pressed) {
                setState(() {
                  _buttonPressed = pressed;
                });
              },
              color: Colors.transparent,
              onPressed: () {
                setState(() {

                  user.setBalance(1);
                  updateUser(user);

                  // if (posts.length > 0) {
                  //   post.update();
                  // } else {
                  //   post = new Post(
                  //       body: randon.nextInt(10000).toString(),
                  //       author: user.name);
                  //   post.setId(savePost(post));
                  //   posts.add(post);
                  // }
                });
              },
              elevation: 0,
              disabledElevation: 0,
              highlightElevation: 0,
              focusElevation: 0,
              hoverElevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
