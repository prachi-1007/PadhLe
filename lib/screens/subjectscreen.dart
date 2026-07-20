import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  final String subject;

  const SubjectScreen({
    super.key,
    required this.subject,
  });

  final List<String> resources = const [
    "Module 1 Notes.pdf",
    "Module 2 Notes.pdf",
    "Module 3 Notes.pdf",
    "Module 4 Notes.pdf",
    "Module 5 Notes.pdf",
    "Lab Manual.pdf",
    "PPT Slides.pdf",
    "Important Questions.pdf",
  ];

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
                    "${resources.length} Resources Available",
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
              child: ListView.builder(
                itemCount: resources.length,

                itemBuilder: (context, index) {

                  return ResourceTile(
                    title: resources[index],
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

class ResourceTile extends StatelessWidget {
  final String title;

  const ResourceTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      color: Colors.white,

      margin: const EdgeInsets.only(bottom: 16),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(18),

        onTap: () {
          // Firebase PDF will open here later
        },

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Row(
            children: [

              Container(
                height: 52,
                width: 52,

                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(.12),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Icon(
                  Icons.picture_as_pdf_rounded,
                  color: Colors.red,
                ),
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2D2D2D),
                  ),
                ),
              ),

              const Icon(
                Icons.download_rounded,
                color: Color(0xff6C63FF),
              ),

            ],
          ),
        ),
      ),
    );
  }
}