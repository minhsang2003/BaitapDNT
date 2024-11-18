import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question(
      question: "Flutter là gì?",
      options: [
        "Một ngôn ngữ lập trình",
        "Một framework phát triển ứng dụng di động",
        "Một IDE phát triển phần mềm",
        "Một hệ điều hành di động",
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      question:
          "2. Widget nào được sử dụng để xếp chồng các widget khác lên nhau?",
      options: [
        "Row",
        "Column",
        "Stack",
        "Container",
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      question:
          "3. Widget nào được sử dụng để căn giữa một widget trong Flutter?",
      options: [
        "Center",
        "Padding",
        "Align",
        "SizedBox",
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      question:
          "4. Để thêm khoảng cách giữa các widget, bạn có thể sử dụng widget nào?",
      options: [
        "Margin",
        "Padding",
        "SizedBox",
        "Spacing",
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      question:
          "5. Lệnh nào được sử dụng để chạy ứng dụng Flutter trên thiết bị thật hoặc giả lập?",
      options: [
        "flutter test",
        "flutter run",
        "flutter build",
        "flutter create",
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      question:
          "6. Thuộc tính nào của Text widget được sử dụng để định dạng kiểu chữ (bold, italic)?",
      options: [
        "style",
        "fontWeight",
        "textAlign",
        "fontStyle",
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      question:
          "7. Widget nào được sử dụng để tạo ra các thành phần vuốt sang trái hoặc phải để xoá hoặc hoàn thành một nhiệm vụ?",
      options: [
        "Dismissible",
        "ListTile",
        "GestureDetector",
        "Draggable",
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      question:
          "8. Hàm nào được gọi để làm mới lại giao diện khi có sự thay đổi trong StatefulWidget?",
      options: [
        "refresh()",
        "setState()",
        "rebuild()",
        "repaint()",
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      question:
          "9. Để hiển thị danh sách với số lượng lớn các mục, widget nào sau đây là tốt nhất?",
      options: [
        "Column",
        "ListView",
        "Stack",
        "GridView",
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      question: "10. Widget nào dùng để hiển thị một hình ảnh trong Flutter?",
      options: [
        "Picture",
        "Photo",
        "Image",
        "Asset",
      ],
      correctAnswerIndex: 2,
    ),
  ];

  void pickAnswer(int value) {
    if (value == questions[questionIndex].correctAnswerIndex) {
      score++;
    }
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...List.generate(question.options.length, (index) {
              return ElevatedButton(
                onPressed: () => pickAnswer(index),
                child: Text(question.options[index]),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết Quả'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Điểm: $score',
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
              child: const Text('Làm lại'),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}
