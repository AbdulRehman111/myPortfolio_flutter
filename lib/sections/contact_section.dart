import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../config/firebase_config.dart';
import '../data/portfolio_data.dart';
import '../services/inquiry_service.dart';
import '../services/preferences_service.dart';
import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import '../utils/launch_helper.dart';
import '../widgets/hover_card.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _subject = TextEditingController();
  final _message = TextEditingController();
  final _inquiryService = const InquiryService();
  bool _sending = false;
  bool _draftRestored = false;

  @override
  void initState() {
    super.initState();
    final draft = PreferencesService.instance.readBriefDraft();
    if (draft.isNotEmpty) {
      _name.text = draft['name'] ?? '';
      _email.text = draft['email'] ?? '';
      _subject.text = draft['subject'] ?? '';
      _message.text = draft['message'] ?? '';
      _draftRestored = draft.values.any((v) => v.trim().isNotEmpty);
    }
    _name.addListener(_persistDraft);
    _email.addListener(_persistDraft);
    _subject.addListener(_persistDraft);
    _message.addListener(_persistDraft);
    if (_draftRestored) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).formDraftRestored)),
        );
      });
    }
  }

  void _persistDraft() {
    PreferencesService.instance.saveBriefDraft(
      name: _name.text,
      email: _email.text,
      subject: _subject.text,
      message: _message.text,
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  Future<void> _openMailFallback(AppLocalizations l10n) {
    final contact = PortfolioData.profile.contact;
    if (contact.hasEmail) {
      return openMail(
        contact.email,
        subject: _subject.text.trim().isEmpty
            ? 'Portfolio enquiry'
            : _subject.text.trim(),
        body:
            '${_name.text.trim()}\n${_email.text.trim()}\n\n${_message.text.trim()}',
      );
    }
    if (contact.hasLinkedIn) {
      return openExternal(contact.linkedinUrl);
    }
    return Future.value();
  }

  Future<void> _submit(AppLocalizations l10n) async {
    if (!_formKey.currentState!.validate() || _sending) return;
    setState(() => _sending = true);
    try {
      if (!FirebaseConfig.isConfigured) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.formFirebaseMissing)),
          );
        }
        await _openMailFallback(l10n);
        return;
      }
      await _inquiryService.submit(
        InquiryPayload(
          name: _name.text.trim(),
          email: _email.text.trim(),
          subject: _subject.text.trim(),
          message: _message.text.trim(),
          lang: Localizations.localeOf(context).languageCode,
        ),
      );
      _formKey.currentState!.reset();
      _name.clear();
      _email.clear();
      _subject.clear();
      _message.clear();
      await PreferencesService.instance.clearBriefDraft();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.formSuccess)),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.formError)),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final contact = PortfolioData.profile.contact;
    final mobile = Breakpoints.isMobile(context);

    final details = <Widget>[
      if (contact.hasEmail)
        _ContactTile(
          icon: Icons.mail_outline,
          label: l10n.contactEmail,
          value: contact.email,
          onTap: () => openMail(contact.email),
          trailing: IconButton(
            tooltip: l10n.copyEmail,
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: contact.email));
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.emailCopied)),
              );
            },
            icon: const Icon(Icons.copy_rounded, size: 18),
          ),
        ),
      if (contact.hasPhone && !contact.phone.contains('000000'))
        _ContactTile(
          icon: Icons.phone_outlined,
          label: l10n.contactPhone,
          value: contact.phone,
          onTap: () => openTel(contact.phone),
        ),
      if (contact.hasLocation)
        _ContactTile(
          icon: Icons.place_outlined,
          label: l10n.contactLocation,
          value: contact.location,
        ),
      if (contact.hasLinkedIn)
        _ContactTile(
          icon: Icons.business_center_outlined,
          label: l10n.contactLinkedIn,
          value: 'linkedin.com/in/abdul-rehman-1602',
          onTap: () => openExternal(contact.linkedinUrl),
        ),
      if (contact.hasGithub)
        _ContactTile(
          icon: Icons.code,
          label: l10n.contactGithub,
          value: 'github.com/AbdulRehman111',
          onTap: () => openExternal(contact.githubUrl),
        ),
    ];

    final infoColumn = Column(
      children: [
        for (final tile in details)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: tile,
          ),
        if (details.isEmpty)
          Text(l10n.notConfigured, style: Theme.of(context).textTheme.bodySmall),
      ],
    );

    final form = HoverCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _name,
              decoration: InputDecoration(labelText: l10n.formName),
              textInputAction: TextInputAction.next,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.formNameError : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(labelText: l10n.formEmail),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (v) {
                if (v == null || !v.contains('@')) return l10n.formEmailError;
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _subject,
              decoration: InputDecoration(labelText: l10n.formSubject),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _message,
              decoration: InputDecoration(labelText: l10n.formMessage),
              minLines: 4,
              maxLines: 6,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? l10n.formMessageError : null,
            ),
            const SizedBox(height: 10),
            Text(l10n.formHint, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _sending ? null : () => _submit(l10n),
                  child: Text(_sending ? l10n.formSending : l10n.formSend),
                ),
                OutlinedButton(
                  onPressed: () async {
                    await PreferencesService.instance.saveBriefDraft(
                      name: _name.text,
                      email: _email.text,
                      subject: _subject.text,
                      message: _message.text,
                    );
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.formDraftSaved)),
                    );
                  },
                  child: Text(l10n.formDraft),
                ),
                OutlinedButton(
                  onPressed: () async {
                    _name.clear();
                    _email.clear();
                    _subject.clear();
                    _message.clear();
                    await PreferencesService.instance.clearBriefDraft();
                  },
                  child: Text(l10n.formClear),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return SectionShell(
      id: 'contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.contactEyebrow,
            title: l10n.contactTitle,
            lead: l10n.contactLead,
          ),
          const SizedBox(height: 32),
          if (mobile)
            Reveal(
              child: Column(
                children: [
                  infoColumn,
                  const SizedBox(height: 24),
                  form,
                ],
              ),
            )
          else
            Reveal(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: infoColumn),
                  const SizedBox(width: 28),
                  Expanded(flex: 3, child: form),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: onTap,
      semanticLabel: '$label $value',
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.blueBright),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelMedium),
                Text(value, style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
