import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart'; // Import the home_page.dart file

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _userInput = TextEditingController();
  static const apiKey = "AIzaSyBF0rUXwEtsX2BM6SJURl7-okpAXTTEuqk";
  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  final List<Message> _messages = [];
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _voiceInput = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> sendMessage() async {
    final message = _userInput.text;
    if (message.isEmpty) return;

    _userInput.clear();
    {
      setState(() {
        _messages.add(Message(
          isUser: true,
          message: message,
          date: DateTime.now(),
        ));
      });

      final content = [Content.text(message)];
      final response = await model.generateContent(content);
      setState(() {
        _messages.add(Message(
          isUser: false,
          message: response.text ?? "",
          date: DateTime.now(),
        ));
      });
    }

    _scrollToBottom();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => setState(() {
          if (val == 'done') {
            _isListening = false;
            _userInput.text = _voiceInput;
            sendMessage();
          }
        }),
        onError: (val) => setState(() => _isListening = false),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState(() {
                  _voiceInput = val.recognizedWords;
                }));
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Advance-Agro Bot',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.57), BlendMode.dstATop),
            image: const AssetImage('assets/ai-wallpaper.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),
            ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Column(
                  children: [
                    SizedBox(height: 10),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(_isListening ? Icons.mic_none : Icons.mic),
                    onPressed: _listen,
                  ),
                  Expanded(
                    flex: 15,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _userInput,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Text(
                          _isListening
                              ? 'Press to release'
                              : 'Enter Your Message',
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(12),
                    iconSize: 30,
                    onPressed: sendMessage,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  final File? imageFile;
  Message(
      {required this.isUser,
      required this.message,
      required this.date,
      this.imageFile});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isUser)
          const CircleAvatar(
            backgroundImage: AssetImage('assets/agro-bot.png'),
            radius: 20,
          ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
              left: isUser ? 100 : 10,
              right: isUser ? 10 : 100,
            ),
            decoration: BoxDecoration(
              color: isUser ? Colors.blueAccent : Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                bottomLeft: isUser ? const Radius.circular(10) : Radius.zero,
                topRight: const Radius.circular(10),
                bottomRight: isUser ? Radius.zero : const Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: isUser ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 11,
                    color: isUser ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
