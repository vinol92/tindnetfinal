import 'package:chatview/chatview.dart';

class Data {
  static const profileImage =
      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80";
  static final messageList = [
    Message(
      id: '1',
      message:
          "¡Hola! Somos una empresa de bodas, podemos ayudarte con tu boda",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message: "Hola si me gustaria tener algo de informacion",
      createdAt: DateTime.now(),
      sendBy: '2',
      status: MessageStatus.read,
    ),
    Message(
      id: '3',
      message: "¿Podemos quedar un dia para organizarnos? Estoy libre.",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '4',
      message: "¿Puedes escribir la hora y el lugar de la reunión?",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '5',
      message: "Sin problema",
      createdAt: DateTime.now(),
      sendBy: '2',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['1']),
      status: MessageStatus.read,
    ),
    Message(
      id: '6',
      message: "Cuando le venga bien",
      createdAt: DateTime.now(),
      sendBy: '3',
      status: MessageStatus.read,
    ),
    Message(
      id: '7',
      message: "Para mi esta bien por las tardes",
      createdAt: DateTime.now(),
      sendBy: '4',
      status: MessageStatus.read,
    ),
    Message(
      id: '8',
      message: "https://bit.ly/3JHS2Wl",
      createdAt: DateTime.now(),
      sendBy: '2',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{1F44D}', '\u{1F44D}'],
        reactedUserIds: ['2', '3', '4'],
      ),
      status: MessageStatus.read,
      replyMessage: const ReplyMessage(
        message: "PUdria enviarme la ubicacion y la hora?",
        replyTo: '1',
        replyBy: '2',
        messageId: '4',
      ),
    ),
    Message(
      id: '9',
      message: "Sin problema",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: MessageStatus.read,
      reaction: Reaction(
        reactions: [
          '\u{2764}',
          '\u{2764}',
          '\u{2764}',
        ],
        reactedUserIds: ['2', '3', '4'],
      ),
    ),
    Message(
      id: '10',
      message: "Gracias!",
      status: MessageStatus.read,
      createdAt: DateTime.now(),
      sendBy: '1',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{2764}', '\u{2764}', '\u{2764}'],
        reactedUserIds: ['2', '4', '3', '1'],
      ),
    ),
    Message(
      id: '11',
      message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sendBy: '1',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['2']),
      status: MessageStatus.read,
    ),
    Message(
      id: '12',
      message: "🤩🤩",
      createdAt: DateTime.now(),
      sendBy: '2',
      status: MessageStatus.read,
    ),
  ];
}
