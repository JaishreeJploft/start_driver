import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorksheetQuizController extends GetxController {
  final selectedFMOPos = (-1).obs;
  PageController pageController = PageController();
  List<Map<String, dynamic>> pendingAssignmentList = [
    {
      "question": "How often do you get a health\ncheckup?",
      "type": "ans",
      "ans": [
        "A. Once in 3 months",
        "B. Once in 6 months",
        "C. Once a year",
        "D. Only when needed",
        "E. Never get it done",
        "F. Other (If Other ask to describe)",
      ],
    },
    {
      "question": "What do you say about your\noverall health?",
      "type": "ans",
      "ans": [
        "A. Having Good Physical Health",
        "B. Moderately physically impaired",
        "C. Severely physically impaired",
        "D. Totally physically impaired",
      ],
    },
    {
      "question": "Do you have any chronic\ndiseases?",
      "type": "ans",
      "ans": [
        "A. Yes",
        "B. No",
      ],
    },
    {
      "question":
      "How healthy do you consider\nyourself on a scale of 1 to 10?",
      "type": "write",
      "ans": [],
    },
    {
      "question": "Are you habitual to drugs\nand alcohol?",
      "type": "ans",
      "ans": [
        "A. Yes to both",
        "B. Only to drugs",
        "C. Only to alcohol",
        "D. I am not habituated to either",
      ],
    },
  ];
}
