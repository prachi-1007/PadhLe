import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class SubjectScreen extends StatelessWidget {
  final String subject;
  final String semester;
  final String type;

  const SubjectScreen({
    super.key,
    required this.subject,
    required this.semester,
    required this.type,
  });

  Future<void> openPdf(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open PDF");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xff6C63FF),
        ),
        title: Text(
          subject,
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
                    subject,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4B3FBD),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "$type Resources",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Study Material",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff4B3FBD),
              ),
            ),

            const SizedBox(height: 18),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("resources")
                    .where("sem",
                        isEqualTo: semester.replaceAll("Semester ", ""))
                    .where("subject", isEqualTo: subject)
                    .where("type", isEqualTo: type.toLowerCase())
                    .snapshots(),

                builder: (context, snapshot) {
print("Semester = ${semester.replaceAll("Semester ", "")}");
print("Subject = $subject");
print("Type = ${type.toLowerCase()}");
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No resources available"),
                    );
                  }

                  final docs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: docs.length,

                    itemBuilder: (context, index) {

                      final data = docs[index];

                      return Card(
                        elevation: 3,
                        margin:
                            const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18),
                        ),

                        child: ListTile(

                          leading: const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                          ),

                          title: Text(data["title"]),

                          trailing: const Icon(
                            Icons.open_in_new,
                            color: Color(0xff6C63FF),
                          ),
onTap: () async {
  print("Tapped!");
  print(data["pdfUrl"]);

  final Uri uri = Uri.parse(data["pdfUrl"]);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    print("Could not launch ${data["pdfUrl"]}");
  }
},
                        ),
                      );
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}