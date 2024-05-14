import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tindnetfinal/card.dart';
import 'package:tindnetfinal/chat_view.dart';
import 'package:tindnetfinal/models/card_model.dart';

class SwipeCardsWidget extends StatefulWidget {
  SwipeCardsWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SwipeCardsWidgetState createState() => _SwipeCardsWidgetState();
}

class _SwipeCardsWidgetState extends State<SwipeCardsWidget> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Alquileres",
    "Peluqueria",
    "Tatto",
    "Restaurante",
    "Bodorrios",
    "Vuelosbaratos",
  ];
  List<String> categoria = [
    "Casas",
    "Estetica",
    "Moda",
    "Restauracion",
    "Eventos",
    "Viajes",
  ];
  List<String> localidades = [
    "Malaga",
    "Marbella",
    "Antequera",
    "Ronda",
    "Malaga",
    "Madrid",
  ];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
  ];
  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content:
              Content(text: _names[i], color: _colors[i], image: imgList[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0, left: 16.0, top: 16.0, bottom: 80.0),
                    child: UserCard(
                      imgList: imgList[index],
                      user: _names[index],
                      localidad: localidades[index],
                      categoria: categoria[index],
                    ));
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              leftSwipeAllowed: true,
              rightSwipeAllowed: true,
              upSwipeAllowed: true,
              fillSpace: true,
              likeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Text('Like'),
              ),
              nopeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: Text('Nope'),
              ),
              superLikeTag: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.orange)),
                child: Text('Super Like'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ElevatedButton(
                //     onPressed: () {
                //       _matchEngine!.currentItem?.nope();
                //     },
                //     child: Text("Nope")),
                // ElevatedButton(
                //     onPressed: () {
                //       _matchEngine!.currentItem?.superLike();
                //     },
                //     child: Text("Superlike")),
                // ElevatedButton(
                //     onPressed: () {
                //       _matchEngine!.currentItem?.like();
                //     },
                //     child: Text("Like"))
                IconButton(
                  onPressed: () {
                    // Acción al presionar el botón X
                    _matchEngine!.currentItem?.nope();
                  },
                  icon: Image.asset(
                    'assets/letra-x.png', // Ruta de la imagen para el botón X
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Acción al presionar el botón de chat
                    _matchEngine!.currentItem?.superLike();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                    // _openDraggableScrollableSheet();
                  },
                  icon: Image.asset(
                    'assets/charla.png', // Ruta de la imagen para el botón de chat
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Acción al presionar el botón del corazón
                    _matchEngine!.currentItem?.like();
                  },
                  icon: Image.asset(
                    'assets/corazon.png', // Ruta de la imagen para el botón del corazón
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          )
        ])));
  }

  void _openDraggableScrollableSheet() {
    // Implement your code to open the draggable scrollable sheet
    // For example:
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.25,
          maxChildSize: 0.8,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              height: 500,
              color: Colors.white,
              child: ChatScreen(),
            );
          },
        );
      },
    );
  }
}
