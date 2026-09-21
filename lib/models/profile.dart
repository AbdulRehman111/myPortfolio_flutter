import 'contact_info.dart';
import 'social_link.dart';

class Profile {
  const Profile({
    required this.name,
    required this.headline,
    required this.tagline,
    required this.yearsExperience,
    required this.linkedinUrl,
    required this.qrDestination,
    required this.cvAsset,
    required this.profileImage,
    required this.contact,
    required this.socialLinks,
    required this.languages,
  });

  final String name;
  final String headline;
  final String tagline;
  final int yearsExperience;
  final String linkedinUrl;
  final String qrDestination;
  final String cvAsset;
  final String profileImage;
  final ContactInfo contact;
  final List<SocialLink> socialLinks;
  final List<String> languages;

  List<SocialLink> get visibleSocial =>
      socialLinks.where((s) => s.hasUrl).toList();
}
