import 'package:flutter/material.dart';

class AkshayaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akshaya Ashok', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('lib/images/Akshaya.png'),
            ),
            SizedBox(height: 20),
            
          
            Text(
              'Akshaya Ashok The Legend: A Journey of Excellence and Inspiration',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

       
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''Born on September 11, 2003, in Coimbatore, Tamil Nadu, Akshaya Ashok has always been a standout in both academics and extracurricular activities. From a young age, Akshaya displayed a passion for public speaking, starting her journey in Grade 7. With the unwavering support of her father, mother, and brother, she honed her skills, developing an accent so polished that it resembles that of a native English speaker. Her dedication to improving her speaking abilities has made her one of the best public speakers among her peers.

Akshaya's academic journey has been equally impressive. She attended Bharatiya Vidya Bhavan School, Matric Hr. Secondary School, RS Puram, Coimbatore, where she not only excelled in academics but also thrived in extracurricular activities. A natural leader, she actively participated in various debates and speaking competitions, representing her school with pride. She was also a skilled shuttle badminton player, balancing her time between sports and studies with ease.

Her hard work and determination were reflected in her academic achievements, as she secured an impressive score of 486 out of 500 in her SSLC exams. The school’s motto, inspired by Swami Vivekananda—"Arise, awake, and stop not till the goal is reached"—served as a guiding principle throughout her journey.

Akshaya's talents in public speaking took her to new heights, as she was shortlisted for the state-level English elocution competition in Tamil Nadu. Her ability to articulate thoughts with clarity and confidence continues to inspire those around her.

Now in college, Akshaya stands out as a topper with an impressive CGPA of 9.6. Her dedication to excellence in every aspect of her life has made her a role model for her peers. Beyond her academic and extracurricular accomplishments, Akshaya has also demonstrated remarkable achievements in the professional world. She has secured internships as a Software Development Engineer (SDE) at prestigious companies, including J.P. Morgan, Amazon, Caterpillar, TVS Motors, and Samsung Prism. 

Akshaya’s exceptional skills, combined with her experience across these leading firms, further solidify her position as a rising star in the tech industry.

Beyond her accomplishments, Akshaya is known for her kindness and unwavering support to her friends priyanka and preethi. She is a source of motivation, encouragement, and inspiration, especially for her  friend Ajay Krishna.

 She continues to set high standards for herself and those around her, embodying the true spirit of a leader and a role model.''',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
