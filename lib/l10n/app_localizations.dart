import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
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
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @policy_edit_accept_bar_select_none.
  ///
  /// In en, this message translates to:
  /// **'Select None'**
  String get policy_edit_accept_bar_select_none;

  /// No description provided for @policy_edit_accept_bar_select_required.
  ///
  /// In en, this message translates to:
  /// **'Select Required'**
  String get policy_edit_accept_bar_select_required;

  /// No description provided for @policy_edit_accept_bar_select_all.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get policy_edit_accept_bar_select_all;

  /// No description provided for @policy_edit_accept_bar_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get policy_edit_accept_bar_next;

  /// No description provided for @policy_edit_accept_bar_full_text_policy.
  ///
  /// In en, this message translates to:
  /// **'Full Text Policy'**
  String get policy_edit_accept_bar_full_text_policy;

  /// No description provided for @policy_edit_accept_bar_full_text_policy_not_provided.
  ///
  /// In en, this message translates to:
  /// **'???'**
  String get policy_edit_accept_bar_full_text_policy_not_provided;

  /// No description provided for @policy_edit_checkout_bar_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get policy_edit_checkout_bar_back;

  /// No description provided for @policy_edit_description_title.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get policy_edit_description_title;

  /// No description provided for @policy_edit_general_information_title.
  ///
  /// In en, this message translates to:
  /// **'General Information'**
  String get policy_edit_general_information_title;

  /// No description provided for @policy_edit_general_information_data_controllers_title.
  ///
  /// In en, this message translates to:
  /// **'Data Controllers'**
  String get policy_edit_general_information_data_controllers_title;

  /// No description provided for @policy_edit_general_information_data_controller.
  ///
  /// In en, this message translates to:
  /// **'Data Controller'**
  String get policy_edit_general_information_data_controller;

  /// No description provided for @policy_edit_general_information_data_protection_officers_title.
  ///
  /// In en, this message translates to:
  /// **'Data Protection Officers'**
  String get policy_edit_general_information_data_protection_officers_title;

  /// No description provided for @policy_edit_general_information_data_subject_rights_title.
  ///
  /// In en, this message translates to:
  /// **'Data Subject Rights'**
  String get policy_edit_general_information_data_subject_rights_title;

  /// No description provided for @policy_edit_general_information_supervisory_authority_title.
  ///
  /// In en, this message translates to:
  /// **'Supervisory Authority'**
  String get policy_edit_general_information_supervisory_authority_title;

  /// No description provided for @policy_edit_header_version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get policy_edit_header_version;

  /// No description provided for @policy_edit_header_version_not_provided.
  ///
  /// In en, this message translates to:
  /// **'???'**
  String get policy_edit_header_version_not_provided;

  /// No description provided for @policy_edit_header_difficulty_advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get policy_edit_header_difficulty_advanced;

  /// No description provided for @policy_edit_header_difficulty_basic.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get policy_edit_header_difficulty_basic;

  /// No description provided for @policy_edit_header_language_legally_binding.
  ///
  /// In en, this message translates to:
  /// **'Legally Binding'**
  String get policy_edit_header_language_legally_binding;

  /// No description provided for @policy_edit_processing_overview_title.
  ///
  /// In en, this message translates to:
  /// **'Processing Overview'**
  String get policy_edit_processing_overview_title;

  /// No description provided for @policy_edit_purposes.
  ///
  /// In en, this message translates to:
  /// **'{policy_edit_purposes_title, select, vendorManagement{Vendor Management} serviceProvision{Service Provision} researchAndDevelopment{Research and Development} recordManagement{Record Management} personalisation{Personalization} organisationGovernance{Organisation Governance} marketing{Marketing} legalCompliance{Legal Compliance} accountManagement{Account Management} communicationManagement{Communication Management} customerManagement{Customer Management} enforceSecurity{Security Enforcement} humanResourceManagement{Human Resource Management} other{Other}}'**
  String policy_edit_purposes(String policy_edit_purposes_title);

  /// No description provided for @policy_edit_purposes_title.
  ///
  /// In en, this message translates to:
  /// **'Purposes'**
  String get policy_edit_purposes_title;

  /// No description provided for @policy_checkout_purpose_details.
  ///
  /// In en, this message translates to:
  /// **'Purpose Details'**
  String get policy_checkout_purpose_details;

  /// No description provided for @purpose_card_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get purpose_card_description;

  /// No description provided for @purpose_card_data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get purpose_card_data;

  /// No description provided for @purpose_card_retention.
  ///
  /// In en, this message translates to:
  /// **'Retention'**
  String get purpose_card_retention;

  /// No description provided for @purpose_card_legal_bases.
  ///
  /// In en, this message translates to:
  /// **'Legal Bases'**
  String get purpose_card_legal_bases;

  /// No description provided for @purpose_card_data_recipients.
  ///
  /// In en, this message translates to:
  /// **'Data Recipients'**
  String get purpose_card_data_recipients;

  /// No description provided for @purpose_card_automated_decision_making.
  ///
  /// In en, this message translates to:
  /// **'Automated Decision Making'**
  String get purpose_card_automated_decision_making;

  /// No description provided for @purpose_card_more_details.
  ///
  /// In en, this message translates to:
  /// **'More Information'**
  String get purpose_card_more_details;

  /// No description provided for @purpose_card_privacy_models.
  ///
  /// In en, this message translates to:
  /// **'Privacy Models'**
  String get purpose_card_privacy_models;

  /// No description provided for @purpose_card_pseudonymization.
  ///
  /// In en, this message translates to:
  /// **'Pseudonymization'**
  String get purpose_card_pseudonymization;

  /// No description provided for @purpose_card_privacy_models_and_pseudonymization.
  ///
  /// In en, this message translates to:
  /// **'Techincal Information'**
  String get purpose_card_privacy_models_and_pseudonymization;

  /// No description provided for @purpose_card_required.
  ///
  /// In en, this message translates to:
  /// **'required'**
  String get purpose_card_required;

  /// No description provided for @purpose_card_sub_purposes.
  ///
  /// In en, this message translates to:
  /// **'Subordinate Purposes'**
  String get purpose_card_sub_purposes;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'months'**
  String get months;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @retention_types.
  ///
  /// In en, this message translates to:
  /// **'{purpose_card_retention, select, indefinite{for an indefinite period of time} afterPurpose{after the end of the intended use} fixedDate{until a fixed date} other{}}'**
  String retention_types(String purpose_card_retention);

  /// No description provided for @retention_indefinite.
  ///
  /// In en, this message translates to:
  /// **'for an indefinite period of time'**
  String get retention_indefinite;

  /// No description provided for @retention_after_purpose.
  ///
  /// In en, this message translates to:
  /// **'after the end of the intended use'**
  String get retention_after_purpose;

  /// No description provided for @retention_fixed_Date.
  ///
  /// In en, this message translates to:
  /// **'until'**
  String get retention_fixed_Date;

  /// formatting dates
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String date(DateTime date);

  /// No description provided for @data_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get data_description;

  /// No description provided for @data_anonymized.
  ///
  /// In en, this message translates to:
  /// **'anonymized'**
  String get data_anonymized;

  /// No description provided for @data_recipient_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get data_recipient_description;

  /// No description provided for @data_recipient_country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get data_recipient_country;

  /// No description provided for @data_recipient_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get data_recipient_type;

  /// No description provided for @data_recipient_safeguards.
  ///
  /// In en, this message translates to:
  /// **'Safeguards'**
  String get data_recipient_safeguards;

  /// No description provided for @matrix_external_empty.
  ///
  /// In en, this message translates to:
  /// **'No processing to show!'**
  String get matrix_external_empty;

  /// No description provided for @privacy_groups.
  ///
  /// In en, this message translates to:
  /// **'{privacy_group, select, EI{identifying information} QID{partially identifying information} SD{senitive information} NSD{non-sensitive information} other{}}'**
  String privacy_groups(String privacy_group);

  /// No description provided for @data_categories.
  ///
  /// In en, this message translates to:
  /// **'{data_category, select, dc_derived{Derived Personal Data} dc_knowledge{Knowledge and Belief} dc_authenticating{Authenticating} dc_preference{Preference} dc_identifying{Identifying} dc_ethnicity{Ethnicity} dc_behavioral{Behavioral} dc_demographic{Demographic} dc_physical{Physical Characteristics} dc_computer{Device} dc_contact{Contact} dc_location{Location} dc_historical{Historical} dc_account{Account} dc_ownership{Ownership} dc_transactional{Transactional} dc_credit{Credit} dc_professional{Professional} dc_criminal{Criminal} dc_public{Public Life} dc_family{Family} dc_social{Social Network} dc_communication{Communication} dc_medical{Medical and Health} dc_sexual{Sexual} other{}}'**
  String data_categories(String data_category);

  /// No description provided for @entity_types.
  ///
  /// In en, this message translates to:
  /// **'{entity_type, select, LegalEntity{legal entity} Person{person} PublicAuthority{public authority} other{}}'**
  String entity_types(String entity_type);

  /// No description provided for @legal_bases.
  ///
  /// In en, this message translates to:
  /// **'{legal_basis, select, consent{consent} contract{contract fulfillment} legalObligation{legal obligation} vitalInterest{vital interest} publicTask{public task} legitimateInterest{legitimate interest} other{}}'**
  String legal_bases(String legal_basis);

  /// No description provided for @countries.
  ///
  /// In en, this message translates to:
  /// **'{country, select, _{Unknown Country} AF{Afghanistan} AX{Åland Islands} AL{Albania} DZ{Algeria} AS{American Samoa} AD{Andorra} AO{Angola} AI{Anguilla} AQ{Antarctica} AG{Antigua & Barbuda} AR{Argentina} AM{Armenia} AW{Aruba} AU{Australia} AT{Austria} AZ{Azerbaijan} BS{Bahamas} BH{Bahrain} BD{Bangladesh} BB{Barbados} BY{Belarus} BE{Belgium} BZ{Belize} BJ{Benin} BM{Bermuda} BT{Bhutan} BO{Bolivia} BQ{Caribbean Netherlands} BA{Bosnia & Herzegovina} BW{Botswana} BV{Bouvet Island} BR{Brazil} IO{British Indian Ocean Territory} BN{Brunei} BG{Bulgaria} BF{Burkina Faso} BI{Burundi} CV{Cape Verde} KH{Cambodia} CM{Cameroon} CA{Canada} KY{Cayman Islands} CF{Central African Republic} TD{Chad} CL{Chile} CN{China} CX{Christmas Island} CC{Cocos (Keeling) Islands} CO{Colombia} KM{Comoros} CG{Congo} CD{Congo   Kinshasa} CK{Cook Islands} CR{Costa Rica} CI{Côte d’Ivoire} HR{Croatia} CU{Cuba} CW{Curaçao} CY{Cyprus} CZ{Czechia} DK{Denmark} DJ{Djibouti} DM{Dominica} DO{Dominican Republic} EC{Ecuador} EG{Egypt} SV{El Salvador} GQ{Equatorial Guinea} ER{Eritrea} EE{Estonia} SZ{Eswatini} ET{Ethiopia} FK{Falkland Islands} FO{Faroe Islands} FJ{Fiji} FI{Finland} FR{France} GF{French Guiana} PF{French Polynesia} TF{French Southern Territories} GA{Gabon} GM{Gambia} GE{Georgia} DE{Germany} GH{Ghana} GI{Gibraltar} GR{Greece} GL{Greenland} GD{Grenada} GP{Guadeloupe} GU{Guam} GT{Guatemala} GG{Guernsey} GN{Guinea} GW{Guinea Bissau} GY{Guyana} HT{Haiti} HM{Heard & McDonald Islands} VA{Vatican City} HN{Honduras} HK{Hong Kong} HU{Hungary} IS{Iceland} IN{India} ID{Indonesia} IR{Iran} IQ{Iraq} IE{Ireland} IM{Isle of Man} IL{Israel} IT{Italy} JM{Jamaica} JP{Japan} JE{Jersey} JO{Jordan} KZ{Kazakhstan} KE{Kenya} KI{Kiribati} KP{North Korea} KR{South Korea} KW{Kuwait} KG{Kyrgyzstan} LA{Laos} LV{Latvia} LB{Lebanon} LS{Lesotho} LR{Liberia} LY{Libya} LI{Liechtenstein} LT{Lithuania} LU{Luxembourg} MO{Macao} MG{Madagascar} MW{Malawi} MY{Malaysia} MV{Maldives} ML{Mali} MT{Malta} MH{Marshall Islands} MQ{Martinique} MR{Mauritania} MU{Mauritius} YT{Mayotte} MX{Mexico} FM{Micronesia} MD{Moldova} MC{Monaco} MN{Mongolia} ME{Montenegro} MS{Montserrat} MA{Morocco} MZ{Mozambique} MM{Myanmar} NA{Namibia} NR{Nauru} NP{Nepal} NL{Netherlands} NC{New Caledonia} NZ{New Zealand} NI{Nicaragua} NE{Niger} NG{Nigeria} NU{Niue} NF{Norfolk Island} MK{North Macedonia} MP{Northern Mariana Islands} NO{Norway} OM{Oman} PK{Pakistan} PW{Palau} PS{Palestinian Territories} PA{Panama} PG{Papua New Guinea} PY{Paraguay} PE{Peru} PH{Philippines} PN{Pitcairn} PL{Poland} PT{Portugal} PR{Puerto Rico} QA{Qatar} RE{Réunion} RO{Romania} RU{Russia} RW{Rwanda} BL{St. Barthélemy} SH{St. Helena} KN{St. Kitts & Nevis} LC{St. Lucia} MF{St. Martin} PM{St. Pierre & Miquelon} VC{St. Vincent & Grenadines} WS{Samoa} SM{San Marino} ST{São Tomé & Príncipe} SA{Saudi Arabia} SN{Senegal} RS{Serbia} SC{Seychelles} SL{Sierra Leone} SG{Singapore} SX{Sint Maarten} SK{Slovakia} SI{Slovenia} SB{Solomon Islands} SO{Somalia} ZA{South Africa} GS{South Georgia & South Sandwich Islands} SS{South Sudan} ES{Spain} LK{Sri Lanka} SD{Sudan} SR{Suriname} SJ{Svalbard & Jan Mayen} SE{Sweden} CH{Switzerland} SY{Syria} TW{Taiwan} TJ{Tajikistan} TZ{Tanzania} TH{Thailand} TL{Timor Leste} TG{Togo} TK{Tokelau} TO{Tonga} TT{Trinidad & Tobago} TN{Tunisia} TR{Turkey} TM{Turkmenistan} TC{Turks & Caicos Islands} TV{Tuvalu} UG{Uganda} UA{Ukraine} AE{United Arab Emirates} GB{United Kingdom} UM{U.S. Outlying Islands} US{United States of America} UY{Uruguay} UZ{Uzbekistan} VU{Vanuatu} VE{Venezuela} VN{Vietnam} VG{British Virgin Islands} VI{U.S. Virgin Islands} WF{Wallis & Futuna} EH{Western Sahara} YE{Yemen} ZM{Zambia} ZW{Zimbabwe} other{}}'**
  String countries(String country);

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'{language, select, en{English} de{German} fr{French} aa{Afar} ab{Abkhazian} ae{Avestan} af{Afrikaans} ak{Akan} am{Amharic} an{Aragonese} ar{Arabic} as{Assamese} av{Avaric} ay{Aymara} az{Azerbaijani} ba{Bashkir} be{Belarusian} bg{Bulgarian} bi{Bislama} bm{Bambara} bn{Bengali} bo{Tibetan} br{Breton} bs{Bosnian} ca{Catalan} ce{Chechen} ch{Chamorro} co{Corsican} cr{Cree} cs{Czech} cu{Church Slavic} cv{Chuvash} cy{Welsh} da{Danish} dv{Dhivehi} dz{Dzongkha} ee{Ewe} el{Modern Greek (1453-)} eo{Esperanto} es{Spanish} et{Estonian} eu{Basque} fa{Persian} ff{Fulah} fi{Finnish} fj{Fijian} fo{Faroese} fy{Western Frisian} ga{Irish} gd{Scottish Gaelic} gl{Galician} gn{Guarani} gu{Gujarati} gv{Manx} ha{Hausa} he{Hebrew} hi{Hindi} ho{Hiri Motu} hr{Croatian} ht{Haitian} hu{Hungarian} hy{Armenian} hz{Herero} ia{Interlingua (International Auxiliary Language Association)} id{Indonesian} ie{Interlingue} ig{Igbo} ii{Sichuan Yi} ik{Inupiaq} io{Ido} is{Icelandic} it{Italian} iu{Inuktitut} ja{Japanese} jv{Javanese} ka{Georgian} kg{Kongo} ki{Kikuyu} kj{Kuanyama} kk{Kazakh} kl{Kalaallisut} km{Khmer} kn{Kannada} ko{Korean} kr{Kanuri} ks{Kashmiri} ku{Kurdish} kv{Komi} kw{Cornish} ky{Kirghiz} la{Latin} lb{Luxembourgish} lg{Ganda} li{Limburgan} ln{Lingala} lo{Lao} lt{Lithuanian} lu{Luba-Katanga} lv{Latvian} mg{Malagasy} mh{Marshallese} mi{Maori} mk{Macedonian} ml{Malayalam} mn{Mongolian} mr{Marathi} ms{Malay (macrolanguage)} mt{Maltese} my{Burmese} na{Nauru} nb{Norwegian Bokmål} nd{North Ndebele} ne{Nepali (macrolanguage)} ng{Ndonga} nl{Dutch} nn{Norwegian Nynorsk} no{Norwegian} nr{South Ndebele} nv{Navajo} ny{Nyanja} oc{Occitan (post 1500)} oj{Ojibwa} om{Oromo} or{Oriya (macrolanguage)} os{Ossetian} pa{Panjabi} pi{Pali} pl{Polish} ps{Pushto} pt{Portuguese} qu{Quechua} rm{Romansh} rn{Rundi} ro{Romanian} ru{Russian} rw{Kinyarwanda} sa{Sanskrit} sc{Sardinian} sd{Sindhi} se{Northern Sami} sg{Sango} sh{Serbo-Croatian} si{Sinhala} sk{Slovak} sl{Slovenian} sm{Samoan} sn{Shona} so{Somali} sq{Albanian} sr{Serbian} ss{Swati} st{Southern Sotho} su{Sundanese} sv{Swedish} sw{Swahili (macrolanguage)} ta{Tamil} te{Telugu} tg{Tajik} th{Thai} ti{Tigrinya} tk{Turkmen} tl{Tagalog} tn{Tswana} to{Tonga (Tonga Islands)} tr{Turkish} ts{Tsonga} tt{Tatar} tw{Twi} ty{Tahitian} ug{Uighur} uk{Ukrainian} ur{Urdu} uz{Uzbek} ve{Venda} vi{Vietnamese} vo{Volapük} wa{Walloon} wo{Wolof} xh{Xhosa} yi{Yiddish} yo{Yoruba} za{Zhuang} zh{Chinese} zu{Zulu} other{}}'**
  String languages(String language);

  /// No description provided for @errors.
  ///
  /// In en, this message translates to:
  /// **'{error, select, purposeRequiredBelow{This purpose must be accepted at least partially!} purposeRequired{This purpose must be accepted at least partially!} purposeDataRecipientRequired{Some data recipients must be accepted for this purpose.} purposeDataRecipientRequiredBelow{Some data recipients must be accepted for this purpose, see highlighted elements below!} dataRecipientRequired{This data recipient must be accepted!} purposeError{There are problems with the purposes of this category.} purposeDataRequired{Some data must be accepted for this purpose.} purposeDataRequiredBelow{Some data must be accepted for this purpose, see highlighted elements below!} dataRequired{This data element must be accepted!} other{unknown problem identified}}'**
  String errors(String error);

  /// No description provided for @expand_all.
  ///
  /// In en, this message translates to:
  /// **'expand all purposes'**
  String get expand_all;

  /// No description provided for @collapse_all.
  ///
  /// In en, this message translates to:
  /// **'collapse all purposes'**
  String get collapse_all;

  /// No description provided for @glossary.
  ///
  /// In en, this message translates to:
  /// **'glossary'**
  String get glossary;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'help'**
  String get help;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
