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
    // ============================================================
    // SMART FUJAIRAH
    // ============================================================
    Project(
      id: 'smart-fujairah',
      name: LocalizedText(
        en: 'smartFUJAIRAH',
        ar: 'سمارت الفجيرة',
      ),
      description: LocalizedText(
        en: 'A comprehensive digital government mobile platform developed for Fujairah Municipality, bringing municipal services, customer requests, payments, land services, notifications, documents and other smart services into a unified mobile experience.',
        ar: 'منصة حكومية رقمية متكاملة تم تطويرها لبلدية الفجيرة، تجمع الخدمات البلدية وطلبات العملاء والمدفوعات وخدمات الأراضي والإشعارات والمستندات وغيرها من الخدمات الذكية ضمن تجربة موحدة عبر الهاتف المحمول.',
      ),
      category: ProjectCategory.mobile,
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'JWT',
        'Riverpod',
        'GoRouter',
        'Google Maps',
        'Mapbox',
        'Leaflet',
        'Apple Pay',
        'Google Pay',
        'N-Genius',
      ],
      features: LocalizedList(
        en: [
          'Municipality Services',
          'Service Requests',
          'Request Tracking',
          'My Land',
          'Land Services',
          'Customer Wallet',
          'Online Payments',
          'Apple Pay & Google Pay',
          'Push Notifications',
          'Document Upload & Download',
          'ThinkGreen Inspection',
          'Fazzah',
          'Maps & Location Services',
          'Arabic & English',
          'RTL / LTR Support',
        ],
        ar: [
          'الخدمات البلدية',
          'الطلبات والخدمات',
          'تتبع الطلبات',
          'أراضيّ',
          'خدمات الأراضي',
          'محفظة العميل',
          'المدفوعات الإلكترونية',
          'Apple Pay وGoogle Pay',
          'الإشعارات الفورية',
          'رفع وتنزيل المستندات',
          'تفتيش ThinkGreen',
          'فزعة',
          'الخرائط وخدمات الموقع',
          'العربية والإنجليزية',
          'دعم RTL / LTR',
        ],
      ),
      responsibilities: LocalizedList(
        en: [
          'Flutter mobile application development',
          'UI and responsive interface implementation',
          'REST API integration',
          'Authentication and JWT integration',
          'Payment gateway integration',
          'Apple Pay and Google Pay integration',
          'Maps and location-based functionality',
          'Firebase integration',
          'Feature development and maintenance',
          'Debugging, testing and performance improvements',
        ],
        ar: [
          'تطوير تطبيق الهاتف باستخدام Flutter',
          'تنفيذ واجهات المستخدم والتصميم المتجاوب',
          'تكامل REST API',
          'تكامل المصادقة وJWT',
          'تكامل بوابات الدفع',
          'تكامل Apple Pay وGoogle Pay',
          'تطوير الخرائط والوظائف المعتمدة على الموقع',
          'تكامل Firebase',
          'تطوير وصيانة الميزات',
          'حل المشكلات والاختبار وتحسين الأداء',
        ],
      ),
      imageAsset: 'assets/images/apps/smart-fujairah.png',
      screenshots: [
        'assets/images/screenshots/smart-fujairah-1.jpeg',
        'assets/images/screenshots/smart-fujairah-2.jpeg',
        'assets/images/screenshots/smart-fujairah-3.jpeg',
        'assets/images/screenshots/smart-fujairah-4.jpeg',
        'assets/images/screenshots/smart-fujairah-5.jpeg',
      ],
      featured: true,
      isPlaceholder: false,
    ),

    // ============================================================
    // FWMD / THINK GREEN
    // ============================================================
    Project(
      id: 'fwmd',
      name: LocalizedText(
        en: 'FWMD – Fujairah Waste Management System',
        ar: 'FWMD – نظام إدارة النفايات في الفجيرة',
      ),
      description: LocalizedText(
        en: 'A web-based environmental and waste-management platform for Fujairah Municipality supporting operational workflows including waste management, inspections, collection requests, assignments, records, search, filtering and location-based operations.',
        ar: 'منصة إلكترونية للإدارة البيئية وإدارة النفايات تابعة لبلدية الفجيرة، تدعم العمليات التشغيلية بما في ذلك إدارة النفايات وعمليات التفتيش وطلبات الجمع والتكليفات والسجلات والبحث والتصفية والعمليات المرتبطة بالمواقع.',
      ),
      category: ProjectCategory.web,
      technologies: [
        'ASP.NET',
        'C#',
        'JavaScript',
        'jQuery',
        'AJAX',
        'REST APIs',
        'SQL Server',
        'Google Maps',
        'Leaflet',
        'JWT',
      ],
      features: LocalizedList(
        en: [
          'Waste Management',
          'Environmental Management',
          'Inspection Workflows',
          'Collection Requests',
          'Collection Assignments',
          'Request Management',
          'Operational Records',
          'Search & Filtering',
          'Location Tracking',
          'Interactive Maps',
          'Google Maps Integration',
          'Leaflet Maps',
          'Arabic & English Support',
        ],
        ar: [
          'إدارة النفايات',
          'الإدارة البيئية',
          'سير عمل التفتيش',
          'طلبات جمع النفايات',
          'تكليفات الجمع',
          'إدارة الطلبات',
          'السجلات التشغيلية',
          'البحث والتصفية',
          'تتبع المواقع',
          'الخرائط التفاعلية',
          'تكامل Google Maps',
          'خرائط Leaflet',
          'دعم العربية والإنجليزية',
        ],
      ),
      responsibilities: LocalizedList(
        en: [
          'Web application development and maintenance',
          'ASP.NET and C# development',
          'Interactive JavaScript and jQuery interfaces',
          'REST API integration',
          'SQL Server data integration',
          'Waste collection workflow development',
          'Inspection and operational workflow implementation',
          'Google Maps and Leaflet integration',
          'Search and filtering functionality',
          'Debugging and production support',
        ],
        ar: [
          'تطوير وصيانة تطبيق الويب',
          'تطوير ASP.NET وC#',
          'تطوير الواجهات التفاعلية باستخدام JavaScript وjQuery',
          'تكامل REST API',
          'تكامل البيانات مع SQL Server',
          'تطوير سير عمل جمع النفايات',
          'تنفيذ عمليات التفتيش والعمليات التشغيلية',
          'تكامل Google Maps وLeaflet',
          'تطوير وظائف البحث والتصفية',
          'حل المشكلات والدعم الإنتاجي',
        ],
      ),
      imageAsset: 'assets/images/apps/fwmd.png',
      screenshots: [
        'assets/images/screenshots/fwmd-1.png',
        'assets/images/screenshots/fwmd-2.png',
        'assets/images/screenshots/fwmd-3.png',
        'assets/images/screenshots/fwmd-4.png',
      ],
      featured: true,
      isPlaceholder: false,
    ),

    // ============================================================
    // SAMPLE FUTURE PROJECT
    // ============================================================
    Project(
      id: 'placeholder-project',
      name: LocalizedText(
        en: 'Sample Future Project',
        ar: 'مشروع مستقبلي نموذجي',
      ),
      description: LocalizedText(
        en: 'Placeholder for a future verified project. Add the project name, description, technologies, screenshots and responsibilities when the project is ready to be published.',
        ar: 'عنصر نائب لمشروع مستقبلي موثق. أضف اسم المشروع والوصف والتقنيات ولقطات الشاشة والمسؤوليات عند جاهزية المشروع للنشر.',
      ),
      category: ProjectCategory.fullStack,
      technologies: [
        'Flutter',
        'ASP.NET',
        'C#',
        'SQL Server',
      ],
      features: LocalizedList(
        en: [
          'Project details to be added',
          'Technology stack to be confirmed',
          'Screenshots to be added',
        ],
        ar: [
          'ستتم إضافة تفاصيل المشروع',
          'سيتم تأكيد مجموعة التقنيات',
          'ستتم إضافة لقطات الشاشة',
        ],
      ),
      responsibilities: LocalizedList(
        en: [
          'Project responsibilities will be added from verified records.',
        ],
        ar: [
          'ستتم إضافة مسؤوليات المشروع من السجلات الموثقة.',
        ],
      ),
      imageAsset: 'assets/images/projects/sample-fullstack.png',
      featured: false,
      isPlaceholder: true,
    ),

// ============================================================
// MUNICIPALITY DIGITAL SERVICES – FULL STACK
// ============================================================
    Project(
      id: 'municipality-digital-services',
      name: LocalizedText(
        en: 'Municipality Digital Services – Full-Stack Solution',
        ar: 'الخدمات الرقمية البلدية – حل متكامل',
      ),
      description: LocalizedText(
        en: 'An end-to-end digital services solution connecting a modern client application with backend APIs and SQL Server data services. The solution demonstrates the complete software lifecycle from user interface and authentication through API integration, business workflows, data processing and deployment.',
        ar: 'حل متكامل للخدمات الرقمية يربط تطبيقاً حديثاً بواجهات برمجة خلفية وخدمات بيانات SQL Server. يوضح الحل دورة حياة البرمجيات الكاملة بدءاً من واجهة المستخدم والمصادقة وصولاً إلى تكامل API وسير العمل ومعالجة البيانات والنشر.',
      ),
      category: ProjectCategory.fullStack,
      technologies: [
        'Flutter',
        'Dart',
        'ASP.NET',
        'C#',
        '.NET',
        'REST APIs',
        'SQL Server',
        'Firebase',
        'JWT',
        'JSON',
        'Google Maps',
      ],
      features: LocalizedList(
        en: [
          'Cross-Platform Mobile Application',
          'Responsive User Interface',
          'REST API Integration',
          'JWT Authentication',
          'Role-Based Access',
          'Business Workflow Management',
          'SQL Server Data Management',
          'Document Upload & Download',
          'Location & Map Integration',
          'Push Notifications',
          'Arabic & English Localization',
          'RTL / LTR Support',
          'Error Handling & Validation',
          'Production Monitoring & Debugging',
        ],
        ar: [
          'تطبيق جوال متعدد المنصات',
          'واجهة مستخدم متجاوبة',
          'تكامل REST API',
          'مصادقة JWT',
          'صلاحيات حسب الأدوار',
          'إدارة سير العمل',
          'إدارة بيانات SQL Server',
          'رفع وتنزيل المستندات',
          'تكامل المواقع والخرائط',
          'الإشعارات الفورية',
          'دعم العربية والإنجليزية',
          'دعم RTL / LTR',
          'معالجة الأخطاء والتحقق',
          'المراقبة وتصحيح الأخطاء في بيئة الإنتاج',
        ],
      ),
      responsibilities: LocalizedList(
        en: [
          'Full-stack application architecture and development',
          'Flutter UI and feature implementation',
          'ASP.NET and C# backend development',
          'REST API design and integration',
          'JWT authentication and authorization',
          'SQL Server database integration',
          'Business logic implementation',
          'Third-party service integration',
          'Maps and location-based functionality',
          'Firebase service integration',
          'Testing, debugging and performance optimization',
          'Production deployment and support',
        ],
        ar: [
          'هندسة وتطوير الحل المتكامل',
          'تطوير واجهات وميزات Flutter',
          'تطوير Backend باستخدام ASP.NET وC#',
          'تصميم وتكامل REST API',
          'المصادقة والتفويض باستخدام JWT',
          'تكامل قاعدة بيانات SQL Server',
          'تنفيذ منطق الأعمال',
          'تكامل الخدمات الخارجية',
          'تطوير الخرائط والوظائف المعتمدة على الموقع',
          'تكامل خدمات Firebase',
          'الاختبار وتصحيح الأخطاء وتحسين الأداء',
          'النشر والدعم في بيئة الإنتاج',
        ],
      ),
      imageAsset: 'assets/images/projects/sample-fullstack.png',
      screenshots: [
        'assets/images/screenshots/smart-fujairah-1.jpeg',
        'assets/images/screenshots/smart-fujairah-2.jpeg',
        'assets/images/screenshots/smart-fujairah-3.jpeg',
      ],
      featured: true,
      isPlaceholder: false,
    ),

// ============================================================
// MUNICIPALITY SERVICES API PLATFORM
// ============================================================
    Project(
      id: 'municipality-api-platform',
      name: LocalizedText(
        en: 'Municipality Services API Platform',
        ar: 'منصة واجهات برمجة الخدمات البلدية',
      ),
      description: LocalizedText(
        en: 'A backend API platform designed to connect mobile and web applications with centralized municipal services and data. The API layer handles authentication, service requests, business operations, data retrieval, document workflows and integration with external services.',
        ar: 'منصة خلفية لواجهات البرمجة مصممة لربط تطبيقات الهاتف والويب بالخدمات والبيانات البلدية المركزية. تتولى طبقة API المصادقة وطلبات الخدمات وعمليات الأعمال واسترجاع البيانات وسير عمل المستندات والتكامل مع الخدمات الخارجية.',
      ),
      category: ProjectCategory.api,
      technologies: [
        'ASP.NET',
        'C#',
        '.NET',
        'REST API',
        'JSON',
        'JWT',
        'SQL Server',
        'AJAX',
        'Firebase',
        'Third-Party APIs',
      ],
      features: LocalizedList(
        en: [
          'RESTful API Architecture',
          'JWT Authentication',
          'Secure API Endpoints',
          'Request & Response Validation',
          'JSON Data Exchange',
          'SQL Server Integration',
          'Business Logic Layer',
          'Service Request Management',
          'Document Processing',
          'External API Integration',
          'Error Handling',
          'Logging & Diagnostics',
          'Mobile & Web Client Support',
        ],
        ar: [
          'هندسة RESTful API',
          'مصادقة JWT',
          'واجهات API آمنة',
          'التحقق من الطلبات والاستجابات',
          'تبادل البيانات بصيغة JSON',
          'تكامل SQL Server',
          'طبقة منطق الأعمال',
          'إدارة طلبات الخدمات',
          'معالجة المستندات',
          'تكامل واجهات API الخارجية',
          'معالجة الأخطاء',
          'التسجيل والتشخيص',
          'دعم تطبيقات الهاتف والويب',
        ],
      ),
      responsibilities: LocalizedList(
        en: [
          'Backend API development using ASP.NET and C#',
          'REST endpoint implementation',
          'Authentication and JWT integration',
          'Database queries and stored procedures',
          'Business logic implementation',
          'API request and response handling',
          'Mobile and web application integration',
          'Third-party API integration',
          'Error handling and debugging',
          'Performance and query optimization',
          'Production troubleshooting and support',
        ],
        ar: [
          'تطوير Backend باستخدام ASP.NET وC#',
          'تنفيذ نقاط REST API',
          'تكامل المصادقة وJWT',
          'استعلامات قاعدة البيانات والإجراءات المخزنة',
          'تنفيذ منطق الأعمال',
          'معالجة طلبات واستجابات API',
          'تكامل تطبيقات الهاتف والويب',
          'تكامل واجهات API الخارجية',
          'معالجة الأخطاء وتصحيح المشكلات',
          'تحسين الأداء والاستعلامات',
          'استكشاف مشكلات الإنتاج والدعم',
        ],
      ),
      imageAsset: 'assets/images/projects/sample-api.png',
      screenshots: [
        'assets/images/screenshots/api-1.png',
        'assets/images/screenshots/api-2.png',
      ],
      featured: false,
      isPlaceholder: false,
    ),
  ];
  static const List<AppreciationCertificate> appreciations = [
    AppreciationCertificate(
      id: 'appreciation-think-green',
      title: LocalizedText(
        en: 'Certificate of Appreciation – Think Green Application',
        ar: 'شهادة تقدير – تطبيق Think Green',
      ),
      organization: LocalizedText(
        en: 'Fujairah Municipality',
        ar: 'بلدية الفجيرة',
      ),
      date: LocalizedText(
        en: '2018 – Year of Zayed',
        ar: '2018 – عام زايد',
      ),
      description: LocalizedText(
        en: 'Received a certificate of appreciation from Fujairah Municipality, signed by Director General Mr. Mohammed Saif Al Afkham, in recognition of efforts to make the "Think Green application" successful.',
        ar: 'حصلت على شهادة تقدير من بلدية الفجيرة، بتوقيع المدير العام السيد محمد سيف الأفخم، تقديراً للجهود المبذولة في إنجاح تطبيق "Think Green".',
      ),
      imageAsset: 'assets/images/appreciations/think-green-appreciation.jpg',
      isPlaceholder: false,
    ),
    AppreciationCertificate(
      id: 'appreciation-fekraty-logo',
      title: LocalizedText(
        en: 'Certificate of Appreciation – Fekraty Logo Design Competition',
        ar: 'شهادة تقدير – مسابقة تصميم شعار نظام فكرتي',
      ),
      organization: LocalizedText(
        en: 'Fujairah Municipality',
        ar: 'بلدية الفجيرة',
      ),
      date: LocalizedText(
        en: 'Professional Achievement',
        ar: 'إنجاز مهني',
      ),
      description: LocalizedText(
        en: 'Received a certificate of appreciation from Fujairah Municipality, signed by Director General Mr. Mohammed Saif Al Afkham, in recognition of distinguished efforts and active participation in the "Fekraty System Logo Design" competition.',
        ar: 'حصلت على شهادة تقدير من بلدية الفجيرة، بتوقيع المدير العام السيد محمد سيف الأفخم، تثميناً للجهود المتميزة والمشاركة الفعالة في مسابقة تصميم شعار نظام فكرتي.',
      ),
      imageAsset: 'assets/images/appreciations/fekraty-logo-appreciation.jpg',
      isPlaceholder: false,
    ),

    // Add more appreciation certificates here
  ];

  static const List<PublishedApplication> applications = [
    // ============================================================
    // SMART FUJAIRAH
    // ============================================================
    PublishedApplication(
      id: 'smart-fujairah',
      name: LocalizedText(
        en: 'smartFUJAIRAH',
        ar: 'سمارت الفجيرة',
      ),
      subtitle: LocalizedText(
        en: 'Official Fujairah Municipality Digital Services Platform',
        ar: 'منصة الخدمات الرقمية الرسمية لبلدية الفجيرة',
      ),
      description: LocalizedText(
        en: 'smartFUJAIRAH is a comprehensive digital government platform developed for Fujairah Municipality, bringing multiple municipal services and customer-facing digital experiences into a unified mobile application. The platform supports bilingual Arabic and English experiences and provides citizens and customers with convenient access to municipal services, requests, payments, notifications, land services, documents and other smart services.',
        ar: 'سمارت الفجيرة هي منصة رقمية متكاملة تم تطويرها لبلدية الفجيرة، وتجمع مجموعة من الخدمات البلدية والتجارب الرقمية الموجهة للعملاء ضمن تطبيق موحد. تدعم المنصة اللغتين العربية والإنجليزية وتوفر للمستخدمين إمكانية الوصول بسهولة إلى الخدمات البلدية والطلبات والمدفوعات والإشعارات وخدمات الأراضي والمستندات وغيرها من الخدمات الذكية.',
      ),
      role: LocalizedText(
        en: 'Software Engineer / Flutter Developer — responsible for mobile application development, UI implementation, API integration, feature development, troubleshooting, testing and continuous improvements across the platform.',
        ar: 'مهندس برمجيات / مطور Flutter — مسؤول عن تطوير تطبيق الهاتف المحمول وتنفيذ واجهات المستخدم وتكامل واجهات API وتطوير الميزات وحل المشكلات والاختبار والتحسين المستمر للمنصة.',
      ),
      impact: LocalizedText(
        en: 'Contributes to the digital transformation of municipal services by providing customers with a centralized mobile channel for accessing and managing government services.',
        ar: 'يساهم في التحول الرقمي للخدمات البلدية من خلال توفير قناة موحدة عبر الهاتف للوصول إلى الخدمات الحكومية وإدارتها.',
      ),
      technologies: [
        'Flutter',
        'Dart',
        'REST APIs',
        'Firebase',
        'JWT Authentication',
        'Google Maps',
        'Mapbox',
        'Leaflet',
        'Apple Pay',
        'Google Pay',
        'N-Genius',
        'Riverpod',
        'GoRouter',
      ],
      platforms: [
        'Android',
        'iOS',
      ],
      features: [
        'Municipality Services',
        'Service Requests',
        'Request Tracking',
        'My Land',
        'Land Services',
        'Customer Wallet',
        'Online Payments',
        'Apple Pay',
        'Google Pay',
        'Notifications',
        'Document Upload & Download',
        'ThinkGreen Inspection',
        'Fazzah',
        'Maps & Location Services',
        'Arabic & English Support',
        'RTL / LTR Support',
        'Firebase Integration',
      ],
      iconAsset: 'assets/images/apps/smart-fujairah.png',
      screenshots: [
        'assets/images/screenshots/smart-fujairah-1.jpeg',
        'assets/images/screenshots/smart-fujairah-2.jpeg',
        'assets/images/screenshots/smart-fujairah-3.jpeg',
        'assets/images/screenshots/smart-fujairah-4.jpeg',
        'assets/images/screenshots/smart-fujairah-5.jpeg',
      ],
      appStoreUrl: 'https://apps.apple.com/ae/app/smartfujairah/id1373129135',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=gov.ae.fujmun.smartfujairah',
      isFeatured: true,
      isPlaceholder: false,
    ),

    // ============================================================
    // FWMD / THINK GREEN
    // ============================================================
    PublishedApplication(
      id: 'fwmd',
      name: LocalizedText(
        en: 'FWMD – Fujairah Waste Management System',
        ar: 'FWMD – نظام إدارة النفايات في الفجيرة',
      ),
      subtitle: LocalizedText(
        en: 'Think Green – Smart Environmental Management',
        ar: 'Think Green – الإدارة البيئية الذكية',
      ),
      description: LocalizedText(
        en: 'FWMD is a web-based Fujairah Municipality environmental and waste-management platform designed to support operational workflows and digital management of waste-related activities. The system provides centralized management of requests, assignments, inspections, collection operations, records and location-based information.',
        ar: 'FWMD هي منصة إلكترونية تابعة لبلدية الفجيرة للإدارة البيئية وإدارة النفايات، تم تصميمها لدعم العمليات التشغيلية والإدارة الرقمية للأنشطة المتعلقة بالنفايات. يوفر النظام إدارة مركزية للطلبات والتكليفات وعمليات التفتيش والجمع والسجلات والمعلومات المرتبطة بالمواقع.',
      ),
      role: LocalizedText(
        en: 'Software Engineer / Web Application Developer — involved in developing and maintaining web-based operational modules, API integrations, interactive interfaces, data workflows and location-based functionality.',
        ar: 'مهندس برمجيات / مطور تطبيقات ويب — المساهمة في تطوير وصيانة الوحدات التشغيلية الإلكترونية وتكامل واجهات API والواجهات التفاعلية وسير عمل البيانات والوظائف المرتبطة بالمواقع.',
      ),
      impact: LocalizedText(
        en: 'Supports the digital management of environmental and waste-management operations through centralized workflows and operational data.',
        ar: 'يدعم الإدارة الرقمية للعمليات البيئية وعمليات إدارة النفايات من خلال سير عمل مركزي وبيانات تشغيلية موحدة.',
      ),
      technologies: [
        'ASP.NET',
        'C#',
        'JavaScript',
        'jQuery',
        'REST APIs',
        'SQL Server',
        'Google Maps',
        'Leaflet',
        'AJAX',
        'JWT Authentication',
      ],
      platforms: [
        'Web',
        'Desktop Browser',
        'Responsive Web',
      ],
      features: [
        'Waste Management',
        'Environmental Management',
        'Inspection Workflows',
        'Collection Requests',
        'Collection Assignments',
        'Request Management',
        'Operational Records',
        'Search & Filtering',
        'Location Tracking',
        'Interactive Maps',
        'Google Maps Integration',
        'Leaflet Maps',
        'Arabic & English Support',
      ],
      iconAsset: 'assets/images/apps/fwmd.png',
      screenshots: [
        'assets/images/screenshots/fwmd-1.png',
        'assets/images/screenshots/fwmd-2.png',
        'assets/images/screenshots/fwmd-3.png',
        'assets/images/screenshots/fwmd-4.png',
      ],
      demoUrl: 'https://portal.fujmun.gov.ae/fwmd/pages/LoginPage.aspx',
      isFeatured: true,
      isPlaceholder: false,
    ),
  ];

  static const List<Certification> certifications = [
    Certification(
      id: 'flutter-mobile-development',
      title: LocalizedText(
        en: 'Mobile Development Using Flutter',
        ar: 'تطوير تطبيقات الهاتف المحمول باستخدام Flutter',
      ),
      organization: LocalizedText(
        en: 'Vinsys Arabia',
        ar: 'فينسيس العربية',
      ),
      date: LocalizedText(
        en: 'March 23–27, 2026',
        ar: '23–27 مارس 2026',
      ),
      description: LocalizedText(
        en: 'Successfully completed the "Mobile Development using Flutter" training course at Vinsys Arabia (approved by ACTVET Dubai and Knowledge Authority), held on March 23–27, 2026. Strengthened skills in cross-platform application development, modern UI frameworks, and real-world mobile application development workflows.',
        ar: 'أتممت بنجاح دورة "تطوير تطبيقات الهاتف المحمول باستخدام Flutter" التدريبية في فينسيس العربية (معتمدة من ACTVET دبي وهيئة المعرفة)، والتي عُقدت في 23–27 مارس 2026. ساهمت في تعزيز المهارات في تطوير التطبيقات متعددة المنصات وأطر واجهات المستخدم الحديثة وسير عمل تطوير تطبيقات الهاتف المحمول.',
      ),
      imageAsset: 'assets/images/certificates/flutterCourse.png',
      isPlaceholder: false,
    ),
    Certification(
      id: 'customer-service-ethraa-2018',
      title: LocalizedText(
        en: 'Qualifying of Customer Service Teams',
        ar: 'تأهيل فرق خدمة العملاء',
      ),
      organization: LocalizedText(
        en: 'Ethraa Consultation and Training',
        ar: 'إثراء للاستشارات والتدريب',
      ),
      date: LocalizedText(
        en: 'October 2018',
        ar: 'أكتوبر 2018',
      ),
      description: LocalizedText(
        en: 'Successfully completed the "Qualifying of Customer Service Teams" training program organized by Ethraa Consultation and Training in cooperation with Fujairah Municipality, held on 24–25 October 2018. Certified by Dr. Ebtihal Darwish, General Manager.',
        ar: 'أتممت بنجاح برنامج "تأهيل فرق خدمة العملاء" التدريبي المنظم من قبل إثراء للاستشارات والتدريب بالتعاون مع بلدية الفجيرة، والذي عُقد في 24–25 أكتوبر 2018. معتمد من الدكتورة ابتهال درويش، المدير العام.',
      ),
      imageAsset: 'assets/images/certificates/customerServiceEthraa2018.jpg',
      isPlaceholder: false,
    ),
    Certification(
      id: 'tolerance-newvision-2019',
      title: LocalizedText(
        en: 'Institutional Tolerance and Indicators of Achievement',
        ar: 'التسامح المؤسسي ومؤشرات الإنجاز',
      ),
      organization: LocalizedText(
        en: 'New Vision Training Center',
        ar: 'مركز نيوفيجن للتدريب',
      ),
      date: LocalizedText(
        en: 'April 2019',
        ar: 'أبريل 2019',
      ),
      description: LocalizedText(
        en: 'Successfully completed the "Institutional Tolerance and Indicators of Achievement" training course at New Vision Training Center (ACTVET licensed, ISO 9001:2015 certified) in cooperation with Fujairah Municipality, held on 21–22 April 2019.',
        ar: 'أتممت بنجاح دورة "التسامح المؤسسي ومؤشرات الإنجاز" التدريبية في مركز نيوفيجن للتدريب (مرخص من ACTVET، حاصل على شهادة ISO 9001:2015) بالتعاون مع بلدية الفجيرة، والتي عُقدت في 21–22 أبريل 2019.',
      ),
      imageAsset: 'assets/images/certificates/toleranceNewVision2019.jpg',
      isPlaceholder: false,
    ),
    Certification(
      id: 'ms-office-apeco-2013',
      title: LocalizedText(
        en: 'Office Automation (MS Office) – Grade A',
        ar: 'أتمتة المكاتب (MS Office) – تقدير A',
      ),
      organization: LocalizedText(
        en: 'APECO Institute of Arts and Technology',
        ar: 'معهد APECO للفنون والتكنولوجيا',
      ),
      date: LocalizedText(
        en: 'January 2013',
        ar: 'يناير 2013',
      ),
      description: LocalizedText(
        en: 'Successfully completed the Office Automation (MS Office) training program at APECO Institute of Arts and Technology (affiliated by Hi Tech International Kuwait, awarded by Overseas Pakistani Action Committee). Achieved Grade A with 70% marks and 20 practical hours. Certificate No. 22, Session Fall 2012.',
        ar: 'أتممت بنجاح برنامج أتمتة المكاتب (MS Office) التدريبي في معهد APECO للفنون والتكنولوجيا (تابع لـ Hi Tech International الكويت، معتمد من لجنة العمل الباكستانية في الخارج). حصلت على تقدير A بنسبة 70% مع 20 ساعة تدريب عملي. شهادة رقم 22، فصل خريف 2012.',
      ),
      imageAsset: 'assets/images/certificates/msOfficeApeco2013.jpg',
      isPlaceholder: false,
    ),
    Certification(
      id: 'hardware-networking-itec-2012',
      title: LocalizedText(
        en: 'Hardware & Networking – Grade A',
        ar: 'الأجهزة والشبكات – تقدير A',
      ),
      organization: LocalizedText(
        en: 'iTEC Computer Centre',
        ar: 'مركز iTEC للكمبيوتر',
      ),
      date: LocalizedText(
        en: 'September – November 2012',
        ar: 'سبتمبر – نوفمبر 2012',
      ),
      description: LocalizedText(
        en: 'Successfully completed the Hardware & Networking course at iTEC Computer Centre (Certificate No. 4723, Board of Technical Education) from September 2 to November 30, 2012, achieving Grade A.',
        ar: 'أتممت بنجاح دورة الأجهزة والشبكات في مركز iTEC للكمبيوتر (شهادة رقم 4723، مجلس التعليم التقني) من 2 سبتمبر إلى 30 نوفمبر 2012، بتقدير A.',
      ),
      imageAsset: 'assets/images/certificates/hardwareNetworkingItec2012.jpg',
      isPlaceholder: false,
    ),
  ];

  static const List<Award> awards = [
    Award(
      id: 'flutter-training-achievement',
      title: LocalizedText(
        en: 'Flutter Mobile Development Training',
        ar: 'تدريب تطوير تطبيقات الهاتف باستخدام Flutter',
      ),
      organization: LocalizedText(
        en: 'Vinsys Arabia',
        ar: 'فينسيس العربية',
      ),
      date: LocalizedText(
        en: 'March 2026',
        ar: 'مارس 2026',
      ),
      description: LocalizedText(
        en: 'Successfully completed professional training in Mobile Development using Flutter at Vinsys Arabia (approved by ACTVET Dubai and Knowledge Authority), March 23–27, 2026. The training strengthened skills in cross-platform development, modern UI, and real-world mobile application development.',
        ar: 'أتممت بنجاح تدريباً مهنياً في تطوير تطبيقات الهاتف المحمول باستخدام Flutter في فينسيس العربية (معتمدة من ACTVET دبي وهيئة المعرفة)، 23–27 مارس 2026. ساهم التدريب في تعزيز المهارات في تطوير التطبيقات متعددة المنصات وواجهات المستخدم الحديثة.',
      ),
      imageAsset: 'assets/images/awards/flutterCourse.jpeg',
      isPlaceholder: false,
    ),
    Award(
      id: 'excellence-award-silver-2019',
      title: LocalizedText(
        en: 'Fujairah Municipality Excellence Award – Silver (2nd Place)',
        ar: 'جائزة بلدية الفجيرة للتميز – المستوى الفضي (المركز الثاني)',
      ),
      organization: LocalizedText(
        en: 'Fujairah Municipality',
        ar: 'بلدية الفجيرة',
      ),
      date: LocalizedText(
        en: '2019',
        ar: '2019',
      ),
      description: LocalizedText(
        en: 'Achieved 2nd Place – Silver Level in the Fujairah Municipality Excellence Award under the New Employees category for the year 2019, signed by Director General Mr. Mohammed Saif Al Afkham.',
        ar: 'حصلت على المركز الثاني – المستوى الفضي في جائزة بلدية الفجيرة للتميز عن فئة الموظفين الجدد لسنة 2019، بتوقيع المدير العام السيد محمد سيف الأفخم.',
      ),
      imageAsset: 'assets/images/awards/excellenceAwardSilver2019.jpg',
      isPlaceholder: false,
    ),
    Award(
      id: 'best-new-employee-2020',
      title: LocalizedText(
        en: 'Best New Employee of the Year',
        ar: 'أفضل موظف جديد لهذا العام',
      ),
      organization: LocalizedText(
        en: 'Professional Achievement',
        ar: 'إنجاز مهني',
      ),
      date: LocalizedText(
        en: '2020',
        ar: '2020',
      ),
      description: LocalizedText(
        en: 'Alhamdulillah, received the Best New Employee of the Year award in recognition of outstanding performance, dedication, and contribution.',
        ar: 'الحمد لله، حصلت على جائزة أفضل موظف جديد لهذا العام تقديراً للأداء المتميز والتفاني والمساهمة الفعالة.',
      ),
      imageAsset: 'assets/images/awards/bestEmployeeAward.jpg',
      isPlaceholder: false,
    ),
    Award(
      id: 'best-idea-2020',
      title: LocalizedText(
        en: 'Best Idea of the Year',
        ar: 'أفضل فكرة لهذا العام',
      ),
      organization: LocalizedText(
        en: 'Professional Achievement',
        ar: 'إنجاز مهني',
      ),
      date: LocalizedText(
        en: '2020',
        ar: '2020',
      ),
      description: LocalizedText(
        en: 'Recognized for Best Idea of the Year in 2020 for contributing an innovative idea that supported improvement and positive impact within the organization.',
        ar: 'تم التكريم بجائزة أفضل فكرة لعام 2020 تقديراً لتقديم فكرة مبتكرة ساهمت في التطوير وتحقيق أثر إيجابي داخل المؤسسة.',
      ),
      imageAsset: 'assets/images/awards/bestIdeaAward.jpg',
      isPlaceholder: false,
    ),
    //   Award(
    //     id: 'flutter-training-achievement',
    //     title: LocalizedText(
    //       en: 'Flutter Mobile Development Training',
    //       ar: 'تدريب تطوير تطبيقات الهاتف باستخدام Flutter',
    //     ),
    //     organization: LocalizedText(
    //       en: 'Vinsys',
    //       ar: 'Vinsys',
    //     ),
    //     date: LocalizedText(
    //       en: 'Professional Training Achievement',
    //       ar: 'إنجاز تدريبي مهني',
    //     ),
    //     description: LocalizedText(
    //       en: 'Successfully completed professional training in Mobile Development using Flutter and received the training certificate. The training strengthened skills in cross-platform development, modern UI, and real-world mobile application development.',
    //       ar: 'أتممت بنجاح تدريباً مهنياً في تطوير تطبيقات الهاتف المحمول باستخدام Flutter وتسلمت شهادة التدريب. ساهم التدريب في تعزيز المهارات في تطوير التطبيقات متعددة المنصات وواجهات المستخدم الحديثة وتطوير تطبيقات الهاتف في المشاريع الواقعية.',
    //     ),
    //     imageAsset: 'assets/images/awards/flutterCourse.jpeg',
    //     isPlaceholder: false,
    //   ),
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
