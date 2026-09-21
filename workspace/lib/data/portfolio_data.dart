import 'package:flutter/material.dart';

import '../models/models.dart';

class PortfolioData {
  const PortfolioData._();

  static const String linkedInUrl =
      'https://www.linkedin.com/in/abdul-rehman-1602';

  static const Profile profile = Profile(
    name: 'Abdul Rehman',
    headline:
        'Software Engineer | Full Stack Developer | Core Mobile Application Developer',
    tagline:
        'Building reliable mobile, web, and backend solutions from idea to production.',
    yearsExperience: 9,
    linkedinUrl: linkedInUrl,
    qrDestination: linkedInUrl,
    cvAsset: 'cv.pdf',
    profileImage: 'assets/images/profile/profile.jpeg',
    languages: [],
    contact: ContactInfo(
      email: '',
      phone: '',
      location: '',
      linkedinUrl: linkedInUrl,
      githubUrl: '',
      formEndpoint: '',
    ),
    socialLinks: [
      SocialLink(
        kind: SocialKind.linkedin,
        label: 'LinkedIn',
        url: linkedInUrl,
        icon: Icons.business_center_outlined,
      ),
    ],
  );

  static const List<ExpertiseItem> expertise = [
    ExpertiseItem(
      id: 'mobile',
      titleKey: 'expertiseMobileTitle',
      bodyKey: 'expertiseMobileBody',
      iconName: 'phone_iphone',
    ),
    ExpertiseItem(
      id: 'fullstack',
      titleKey: 'expertiseFullStackTitle',
      bodyKey: 'expertiseFullStackBody',
      iconName: 'layers',
    ),
    ExpertiseItem(
      id: 'web',
      titleKey: 'expertiseWebTitle',
      bodyKey: 'expertiseWebBody',
      iconName: 'language',
    ),
    ExpertiseItem(
      id: 'api',
      titleKey: 'expertiseApiTitle',
      bodyKey: 'expertiseApiBody',
      iconName: 'hub',
    ),
    ExpertiseItem(
      id: 'database',
      titleKey: 'expertiseDatabaseTitle',
      bodyKey: 'expertiseDatabaseBody',
      iconName: 'storage',
    ),
    ExpertiseItem(
      id: 'integration',
      titleKey: 'expertiseIntegrationTitle',
      bodyKey: 'expertiseIntegrationBody',
      iconName: 'account_tree',
    ),
    ExpertiseItem(
      id: 'rtl',
      titleKey: 'expertiseRtlTitle',
      bodyKey: 'expertiseRtlBody',
      iconName: 'translate',
    ),
    ExpertiseItem(
      id: 'deploy',
      titleKey: 'expertiseDeployTitle',
      bodyKey: 'expertiseDeployBody',
      iconName: 'cloud_done',
    ),
  ];

  static const List<SkillGroup> skillGroups = [
    SkillGroup(
      id: 'mobile',
      titleKey: 'skillsMobile',
      iconName: 'smartphone',
      items: [
        'Flutter',
        'Dart',
        'Android Native',
        'Java',
        'React Native',
        'Ionic',
        'Cordova',
        'Firebase',
        'Maps',
        'GPS',
        'Push Notifications',
        'App Store',
        'Google Play',
      ],
    ),
    SkillGroup(
      id: 'web',
      titleKey: 'skillsWeb',
      iconName: 'web',
      items: [
        'HTML5',
        'CSS3',
        'JavaScript',
        'TypeScript',
        'React',
        'Angular',
        'jQuery',
        'Responsive Web Design',
      ],
    ),
    SkillGroup(
      id: 'backend',
      titleKey: 'skillsBackend',
      iconName: 'dns',
      items: [
        'ASP.NET',
        'C#',
        '.NET',
        'REST APIs',
        'Web Services',
        'JSON',
        'JWT',
        'Authentication',
        'Third-party APIs',
      ],
    ),
    SkillGroup(
      id: 'database',
      titleKey: 'skillsDatabase',
      iconName: 'table_chart',
      items: [
        'Microsoft SQL Server',
        'SQL',
        'Database Design',
        'Stored Procedures',
        'Query Optimization',
      ],
    ),
    SkillGroup(
      id: 'cloud',
      titleKey: 'skillsCloud',
      iconName: 'cloud',
      items: [
        'Firebase',
        'Analytics',
        'Cloud Messaging',
        'Remote Config',
        'Authentication',
        'Cloud Services',
        'Third-party SDKs',
      ],
    ),
    SkillGroup(
      id: 'other',
      titleKey: 'skillsOther',
      iconName: 'handyman',
      items: [
        'Python',
        'Machine Learning',
        'Git',
        'GitHub',
        'Architecture',
        'Debugging',
        'Performance Optimization',
        'Deployment',
      ],
    ),
    SkillGroup(
      id: 'i18n',
      titleKey: 'skillsI18n',
      iconName: 'translate',
      items: [
        'Flutter Localization',
        'i18n',
        'l10n',
        'Arabic/English',
        'RTL/LTR',
        'Multilingual UI',
      ],
    ),
  ];

  static const List<Experience> experience = [
    Experience(
      id: 'fujairah-municipality',
      company: LocalizedText(
        en: 'Fujairah Municipality',
        ar: 'بلدية الفجيرة',
      ),
      position: LocalizedText(
        en: 'Software Engineer',
        ar: 'مهندس برمجيات',
      ),
      dates: LocalizedText(
        en: 'Dates to be published from verified records',
        ar: 'سيتم نشر التواريخ من السجلات الموثقة',
      ),
      description: LocalizedText(
        en: 'Confirmed professional experience with Fujairah Municipality. Specific job title, employment dates, and day-to-day responsibilities will be published here only from verified records.',
        ar: 'خبرة مهنية مؤكدة مع بلدية الفجيرة. سيتم نشر المسمى الوظيفي وتواريخ العمل والمسؤوليات اليومية هنا فقط من السجلات الموثقة.',
      ),
      responsibilities: LocalizedList(
        en: [
          'Full software lifecycle ownership across mobile, web, API/backend and database work.',
          'Application integration, deployment and production support.',
          'Detailed responsibilities will be added when independently confirmed.',
        ],
        ar: [
          'ملكية دورة حياة البرمجيات كاملة عبر الجوال والويب وواجهات البرمجة وقاعدة البيانات.',
          'تكامل التطبيقات والنشر والدعم الإنتاجي.',
          'ستُضاف المسؤوليات التفصيلية عند تأكيدها بشكل مستقل.',
        ],
      ),
      technologies: [
        'Flutter',
        'Full Stack',
        'APIs',
        'Databases',
      ],
      confirmed: true,
    ),
  ];

  static const List<Project> projects = [
    Project(
      id: 'placeholder-mobile',
      name: LocalizedText(
        en: 'Sample Mobile Application',
        ar: 'تطبيق جوال نموذجي',
      ),
      description: LocalizedText(
        en: 'Placeholder entry. Replace this card with a real mobile product, screenshots and store links when they are ready to publish.',
        ar: 'عنصر نائب. استبدل هذه البطاقة بمنتج جوال حقيقي ولقطات وروابط المتاجر عند جاهزيتها للنشر.',
      ),
      category: ProjectCategory.mobile,
      technologies: ['Flutter', 'Dart', 'Firebase'],
      features: LocalizedList(
        en: ['Configurable placeholder', 'No invented product facts'],
        ar: ['عنصر نائب قابل للتهيئة', 'بدون حقائق منتج مختلقة'],
      ),
      responsibilities: LocalizedList(
        en: ['To be completed from verified delivery records'],
        ar: ['يُستكمل من سجلات التسليم الموثقة'],
      ),
      imageAsset: 'assets/images/projects/sample-mobile.png',
      screenshots: [
        'assets/images/screenshots/sample-1.png',
        'assets/images/screenshots/sample-2.png',
      ],
      featured: true,
      isPlaceholder: true,
    ),
    Project(
      id: 'placeholder-web',
      name: LocalizedText(
        en: 'Sample Web Application',
        ar: 'تطبيق ويب نموذجي',
      ),
      description: LocalizedText(
        en: 'Placeholder entry for a web product. Add the live URL and a concise, verified description when available.',
        ar: 'عنصر نائب لتطبيق ويب. أضف الرابط الحي ووصفاً موجزاً موثقاً عند التوفر.',
      ),
      category: ProjectCategory.web,
      technologies: ['HTML5', 'CSS3', 'JavaScript', 'TypeScript'],
      features: LocalizedList(
        en: ['Responsive layout', 'Configurable content'],
        ar: ['تخطيط متجاوب', 'محتوى قابل للتهيئة'],
      ),
      responsibilities: LocalizedList(
        en: ['To be completed from verified delivery records'],
        ar: ['يُستكمل من سجلات التسليم الموثقة'],
      ),
      imageAsset: 'assets/images/projects/sample-web.png',
      isPlaceholder: true,
    ),
    Project(
      id: 'placeholder-fullstack',
      name: LocalizedText(
        en: 'Sample Full-Stack Solution',
        ar: 'حل متكامل نموذجي',
      ),
      description: LocalizedText(
        en: 'Placeholder for an end-to-end solution covering client, API and database. Replace with a confirmed case study.',
        ar: 'عنصر نائب لحل شامل يغطي العميل وواجهة البرمجة وقاعدة البيانات. استبدله بدراسة حالة مؤكدة.',
      ),
      category: ProjectCategory.fullStack,
      technologies: ['Flutter', 'ASP.NET', 'C#', 'SQL Server'],
      features: LocalizedList(
        en: ['Client, API and data layer', 'Placeholder only'],
        ar: ['العميل وواجهة البرمجة وطبقة البيانات', 'عنصر نائب فقط'],
      ),
      responsibilities: LocalizedList(
        en: ['Architecture through deployment — details pending confirmation'],
        ar: ['من الهندسة حتى النشر — التفاصيل بانتظار التأكيد'],
      ),
      imageAsset: 'assets/images/projects/sample-fullstack.png',
      featured: true,
      isPlaceholder: true,
    ),
    Project(
      id: 'placeholder-api',
      name: LocalizedText(
        en: 'Sample API Service',
        ar: 'خدمة واجهة برمجة نموذجية',
      ),
      description: LocalizedText(
        en: 'Placeholder for a backend or API engagement. Do not treat this as a published product.',
        ar: 'عنصر نائب لعمل خلفي أو واجهة برمجة. لا يُعامل كمنتج منشور.',
      ),
      category: ProjectCategory.api,
      technologies: ['ASP.NET', 'REST', 'JWT', 'JSON'],
      features: LocalizedList(
        en: ['REST contract', 'Authentication placeholder'],
        ar: ['عقد REST', 'عنصر مصادقة نائب'],
      ),
      responsibilities: LocalizedList(
        en: ['To be completed from verified delivery records'],
        ar: ['يُستكمل من سجلات التسليم الموثقة'],
      ),
      imageAsset: 'assets/images/projects/sample-api.png',
      isPlaceholder: true,
    ),
  ];

  static const List<PublishedApplication> applications = [
    PublishedApplication(
      id: 'placeholder-app-1',
      name: LocalizedText(
        en: 'Sample Published Application',
        ar: 'تطبيق منشور نموذجي',
      ),
      description: LocalizedText(
        en: 'Placeholder listing. Add the real application name, store URLs and screenshots when they are confirmed.',
        ar: 'قائمة نائبة. أضف اسم التطبيق الحقيقي وروابط المتاجر واللقطات عند تأكيدها.',
      ),
      technologies: ['Flutter', 'Firebase'],
      iconAsset: 'assets/images/apps/sample-app-1.png',
      screenshots: [
        'assets/images/screenshots/sample-1.png',
        'assets/images/screenshots/sample-2.png',
        'assets/images/screenshots/sample-3.png',
      ],
      isPlaceholder: true,
    ),
  ];

  static const List<Certification> certifications = [
    Certification(
      id: 'placeholder-cert',
      title: LocalizedText(
        en: 'Certification slot',
        ar: 'خانة شهادة',
      ),
      organization: LocalizedText(
        en: 'Issuing organization to be confirmed',
        ar: 'الجهة المُصدِرة بانتظار التأكيد',
      ),
      date: LocalizedText(
        en: 'Date pending verification',
        ar: 'التاريخ بانتظار التحقق',
      ),
      description: LocalizedText(
        en: 'No certifications are listed until independently confirmed. Replace this placeholder with the credential title, issuer, date and URL.',
        ar: 'لا تُدرج شهادات حتى تأكيدها بشكل مستقل. استبدل هذا العنصر بعنوان الشهادة والجهة والتاريخ والرابط.',
      ),
      imageAsset: 'assets/images/certificates/placeholder.png',
      isPlaceholder: true,
    ),
  ];

  static const List<Award> awards = [
    Award(
      id: 'placeholder-award',
      title: LocalizedText(
        en: 'Achievement slot',
        ar: 'خانة إنجاز',
      ),
      organization: LocalizedText(
        en: 'Organization to be confirmed',
        ar: 'الجهة بانتظار التأكيد',
      ),
      date: LocalizedText(
        en: 'Date pending verification',
        ar: 'التاريخ بانتظار التحقق',
      ),
      description: LocalizedText(
        en: 'Awards and achievements will appear here only when independently confirmed. This card is a layout placeholder.',
        ar: 'ستظهر الجوائز والإنجازات هنا فقط عند تأكيدها بشكل مستقل. هذه البطاقة عنصر تخطيط نائب.',
      ),
      imageAsset: 'assets/images/awards/placeholder.png',
      isPlaceholder: true,
    ),
  ];

  static const List<Education> education = [
    Education(
      id: 'placeholder-education',
      institution: LocalizedText(
        en: 'Institution to be confirmed',
        ar: 'المؤسسة بانتظار التأكيد',
      ),
      degree: LocalizedText(
        en: 'Qualification to be published from verified records',
        ar: 'المؤهل سيُنشر من السجلات الموثقة',
      ),
      dates: LocalizedText(
        en: 'Dates pending verification',
        ar: 'التواريخ بانتظار التحقق',
      ),
      description: LocalizedText(
        en: 'Education details were not independently available at the time of publishing this site. They will be added from confirmed records only.',
        ar: 'تفاصيل التعليم لم تكن متاحة بشكل مستقل عند نشر هذا الموقع. ستُضاف من السجلات المؤكدة فقط.',
      ),
      confirmed: false,
      isPlaceholder: true,
    ),
  ];

  static const List<ArchitectureStep> architecture = [
    ArchitectureStep(
      id: 'frontend',
      titleKey: 'archFrontendTitle',
      bodyKey: 'archFrontendBody',
      iconName: 'devices',
    ),
    ArchitectureStep(
      id: 'backend',
      titleKey: 'archBackendTitle',
      bodyKey: 'archBackendBody',
      iconName: 'api',
    ),
    ArchitectureStep(
      id: 'database',
      titleKey: 'archDatabaseTitle',
      bodyKey: 'archDatabaseBody',
      iconName: 'storage',
    ),
    ArchitectureStep(
      id: 'services',
      titleKey: 'archServicesTitle',
      bodyKey: 'archServicesBody',
      iconName: 'extension',
    ),
    ArchitectureStep(
      id: 'deploy',
      titleKey: 'archDeployTitle',
      bodyKey: 'archDeployBody',
      iconName: 'rocket_launch',
    ),
  ];
}

class ArchitectureStep {
  const ArchitectureStep({
    required this.id,
    required this.titleKey,
    required this.bodyKey,
    required this.iconName,
  });

  final String id;
  final String titleKey;
  final String bodyKey;
  final String iconName;
}
