import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/common/widgets/navbar.dart';
import 'package:pawrentingreborn/features/mypets/controllers/navbarcontroller.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<Map<String, String>> faqs = [
    {
      "question": "What is the Pawrenting?",
      "answer":
          "An app designed as an interactive educational platform to help pet owners, especially cats and dogs (anabul), provide the best care."
    },
    {
      "question": "I forgot my password",
      "answer": "You can reset your password in the Account settings."
    },
    {
      "question": "What types of product can I buy in the app?",
      "answer": "You can buy pet food, accessories, and more."
    },
    {
      "question": "What kind of community features are available?",
      "answer": "Discussion forums, articles, and pet tips."
    },
    {
      "question": "Do I need an internet connection to use the app?",
      "answer": "Yes, an internet connection is required."
    },
    {
      "question": "Can I create a profile for my pet?",
      "answer": "Yes, you can add pet details and track health records."
    },
    {
      "question": "Where can I add my pet data?",
      "answer": "Under the 'Manage Pet' section in the app."
    },
  ];

  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = List.generate(faqs.length, (index) => false);
  }

  void _toggleExpansion(int index) {
    setState(() {
      _isExpanded[index] = !_isExpanded[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    NavBarController controller = Get.find();

    return Scaffold(
      appBar: const TAppBar2(
        title: "FAQs",
        subtitle: "Quick Help at Your Fingertips",
      ),
      bottomNavigationBar: InsideNavBar(),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: faqs.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, String> faq = entry.value;

            return Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(faq["question"]!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Alata",
                            fontSize: 16)),
                    trailing: Icon(_isExpanded[index]
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down),
                    onTap: () => _toggleExpansion(index),
                  ),
                  if (_isExpanded[index])
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        faq["answer"]!,
                        style: TextStyle(
                            fontFamily: "Albert Sans",
                            fontSize: 16,
                            color: Colors.grey.shade600),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
