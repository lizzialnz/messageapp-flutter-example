// respuesta automactica si o no en mensajes

import 'package:dio/dio.dart';
import 'package:messageappflutter/domain/entities/message.dart';
import 'package:messageappflutter/infraestructure/models/models.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsoMap(response.data);
    response.data['answer'];

    return Message(
        text: yesNoModel.answer,
        fromWho: FromWho.hers,
        imageUrl: yesNoModel.image);
  }
}
