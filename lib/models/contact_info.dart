class ContactInfo {
  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
    required this.linkedinUrl,
    required this.githubUrl,
    required this.formEndpoint,
  });

  final String email;
  final String phone;
  final String location;
  final String linkedinUrl;
  final String githubUrl;
  final String formEndpoint;

  bool get hasEmail => email.trim().isNotEmpty;
  bool get hasPhone => phone.trim().isNotEmpty;
  bool get hasLocation => location.trim().isNotEmpty;
  bool get hasLinkedIn => linkedinUrl.trim().isNotEmpty;
  bool get hasGithub => githubUrl.trim().isNotEmpty;
  bool get hasForm => formEndpoint.trim().isNotEmpty;
}
