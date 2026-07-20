import 'package:flutter/material.dart';
import 'subjectscreen.dart';

class SemScreen extends StatelessWidget {
  final String semester;

  const SemScreen({
    super.key,
    required this.semester,
  });

  // Subjects for each semester
  List<String> getSubjects() {
    switch (semester) {
      case "Semester 1":
        return [
          "Mathematics I",
          "Physics",
          "Programming in C",
          "English",
          "Engineering Graphics",
          "Basic Electronics",
        ];

      case "Semester 2":
        return [
          "Mathematics II",
          "Chemistry",
          "Python Programming",
          "Mechanical Engineering",
          "Electrical Engineering",
          "Environmental Studies",
        ];

      case "Semester 3":
        return [
          "Data Structures",
          "Object Oriented Programming",
          "Discrete Mathematics",
          "Database Systems",
          "Digital Logic",
          "Probability & Statistics",
        ];

      case "Semester 4":
        return [
          "Operating Systems",
          "Computer Networks",
          "Java Programming",
          "Design & Analysis of Algorithms",
          "Artificial Intelligence",
          "Software Engineering",
        ];

      case "Semester 5":
        return [
          "Machine Learning",
          "Cloud Computing",
          "Mobile App Development",
          "Cyber Security",
          "Data Analytics",
          "Web Technologies",
        ];

      case "Semester 6":
        return [
          "Deep Learning",
          "Computer Vision",
          "Big Data Analytics",
          "IoT",
          "Data Mining",
          "Natural Language Processing",
        ];

      case "Semester 7":
        return [
          "Reinforcement Learning",
          "DevOps",
          "Blockchain",
          "Data Visualization",
          "Internship",
          "Elective I",
        ];

      case "Semester 8":
        return [
          "Major Project",
          "Seminar",
          "Internship",
          "Elective II",
          "Elective III",
        ];

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
                      "Choose a category to explore resources.",
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

                    // NOTES TAB
                    ListView.builder(
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        return SubjectTile(
                          subject: subjects[index],
                        );
                      },
                    ),

                    // PYQs TAB
                    ListView.builder(
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        return SubjectTile(
                          subject: subjects[index],
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

  const SubjectTile({
    super.key,
    required this.subject,
  });

  IconData getIcon() {
    switch (subject) {
      case "Mathematics I":
      case "Mathematics II":
      case "Discrete Mathematics":
        return Icons.calculate_rounded;

      case "Physics":
      case "Chemistry":
        return Icons.science_rounded;

      case "Programming in C":
      case "Python Programming":
      case "Java Programming":
      case "Object Oriented Programming":
      case "Web Technologies":
        return Icons.code_rounded;

      case "Artificial Intelligence":
      case "Machine Learning":
      case "Deep Learning":
      case "Natural Language Processing":
      case "Computer Vision":
      case "Reinforcement Learning":
        return Icons.psychology_rounded;

      case "Database Systems":
      case "Data Mining":
      case "Big Data Analytics":
      case "Data Analytics":
        return Icons.storage_rounded;

      case "Operating Systems":
      case "Computer Networks":
      case "Cloud Computing":
      case "Cyber Security":
      case "Blockchain":
      case "DevOps":
        return Icons.computer_rounded;

      case "Mobile App Development":
        return Icons.phone_android_rounded;

      case "Engineering Graphics":
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