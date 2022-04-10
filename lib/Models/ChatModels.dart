class AnswerModel {
  late String answer;

  AnswerModel({required this.answer});

  AnswerModel.fromJson(Map<String, dynamic> response) {
    if (response["answer"] != null) {
      answer = response["answer"]!;
    }
  }
}

class Message{
  late bool isSender;
  late String content;

  Message({required this.isSender,required this.content});
}
