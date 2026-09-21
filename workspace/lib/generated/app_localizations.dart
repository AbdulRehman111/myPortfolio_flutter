import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Abdul Rehman | Software Engineer | Full Stack & Mobile Developer'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navExpertise.
  ///
  /// In en, this message translates to:
  /// **'Expertise'**
  String get navExpertise;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navCertifications.
  ///
  /// In en, this message translates to:
  /// **'Certifications'**
  String get navCertifications;

  /// No description provided for @navAwards.
  ///
  /// In en, this message translates to:
  /// **'Awards'**
  String get navAwards;

  /// No description provided for @navApplications.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get navApplications;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @navLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get navLinkedIn;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get langEnglish;

  /// No description provided for @langArabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get langArabic;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @heroName.
  ///
  /// In en, this message translates to:
  /// **'Abdul Rehman'**
  String get heroName;

  /// No description provided for @heroHeadline.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer | Full Stack Developer | Core Mobile Application Developer'**
  String get heroHeadline;

  /// No description provided for @heroTagline.
  ///
  /// In en, this message translates to:
  /// **'Building reliable mobile, web, and backend solutions from idea to production.'**
  String get heroTagline;

  /// No description provided for @heroYears.
  ///
  /// In en, this message translates to:
  /// **'9+ years of professional software development'**
  String get heroYears;

  /// No description provided for @ctaViewWork.
  ///
  /// In en, this message translates to:
  /// **'View My Work'**
  String get ctaViewWork;

  /// No description provided for @ctaAbout.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get ctaAbout;

  /// No description provided for @ctaDownloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get ctaDownloadCv;

  /// No description provided for @ctaViewCv.
  ///
  /// In en, this message translates to:
  /// **'View CV'**
  String get ctaViewCv;

  /// No description provided for @ctaContact.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get ctaContact;

  /// No description provided for @ctaLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get ctaLinkedIn;

  /// No description provided for @aboutEyebrow.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutEyebrow;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'Independent ownership of the full software lifecycle'**
  String get aboutTitle;

  /// No description provided for @aboutP1.
  ///
  /// In en, this message translates to:
  /// **'I am a software engineer with more than nine years of professional development experience. I design and deliver complete solutions independently: from the initial idea through architecture, UI/UX, mobile and web clients, APIs and backend services, databases, integrations, testing, deployment, and production support.'**
  String get aboutP1;

  /// No description provided for @aboutP2.
  ///
  /// In en, this message translates to:
  /// **'My practice covers full stack development, core mobile application development, Flutter, web applications, backend and API work, database design, application integration, and production operations. I am comfortable owning a product from a blank repository to a stable release.'**
  String get aboutP2;

  /// No description provided for @aboutP3.
  ///
  /// In en, this message translates to:
  /// **'I focus on clear architecture, maintainable code, careful integrations, and systems that remain reliable after they go live. I keep learning, and I treat problem solving, performance, and operational support as part of the same engineering job — not as afterthoughts.'**
  String get aboutP3;

  /// No description provided for @aboutHighlight1Title.
  ///
  /// In en, this message translates to:
  /// **'9+ years'**
  String get aboutHighlight1Title;

  /// No description provided for @aboutHighlight1Body.
  ///
  /// In en, this message translates to:
  /// **'Professional software development'**
  String get aboutHighlight1Body;

  /// No description provided for @aboutHighlight2Title.
  ///
  /// In en, this message translates to:
  /// **'Full lifecycle'**
  String get aboutHighlight2Title;

  /// No description provided for @aboutHighlight2Body.
  ///
  /// In en, this message translates to:
  /// **'Idea through production support'**
  String get aboutHighlight2Body;

  /// No description provided for @aboutHighlight3Title.
  ///
  /// In en, this message translates to:
  /// **'Independent delivery'**
  String get aboutHighlight3Title;

  /// No description provided for @aboutHighlight3Body.
  ///
  /// In en, this message translates to:
  /// **'Mobile, web, API and data'**
  String get aboutHighlight3Body;

  /// No description provided for @aboutHighlight4Title.
  ///
  /// In en, this message translates to:
  /// **'Flutter & mobile'**
  String get aboutHighlight4Title;

  /// No description provided for @aboutHighlight4Body.
  ///
  /// In en, this message translates to:
  /// **'Core application development'**
  String get aboutHighlight4Body;

  /// No description provided for @lifecycleTitle.
  ///
  /// In en, this message translates to:
  /// **'How I work'**
  String get lifecycleTitle;

  /// No description provided for @lifecycleBody.
  ///
  /// In en, this message translates to:
  /// **'Idea → Architecture → UI/UX → Mobile/Web → API/Backend → Database → Integrations → Testing → Deployment → Production Support'**
  String get lifecycleBody;

  /// No description provided for @expertiseEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Expertise'**
  String get expertiseEyebrow;

  /// No description provided for @expertiseTitle.
  ///
  /// In en, this message translates to:
  /// **'What I deliver'**
  String get expertiseTitle;

  /// No description provided for @expertiseLead.
  ///
  /// In en, this message translates to:
  /// **'I work across the stack so a product can be designed, built, integrated and operated as one system.'**
  String get expertiseLead;

  /// No description provided for @expertiseMobileTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile Application Development'**
  String get expertiseMobileTitle;

  /// No description provided for @expertiseMobileBody.
  ///
  /// In en, this message translates to:
  /// **'Native-quality mobile products with Flutter and core mobile platforms, including maps, GPS, notifications and store delivery.'**
  String get expertiseMobileBody;

  /// No description provided for @expertiseFullStackTitle.
  ///
  /// In en, this message translates to:
  /// **'Full Stack Development'**
  String get expertiseFullStackTitle;

  /// No description provided for @expertiseFullStackBody.
  ///
  /// In en, this message translates to:
  /// **'End-to-end ownership of client, API, data and integrations so a solution can ship as a coherent product.'**
  String get expertiseFullStackBody;

  /// No description provided for @expertiseWebTitle.
  ///
  /// In en, this message translates to:
  /// **'Web Application Development'**
  String get expertiseWebTitle;

  /// No description provided for @expertiseWebBody.
  ///
  /// In en, this message translates to:
  /// **'Responsive web applications with careful structure, accessibility and production-ready front ends.'**
  String get expertiseWebBody;

  /// No description provided for @expertiseApiTitle.
  ///
  /// In en, this message translates to:
  /// **'API & Backend Development'**
  String get expertiseApiTitle;

  /// No description provided for @expertiseApiBody.
  ///
  /// In en, this message translates to:
  /// **'REST APIs, authentication, services and backend logic that clients can depend on.'**
  String get expertiseApiBody;

  /// No description provided for @expertiseDatabaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Database Development'**
  String get expertiseDatabaseTitle;

  /// No description provided for @expertiseDatabaseBody.
  ///
  /// In en, this message translates to:
  /// **'SQL Server design, stored procedures and query work that keep data correct and performant.'**
  String get expertiseDatabaseBody;

  /// No description provided for @expertiseIntegrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Application Integration'**
  String get expertiseIntegrationTitle;

  /// No description provided for @expertiseIntegrationBody.
  ///
  /// In en, this message translates to:
  /// **'Connecting systems, third-party APIs and SDKs without losing operational clarity.'**
  String get expertiseIntegrationBody;

  /// No description provided for @expertiseRtlTitle.
  ///
  /// In en, this message translates to:
  /// **'Multilingual / RTL Applications'**
  String get expertiseRtlTitle;

  /// No description provided for @expertiseRtlBody.
  ///
  /// In en, this message translates to:
  /// **'Arabic and English products with proper RTL/LTR layout, localization and bidirectional UI.'**
  String get expertiseRtlBody;

  /// No description provided for @expertiseDeployTitle.
  ///
  /// In en, this message translates to:
  /// **'Deployment & Production Support'**
  String get expertiseDeployTitle;

  /// No description provided for @expertiseDeployBody.
  ///
  /// In en, this message translates to:
  /// **'Releases, store publishing, monitoring and the support needed after go-live.'**
  String get expertiseDeployBody;

  /// No description provided for @skillsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skillsEyebrow;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical practice'**
  String get skillsTitle;

  /// No description provided for @skillsLead.
  ///
  /// In en, this message translates to:
  /// **'Skills are grouped by discipline. No proficiency bars — the work is the evidence.'**
  String get skillsLead;

  /// No description provided for @skillsMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get skillsMobile;

  /// No description provided for @skillsWeb.
  ///
  /// In en, this message translates to:
  /// **'Web'**
  String get skillsWeb;

  /// No description provided for @skillsBackend.
  ///
  /// In en, this message translates to:
  /// **'Backend / API'**
  String get skillsBackend;

  /// No description provided for @skillsDatabase.
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get skillsDatabase;

  /// No description provided for @skillsCloud.
  ///
  /// In en, this message translates to:
  /// **'Cloud / Services'**
  String get skillsCloud;

  /// No description provided for @skillsOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get skillsOther;

  /// No description provided for @skillsI18n.
  ///
  /// In en, this message translates to:
  /// **'Internationalization'**
  String get skillsI18n;

  /// No description provided for @archEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get archEyebrow;

  /// No description provided for @archTitle.
  ///
  /// In en, this message translates to:
  /// **'Working across the complete stack'**
  String get archTitle;

  /// No description provided for @archLead.
  ///
  /// In en, this message translates to:
  /// **'I treat frontend, backend, data, external services and deployment as one delivery path, not isolated specialties.'**
  String get archLead;

  /// No description provided for @archFrontendTitle.
  ///
  /// In en, this message translates to:
  /// **'Frontend'**
  String get archFrontendTitle;

  /// No description provided for @archFrontendBody.
  ///
  /// In en, this message translates to:
  /// **'Mobile and web interfaces: Flutter, responsive web, UX structure and multilingual layout.'**
  String get archFrontendBody;

  /// No description provided for @archBackendTitle.
  ///
  /// In en, this message translates to:
  /// **'Backend / API'**
  String get archBackendTitle;

  /// No description provided for @archBackendBody.
  ///
  /// In en, this message translates to:
  /// **'ASP.NET, C#, REST, authentication and services that expose a stable contract.'**
  String get archBackendBody;

  /// No description provided for @archDatabaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get archDatabaseTitle;

  /// No description provided for @archDatabaseBody.
  ///
  /// In en, this message translates to:
  /// **'SQL Server design, procedures and query work that protect integrity and performance.'**
  String get archDatabaseBody;

  /// No description provided for @archServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'External services'**
  String get archServicesTitle;

  /// No description provided for @archServicesBody.
  ///
  /// In en, this message translates to:
  /// **'Firebase, messaging, maps, analytics and third-party SDKs wired in with care.'**
  String get archServicesBody;

  /// No description provided for @archDeployTitle.
  ///
  /// In en, this message translates to:
  /// **'Deployment'**
  String get archDeployTitle;

  /// No description provided for @archDeployBody.
  ///
  /// In en, this message translates to:
  /// **'Release, store publishing, configuration and production support after go-live.'**
  String get archDeployBody;

  /// No description provided for @projectsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projectsEyebrow;

  /// No description provided for @projectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Selected work'**
  String get projectsTitle;

  /// No description provided for @projectsLead.
  ///
  /// In en, this message translates to:
  /// **'Project cards are data-driven. Placeholder entries are marked until verified case studies are published.'**
  String get projectsLead;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get filterMobile;

  /// No description provided for @filterWeb.
  ///
  /// In en, this message translates to:
  /// **'Web'**
  String get filterWeb;

  /// No description provided for @filterFullStack.
  ///
  /// In en, this message translates to:
  /// **'Full Stack'**
  String get filterFullStack;

  /// No description provided for @filterApi.
  ///
  /// In en, this message translates to:
  /// **'API'**
  String get filterApi;

  /// No description provided for @placeholderBadge.
  ///
  /// In en, this message translates to:
  /// **'Placeholder'**
  String get placeholderBadge;

  /// No description provided for @featuredBadge.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featuredBadge;

  /// No description provided for @projectFeatures.
  ///
  /// In en, this message translates to:
  /// **'Key features'**
  String get projectFeatures;

  /// No description provided for @projectResponsibilities.
  ///
  /// In en, this message translates to:
  /// **'Responsibilities'**
  String get projectResponsibilities;

  /// No description provided for @projectTech.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get projectTech;

  /// No description provided for @actionDemo.
  ///
  /// In en, this message translates to:
  /// **'Demo'**
  String get actionDemo;

  /// No description provided for @actionGithub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get actionGithub;

  /// No description provided for @actionPlay.
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get actionPlay;

  /// No description provided for @actionAppStore.
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get actionAppStore;

  /// No description provided for @actionView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get actionView;

  /// No description provided for @appsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Applications'**
  String get appsEyebrow;

  /// No description provided for @appsTitle.
  ///
  /// In en, this message translates to:
  /// **'Published applications'**
  String get appsTitle;

  /// No description provided for @appsLead.
  ///
  /// In en, this message translates to:
  /// **'Store listings appear here only with confirmed names and links. Placeholder cards show the intended layout.'**
  String get appsLead;

  /// No description provided for @experienceEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceEyebrow;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Professional timeline'**
  String get experienceTitle;

  /// No description provided for @experienceLead.
  ///
  /// In en, this message translates to:
  /// **'Only confirmed employers are listed. Dates, titles and responsibilities are published when independently verified.'**
  String get experienceLead;

  /// No description provided for @confirmedBadge.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get confirmedBadge;

  /// No description provided for @pendingBadge.
  ///
  /// In en, this message translates to:
  /// **'Pending verification'**
  String get pendingBadge;

  /// No description provided for @certsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Certifications'**
  String get certsEyebrow;

  /// No description provided for @certsTitle.
  ///
  /// In en, this message translates to:
  /// **'Credentials'**
  String get certsTitle;

  /// No description provided for @certsLead.
  ///
  /// In en, this message translates to:
  /// **'Certificates are shown only when independently confirmed. The gallery below is ready for verified items.'**
  String get certsLead;

  /// No description provided for @awardsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Awards'**
  String get awardsEyebrow;

  /// No description provided for @awardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Awards & achievements'**
  String get awardsTitle;

  /// No description provided for @awardsLead.
  ///
  /// In en, this message translates to:
  /// **'Achievements are listed only from confirmed records. Placeholder cards reserve the layout.'**
  String get awardsLead;

  /// No description provided for @educationEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationEyebrow;

  /// No description provided for @educationTitle.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationTitle;

  /// No description provided for @educationLead.
  ///
  /// In en, this message translates to:
  /// **'Qualifications will be added from confirmed records only.'**
  String get educationLead;

  /// No description provided for @qrEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get qrEyebrow;

  /// No description provided for @qrTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan to connect with me on LinkedIn'**
  String get qrTitle;

  /// No description provided for @qrLead.
  ///
  /// In en, this message translates to:
  /// **'Open the camera on your phone and scan the code. The destination is configurable in portfolio data.'**
  String get qrLead;

  /// No description provided for @qrDownload.
  ///
  /// In en, this message translates to:
  /// **'Download QR'**
  String get qrDownload;

  /// No description provided for @qrOpen.
  ///
  /// In en, this message translates to:
  /// **'Open LinkedIn'**
  String get qrOpen;

  /// No description provided for @cvEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get cvEyebrow;

  /// No description provided for @cvTitle.
  ///
  /// In en, this message translates to:
  /// **'Curriculum vitae'**
  String get cvTitle;

  /// No description provided for @cvLead.
  ///
  /// In en, this message translates to:
  /// **'Download or open a PDF summary. Replace the file in assets/documents when a signed CV is ready.'**
  String get cvLead;

  /// No description provided for @contactEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactEyebrow;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Let’s discuss a brief'**
  String get contactTitle;

  /// No description provided for @contactLead.
  ///
  /// In en, this message translates to:
  /// **'Use LinkedIn, email or the form. Empty fields stay hidden until configured.'**
  String get contactLead;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhone;

  /// No description provided for @contactLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get contactLocation;

  /// No description provided for @contactLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get contactLinkedIn;

  /// No description provided for @contactGithub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get contactGithub;

  /// No description provided for @formName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get formName;

  /// No description provided for @formEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get formEmail;

  /// No description provided for @formSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get formSubject;

  /// No description provided for @formMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get formMessage;

  /// No description provided for @formSend.
  ///
  /// In en, this message translates to:
  /// **'Send message'**
  String get formSend;

  /// No description provided for @formHint.
  ///
  /// In en, this message translates to:
  /// **'The form opens your email client. A dedicated endpoint can be set in configuration.'**
  String get formHint;

  /// No description provided for @formNameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name.'**
  String get formNameError;

  /// No description provided for @formEmailError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email.'**
  String get formEmailError;

  /// No description provided for @formMessageError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a message.'**
  String get formMessageError;

  /// No description provided for @formUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Direct email is not configured yet. Please use LinkedIn.'**
  String get formUnavailable;

  /// No description provided for @footerRights.
  ///
  /// In en, this message translates to:
  /// **'Abdul Rehman. All rights reserved.'**
  String get footerRights;

  /// No description provided for @footerNote.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer · Full Stack · Flutter · Mobile · Web · API · Database'**
  String get footerNote;

  /// No description provided for @skipToContent.
  ///
  /// In en, this message translates to:
  /// **'Skip to content'**
  String get skipToContent;

  /// No description provided for @menuOpen.
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get menuOpen;

  /// No description provided for @menuClose.
  ///
  /// In en, this message translates to:
  /// **'Close menu'**
  String get menuClose;

  /// No description provided for @notConfigured.
  ///
  /// In en, this message translates to:
  /// **'Not published yet'**
  String get notConfigured;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
