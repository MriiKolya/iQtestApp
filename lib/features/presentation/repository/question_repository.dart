import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test_iq/features/presentation/domain/model/question_model.dart';

class QuestionRepository {
  Future<List<QuestionModel>> getQuestionList() async {
    try {
      String jsonString = await rootBundle.loadString('assets/question.json');
      final responce = json.decode(jsonString);
      final List<QuestionModel> dataList = (responce['questions'] as List)
          .map((json) => QuestionModel.fromJson(json))
          .toList();
      return dataList;
    } catch (e) {
      throw e.toString();
    }
  }
}
