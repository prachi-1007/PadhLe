import 'package:flutter/material.dart';
import 'subjectscreen.dart';

class SemScreen extends StatelessWidget {
  final String semester;

  const SemScreen({
    super.key,
    required this.semester,
  });

  List<String> getSubjects() {
    switch (semester) {
      case "Semester 1":
        return [
          "MAC11",
          "PYC21",
          "PSCCS14",
          "HSCP15",
          "HSCP16",
          "MELC19",
        ];

      case "Semester 2":
        return [
          "MAC21",
          "CYC22",
          "PLC24",
          "ETC25",
          "HSCC26",
          "HSCC18",
        ];

      case "Semester 3":
      case "Semester 4":
      case "Semester 5":
      case "Semester 6":
      case "Semester 7":
      case "Semester 8":
        return [];

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final subjects = getSubjects();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Color(0xff6C63FF),
          ),
          title: Text(
            semester,
            style: const TextStyle(
              color: Color(0xff4B3FBD),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(22),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: const Color(0xffF6F3FF),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: const Color(0xffE7E2FF),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      semester,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4B3FBD),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Choose Notes or PYQs.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 25),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF6F3FF),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: const TabBar(
                  indicatorColor: Color(0xff6C63FF),
                  labelColor: Color(0xff6C63FF),
                  unselectedLabelColor: Colors.grey,

                  tabs: [
                    Tab(
                      icon: Icon(Icons.menu_book_outlined),
                      text: "Notes",
                    ),

                    Tab(
                      icon: Icon(Icons.description_outlined),
                      text: "PYQs",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: TabBarView(
                  children: [

                    ListView.builder(
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        return SubjectTile(
                          subject: subjects[index],
                          semester: semester,
                          type: "notes",
                        );
                      },
                    ),

                    ListView.builder(
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        return SubjectTile(
                          subject: subjects[index],
                          semester: semester,
                          type: "pyqs",
                        );
                      },
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class SubjectTile extends StatelessWidget {
  final String subject;
  final String semester;
  final String type;

  const SubjectTile({
    super.key,
    required this.subject,
    required this.semester,
    required this.type,
  });

  IconData getIcon() {
    switch (subject) {
      case "MAC11":
      case "MAC21":
      
        return Icons.calculate_rounded;

      case "PYC12":
      case "CYC22":
        return Icons.science_rounded;

      case "PSCCS14 in C":
      case "PLC24":
  
        return Icons.code_rounded;



      case "Data Structures":
        return Icons.account_tree_rounded;

      case "Digital Logic":
        return Icons.memory_rounded;

      case "Probability & Statistics":
        return Icons.bar_chart_rounded;

      case "MELC19":
        return Icons.architecture_rounded;

      default:
        return Icons.menu_book_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shadowColor: Colors.black12,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(18),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SubjectScreen(
                subject: subject,
                semester: semester,
                type: type,
              ),
            ),
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Row(
            children: [

              Container(
                height: 55,
                width: 55,

                decoration: BoxDecoration(
                  color: const Color(0xff6C63FF).withOpacity(.12),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Icon(
                  getIcon(),
                  color: const Color(0xff6C63FF),
                  size: 28,
                ),
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2D2D2D),
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Color(0xff6C63FF),
              ),

            ],
          ),
        ),
      ),
    );
  }
}