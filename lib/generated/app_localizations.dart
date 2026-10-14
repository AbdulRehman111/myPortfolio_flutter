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
  /// **'Certificates'**
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

  /// No description provided for @navDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get navDocuments;

  /// No description provided for @navAppreciations.
  ///
  /// In en, this message translates to:
  /// **'Appreciations'**
  String get navAppreciations;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

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
  /// **'Building reliable mobile, web, and backend solutions from idea to production — maps, KML, bilingual RTL/LTR and dark theme included.'**
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

  /// No description provided for @ctaHire.
  ///
  /// In en, this message translates to:
  /// **'Hire me'**
  String get ctaHire;

  /// No description provided for @skillSearch.
  ///
  /// In en, this message translates to:
  /// **'Filter skills…'**
  String get skillSearch;

  /// No description provided for @shareSite.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareSite;

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
  /// **'Passionate software engineer — web, mobile, and end-to-end digital solutions'**
  String get aboutTitle;

  /// No description provided for @aboutP1.
  ///
  /// In en, this message translates to:
  /// **'I am a passionate Software Engineer with 9+ years of professional experience in software development, with a strong focus on building Web and Mobile Applications and end-to-end digital solutions. Over the years, I have worked across a diverse range of programming languages, frameworks, tools, and technologies, gaining hands-on experience throughout the complete software development lifecycle.'**
  String get aboutP1;

  /// No description provided for @aboutP2.
  ///
  /// In en, this message translates to:
  /// **'I have experience independently designing and developing complete applications from the ground up, including mobile applications, web applications, backend services, REST APIs, database solutions, and third-party integrations. My work covers everything from planning and architecture to UI/UX implementation, application development, API integration, authentication, data management, testing, debugging, optimization, deployment, and production support.'**
  String get aboutP2;

  /// No description provided for @aboutP3.
  ///
  /// In en, this message translates to:
  /// **'My technical experience includes Flutter, Dart, Android Native, Java, JavaScript, TypeScript, React, React Native, Angular, ASP.NET, C#, .NET, HTML, CSS, jQuery, Ionic, Cordova, Python, SQL Server, Firebase, REST APIs, web services, JSON, cloud services, and various third-party SDKs and integrations. I also work with state management, application architecture, location-based services, maps, KML overlays, notifications, analytics, authentication, payment integrations, bilingual RTL/LTR, dark theme, and other modern application technologies.'**
  String get aboutP3;

  /// No description provided for @aboutP4.
  ///
  /// In en, this message translates to:
  /// **'I enjoy solving complex software engineering challenges and transforming ideas and requirements into practical, reliable, scalable, and maintainable solutions. I am particularly interested in mobile and web technologies and continuously explore new tools, frameworks, and development practices to improve the quality, performance, security, and usability of the applications I build.'**
  String get aboutP4;

  /// No description provided for @aboutP5.
  ///
  /// In en, this message translates to:
  /// **'Throughout my career, I have had the opportunity to work on a wide variety of projects and collaborate with talented teams while also taking complete ownership of projects independently. I enjoy learning from others, sharing knowledge, evaluating new technologies, and finding better and more efficient ways to solve technical problems.'**
  String get aboutP5;

  /// No description provided for @aboutP6.
  ///
  /// In en, this message translates to:
  /// **'I believe that great software is more than just well-written code. It is about understanding the problem, choosing the right technology, designing a great user experience, building a solid technical foundation, and delivering a solution that provides real and lasting value. I am always motivated by new challenges and opportunities to learn, build, innovate, and grow as a Software Engineer.'**
  String get aboutP6;

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

  /// No description provided for @expertiseMapsTitle.
  ///
  /// In en, this message translates to:
  /// **'Maps, KML & GIS'**
  String get expertiseMapsTitle;

  /// No description provided for @expertiseMapsBody.
  ///
  /// In en, this message translates to:
  /// **'Google Maps, Mapbox and Leaflet with KML/KMZ overlays, GeoJSON layers, multi-map configuration, clustering and operational GIS workflows.'**
  String get expertiseMapsBody;

  /// No description provided for @expertiseThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme & Product UI'**
  String get expertiseThemeTitle;

  /// No description provided for @expertiseThemeBody.
  ///
  /// In en, this message translates to:
  /// **'Dark, light and system themes with RTL-aware components, accessible contrast and persistent user preference.'**
  String get expertiseThemeBody;

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

  /// No description provided for @expertisePaymentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payments & Checkout'**
  String get expertisePaymentsTitle;

  /// No description provided for @expertisePaymentsBody.
  ///
  /// In en, this message translates to:
  /// **'In-app payments with Apple Pay, Google Pay and N-Genius, wired through secure APIs into store-listed products.'**
  String get expertisePaymentsBody;

  /// No description provided for @expertiseQualityTitle.
  ///
  /// In en, this message translates to:
  /// **'Quality, UAT & Production Care'**
  String get expertiseQualityTitle;

  /// No description provided for @expertiseQualityBody.
  ///
  /// In en, this message translates to:
  /// **'Debugging, UAT support, release notes, incident handling and the production care needed after go-live.'**
  String get expertiseQualityBody;

  /// No description provided for @expertiseMunicipalTitle.
  ///
  /// In en, this message translates to:
  /// **'Municipal Digital Products'**
  String get expertiseMunicipalTitle;

  /// No description provided for @expertiseMunicipalBody.
  ///
  /// In en, this message translates to:
  /// **'Operational platforms for inspections, land overlays, bilingual public services and field-to-office workflows.'**
  String get expertiseMunicipalBody;

  /// No description provided for @expertiseSignature.
  ///
  /// In en, this message translates to:
  /// **'Signature'**
  String get expertiseSignature;

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
  /// **'Skills grouped by the work I actually ship — maps, KML, RTL, payments, municipal platforms and the full stack.'**
  String get skillsLead;

  /// No description provided for @skillsSignature.
  ///
  /// In en, this message translates to:
  /// **'Signature practice'**
  String get skillsSignature;

  /// No description provided for @skillsAll.
  ///
  /// In en, this message translates to:
  /// **'All disciplines'**
  String get skillsAll;

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

  /// No description provided for @skillsMaps.
  ///
  /// In en, this message translates to:
  /// **'Maps & GIS'**
  String get skillsMaps;

  /// No description provided for @skillsProductUi.
  ///
  /// In en, this message translates to:
  /// **'Theme & product UI'**
  String get skillsProductUi;

  /// No description provided for @skillsDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery & operations'**
  String get skillsDelivery;

  /// No description provided for @skillsPayments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get skillsPayments;

  /// No description provided for @skillsQuality.
  ///
  /// In en, this message translates to:
  /// **'Quality & production'**
  String get skillsQuality;

  /// No description provided for @skillsMunicipal.
  ///
  /// In en, this message translates to:
  /// **'Municipal platforms'**
  String get skillsMunicipal;

  /// No description provided for @skillsField.
  ///
  /// In en, this message translates to:
  /// **'Field operations'**
  String get skillsField;

  /// No description provided for @skillsNotify.
  ///
  /// In en, this message translates to:
  /// **'Notifications & telemetry'**
  String get skillsNotify;

  /// No description provided for @skillsNative.
  ///
  /// In en, this message translates to:
  /// **'Android native & stores'**
  String get skillsNative;

  /// No description provided for @skillsReporting.
  ///
  /// In en, this message translates to:
  /// **'Reporting & SQL'**
  String get skillsReporting;

  /// No description provided for @skillsA11y.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get skillsA11y;

  /// No description provided for @skillsSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security & identity'**
  String get skillsSecurity;

  /// No description provided for @skillsArch.
  ///
  /// In en, this message translates to:
  /// **'Architecture & state'**
  String get skillsArch;

  /// No description provided for @skillsWorkflow.
  ///
  /// In en, this message translates to:
  /// **'Requests & SLA'**
  String get skillsWorkflow;

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

  /// No description provided for @projSearch.
  ///
  /// In en, this message translates to:
  /// **'Search projects…'**
  String get projSearch;

  /// No description provided for @noProjects.
  ///
  /// In en, this message translates to:
  /// **'No projects match this filter.'**
  String get noProjects;

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
  /// **'Certificates'**
  String get certsEyebrow;

  /// No description provided for @certsTitle.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get certsTitle;

  /// No description provided for @certsLead.
  ///
  /// In en, this message translates to:
  /// **'Confirmed training and course certificates. These are certificates of completion, not professional credentials.'**
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
  /// **'Degree, professional Flutter training and confirmed technical courses that support delivery.'**
  String get educationLead;

  /// No description provided for @navCredentials.
  ///
  /// In en, this message translates to:
  /// **'Credentials'**
  String get navCredentials;

  /// No description provided for @credEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Academic credentials'**
  String get credEyebrow;

  /// No description provided for @credTitle.
  ///
  /// In en, this message translates to:
  /// **'Degree, intermediate and UAE equivalency'**
  String get credTitle;

  /// No description provided for @credLead.
  ///
  /// In en, this message translates to:
  /// **'Original graduation and HSC files beside sample UAE equivalency layouts. These are placeholders — replace the files later with official scans.'**
  String get credLead;

  /// No description provided for @credOrig.
  ///
  /// In en, this message translates to:
  /// **'Originals'**
  String get credOrig;

  /// No description provided for @credUae.
  ///
  /// In en, this message translates to:
  /// **'UAE equivalency'**
  String get credUae;

  /// No description provided for @credSample.
  ///
  /// In en, this message translates to:
  /// **'Sample'**
  String get credSample;

  /// No description provided for @credView.
  ///
  /// In en, this message translates to:
  /// **'View sample'**
  String get credView;

  /// No description provided for @credRibbon.
  ///
  /// In en, this message translates to:
  /// **'Foil vault · live samples · drag to compare'**
  String get credRibbon;

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
  /// **'Open the designed CV, download a PDF, or browse every certificate, award and case study in Documents.'**
  String get cvLead;

  /// No description provided for @ctaOpenCv.
  ///
  /// In en, this message translates to:
  /// **'Open designed CV'**
  String get ctaOpenCv;

  /// No description provided for @docsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get docsEyebrow;

  /// No description provided for @docsTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents & files'**
  String get docsTitle;

  /// No description provided for @docsLead.
  ///
  /// In en, this message translates to:
  /// **'Certificates, awards, letters and case studies — open any file in a dedicated viewer, or launch the original in a new tab.'**
  String get docsLead;

  /// No description provided for @docsSearch.
  ///
  /// In en, this message translates to:
  /// **'Search files by name or type'**
  String get docsSearch;

  /// No description provided for @docsOpen.
  ///
  /// In en, this message translates to:
  /// **'Open file'**
  String get docsOpen;

  /// No description provided for @docsNewTab.
  ///
  /// In en, this message translates to:
  /// **'Full file'**
  String get docsNewTab;

  /// No description provided for @docsFilterCv.
  ///
  /// In en, this message translates to:
  /// **'CV'**
  String get docsFilterCv;

  /// No description provided for @docsFilterCerts.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get docsFilterCerts;

  /// No description provided for @docsFilterAwards.
  ///
  /// In en, this message translates to:
  /// **'Awards'**
  String get docsFilterAwards;

  /// No description provided for @docsFilterLetters.
  ///
  /// In en, this message translates to:
  /// **'Letters'**
  String get docsFilterLetters;

  /// No description provided for @docsFilterStudies.
  ///
  /// In en, this message translates to:
  /// **'Case studies'**
  String get docsFilterStudies;

  /// No description provided for @docsFilterOther.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get docsFilterOther;

  /// No description provided for @docsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} files'**
  String docsCount(int count);

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
  /// **'Share a short brief. It is saved to Firebase and I will reply by email.'**
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

  /// No description provided for @formSending.
  ///
  /// In en, this message translates to:
  /// **'Sending…'**
  String get formSending;

  /// No description provided for @formHint.
  ///
  /// In en, this message translates to:
  /// **'Your brief is stored in Firebase. I will follow up by email.'**
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

  /// No description provided for @formSuccess.
  ///
  /// In en, this message translates to:
  /// **'Thank you. I will reply shortly.'**
  String get formSuccess;

  /// No description provided for @formError.
  ///
  /// In en, this message translates to:
  /// **'Could not send just now. Please email me instead.'**
  String get formError;

  /// No description provided for @formFirebaseMissing.
  ///
  /// In en, this message translates to:
  /// **'Firebase is not configured yet. The form will open your email client.'**
  String get formFirebaseMissing;

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

  /// No description provided for @backToTop.
  ///
  /// In en, this message translates to:
  /// **'Back to top'**
  String get backToTop;

  /// No description provided for @notConfigured.
  ///
  /// In en, this message translates to:
  /// **'Not published yet'**
  String get notConfigured;

  /// No description provided for @copyEmail.
  ///
  /// In en, this message translates to:
  /// **'Copy email'**
  String get copyEmail;

  /// No description provided for @emailCopied.
  ///
  /// In en, this message translates to:
  /// **'Email copied'**
  String get emailCopied;

  /// No description provided for @copyFail.
  ///
  /// In en, this message translates to:
  /// **'Could not copy'**
  String get copyFail;

  /// No description provided for @greetMorn.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetMorn;

  /// No description provided for @greetAft.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetAft;

  /// No description provided for @greetEve.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetEve;

  /// No description provided for @saveContact.
  ///
  /// In en, this message translates to:
  /// **'Save contact'**
  String get saveContact;

  /// No description provided for @vcardCopied.
  ///
  /// In en, this message translates to:
  /// **'Contact card copied'**
  String get vcardCopied;

  /// No description provided for @formDraft.
  ///
  /// In en, this message translates to:
  /// **'Save draft'**
  String get formDraft;

  /// No description provided for @formClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get formClear;

  /// No description provided for @formDraftSaved.
  ///
  /// In en, this message translates to:
  /// **'Draft saved'**
  String get formDraftSaved;

  /// No description provided for @formDraftRestored.
  ///
  /// In en, this message translates to:
  /// **'Draft restored'**
  String get formDraftRestored;

  /// No description provided for @uaeClock.
  ///
  /// In en, this message translates to:
  /// **'Fujairah time'**
  String get uaeClock;
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
