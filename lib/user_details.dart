class UserDetails {
  String name, email, contact, rollNo;
  String hscCollege, hscYear, sscCollege, sscYear;
  double hscTotal, hscOutOf, sscTotal, sscOutOf;
  double sem1, sem2, sem3, sem4, sem5, cgpa;
  String additionalCourses;
  String? resumePath;

  UserDetails({
    required this.name,
    required this.email,
    required this.contact,
    required this.rollNo,
    required this.hscCollege,
    required this.hscYear,
    required this.hscTotal,
    required this.hscOutOf,
    required this.sscCollege,
    required this.sscYear,
    required this.sscTotal,
    required this.sscOutOf,
    required this.sem1,
    required this.sem2,
    required this.sem3,
    required this.sem4,
    required this.sem5,
    required this.cgpa,
    required this.additionalCourses,
    this.resumePath,
  });
}
