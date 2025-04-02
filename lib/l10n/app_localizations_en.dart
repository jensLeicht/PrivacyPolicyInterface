// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get policy_edit_accept_bar_select_none => 'Select None';

  @override
  String get policy_edit_accept_bar_select_required => 'Select Required';

  @override
  String get policy_edit_accept_bar_select_all => 'Select All';

  @override
  String get policy_edit_accept_bar_next => 'Next';

  @override
  String get policy_edit_accept_bar_full_text_policy => 'Full Text Policy';

  @override
  String get policy_edit_accept_bar_full_text_policy_not_provided => '???';

  @override
  String get policy_edit_checkout_bar_back => 'Back';

  @override
  String get policy_edit_description_title => 'Description';

  @override
  String get policy_edit_general_information_title => 'General Information';

  @override
  String get policy_edit_general_information_data_controllers_title => 'Data Controllers';

  @override
  String get policy_edit_general_information_data_controller => 'Data Controller';

  @override
  String get policy_edit_general_information_data_protection_officers_title => 'Data Protection Officers';

  @override
  String get policy_edit_general_information_data_subject_rights_title => 'Data Subject Rights';

  @override
  String get policy_edit_general_information_supervisory_authority_title => 'Supervisory Authority';

  @override
  String get policy_edit_header_version => 'Version';

  @override
  String get policy_edit_header_version_not_provided => '???';

  @override
  String get policy_edit_header_difficulty_advanced => 'Advanced';

  @override
  String get policy_edit_header_difficulty_basic => 'Basic';

  @override
  String get policy_edit_header_language_legally_binding => 'Legally Binding';

  @override
  String get policy_edit_processing_overview_title => 'Processing Overview';

  @override
  String policy_edit_purposes(String policy_edit_purposes_title) {
    String _temp0 = intl.Intl.selectLogic(
      policy_edit_purposes_title,
      {
        'vendorManagement': 'Vendor Management',
        'serviceProvision': 'Service Provision',
        'researchAndDevelopment': 'Research and Development',
        'recordManagement': 'Record Management',
        'personalisation': 'Personalization',
        'organisationGovernance': 'Organisation Governance',
        'marketing': 'Marketing',
        'legalCompliance': 'Legal Compliance',
        'accountManagement': 'Account Management',
        'communicationManagement': 'Communication Management',
        'customerManagement': 'Customer Management',
        'enforceSecurity': 'Security Enforcement',
        'humanResourceManagement': 'Human Resource Management',
        'other': 'Other',
      },
    );
    return '$_temp0';
  }

  @override
  String get policy_edit_purposes_title => 'Purposes';

  @override
  String get policy_checkout_purpose_details => 'Purpose Details';

  @override
  String get purpose_card_description => 'Description';

  @override
  String get purpose_card_data => 'Data';

  @override
  String get purpose_card_retention => 'Retention';

  @override
  String get purpose_card_legal_bases => 'Legal Bases';

  @override
  String get purpose_card_data_recipients => 'Data Recipients';

  @override
  String get purpose_card_automated_decision_making => 'Automated Decision Making';

  @override
  String get purpose_card_more_details => 'More Information';

  @override
  String get purpose_card_privacy_models => 'Privacy Models';

  @override
  String get purpose_card_pseudonymization => 'Pseudonymization';

  @override
  String get purpose_card_privacy_models_and_pseudonymization => 'Techincal Information';

  @override
  String get purpose_card_required => 'required';

  @override
  String get purpose_card_sub_purposes => 'Subordinate Purposes';

  @override
  String get years => 'years';

  @override
  String get months => 'months';

  @override
  String get days => 'days';

  @override
  String retention_types(String purpose_card_retention) {
    String _temp0 = intl.Intl.selectLogic(
      purpose_card_retention,
      {
        'indefinite': 'for an indefinite period of time',
        'afterPurpose': 'after the end of the intended use',
        'fixedDate': 'until a fixed date',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get retention_indefinite => 'for an indefinite period of time';

  @override
  String get retention_after_purpose => 'after the end of the intended use';

  @override
  String get retention_fixed_Date => 'until';

  @override
  String date(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String get data_description => 'Description';

  @override
  String get data_anonymized => 'anonymized';

  @override
  String get data_recipient_description => 'Description';

  @override
  String get data_recipient_country => 'Country';

  @override
  String get data_recipient_type => 'Type';

  @override
  String get data_recipient_safeguards => 'Safeguards';

  @override
  String get matrix_external_empty => 'No processing to show!';

  @override
  String privacy_groups(String privacy_group) {
    String _temp0 = intl.Intl.selectLogic(
      privacy_group,
      {
        'EI': 'identifying information',
        'QID': 'partially identifying information',
        'SD': 'senitive information',
        'NSD': 'non-sensitive information',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String data_categories(String data_category) {
    String _temp0 = intl.Intl.selectLogic(
      data_category,
      {
        'dc_derived': 'Derived Personal Data',
        'dc_knowledge': 'Knowledge and Belief',
        'dc_authenticating': 'Authenticating',
        'dc_preference': 'Preference',
        'dc_identifying': 'Identifying',
        'dc_ethnicity': 'Ethnicity',
        'dc_behavioral': 'Behavioral',
        'dc_demographic': 'Demographic',
        'dc_physical': 'Physical Characteristics',
        'dc_computer': 'Device',
        'dc_contact': 'Contact',
        'dc_location': 'Location',
        'dc_historical': 'Historical',
        'dc_account': 'Account',
        'dc_ownership': 'Ownership',
        'dc_transactional': 'Transactional',
        'dc_credit': 'Credit',
        'dc_professional': 'Professional',
        'dc_criminal': 'Criminal',
        'dc_public': 'Public Life',
        'dc_family': 'Family',
        'dc_social': 'Social Network',
        'dc_communication': 'Communication',
        'dc_medical': 'Medical and Health',
        'dc_sexual': 'Sexual',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String entity_types(String entity_type) {
    String _temp0 = intl.Intl.selectLogic(
      entity_type,
      {
        'LegalEntity': 'legal entity',
        'Person': 'person',
        'PublicAuthority': 'public authority',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String legal_bases(String legal_basis) {
    String _temp0 = intl.Intl.selectLogic(
      legal_basis,
      {
        'consent': 'consent',
        'contract': 'contract fulfillment',
        'legalObligation': 'legal obligation',
        'vitalInterest': 'vital interest',
        'publicTask': 'public task',
        'legitimateInterest': 'legitimate interest',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String countries(String country) {
    String _temp0 = intl.Intl.selectLogic(
      country,
      {
        '_': 'Unknown Country',
        'AF': 'Afghanistan',
        'AX': 'Åland Islands',
        'AL': 'Albania',
        'DZ': 'Algeria',
        'AS': 'American Samoa',
        'AD': 'Andorra',
        'AO': 'Angola',
        'AI': 'Anguilla',
        'AQ': 'Antarctica',
        'AG': 'Antigua & Barbuda',
        'AR': 'Argentina',
        'AM': 'Armenia',
        'AW': 'Aruba',
        'AU': 'Australia',
        'AT': 'Austria',
        'AZ': 'Azerbaijan',
        'BS': 'Bahamas',
        'BH': 'Bahrain',
        'BD': 'Bangladesh',
        'BB': 'Barbados',
        'BY': 'Belarus',
        'BE': 'Belgium',
        'BZ': 'Belize',
        'BJ': 'Benin',
        'BM': 'Bermuda',
        'BT': 'Bhutan',
        'BO': 'Bolivia',
        'BQ': 'Caribbean Netherlands',
        'BA': 'Bosnia & Herzegovina',
        'BW': 'Botswana',
        'BV': 'Bouvet Island',
        'BR': 'Brazil',
        'IO': 'British Indian Ocean Territory',
        'BN': 'Brunei',
        'BG': 'Bulgaria',
        'BF': 'Burkina Faso',
        'BI': 'Burundi',
        'CV': 'Cape Verde',
        'KH': 'Cambodia',
        'CM': 'Cameroon',
        'CA': 'Canada',
        'KY': 'Cayman Islands',
        'CF': 'Central African Republic',
        'TD': 'Chad',
        'CL': 'Chile',
        'CN': 'China',
        'CX': 'Christmas Island',
        'CC': 'Cocos (Keeling) Islands',
        'CO': 'Colombia',
        'KM': 'Comoros',
        'CG': 'Congo',
        'CD': 'Congo   Kinshasa',
        'CK': 'Cook Islands',
        'CR': 'Costa Rica',
        'CI': 'Côte d’Ivoire',
        'HR': 'Croatia',
        'CU': 'Cuba',
        'CW': 'Curaçao',
        'CY': 'Cyprus',
        'CZ': 'Czechia',
        'DK': 'Denmark',
        'DJ': 'Djibouti',
        'DM': 'Dominica',
        'DO': 'Dominican Republic',
        'EC': 'Ecuador',
        'EG': 'Egypt',
        'SV': 'El Salvador',
        'GQ': 'Equatorial Guinea',
        'ER': 'Eritrea',
        'EE': 'Estonia',
        'SZ': 'Eswatini',
        'ET': 'Ethiopia',
        'FK': 'Falkland Islands',
        'FO': 'Faroe Islands',
        'FJ': 'Fiji',
        'FI': 'Finland',
        'FR': 'France',
        'GF': 'French Guiana',
        'PF': 'French Polynesia',
        'TF': 'French Southern Territories',
        'GA': 'Gabon',
        'GM': 'Gambia',
        'GE': 'Georgia',
        'DE': 'Germany',
        'GH': 'Ghana',
        'GI': 'Gibraltar',
        'GR': 'Greece',
        'GL': 'Greenland',
        'GD': 'Grenada',
        'GP': 'Guadeloupe',
        'GU': 'Guam',
        'GT': 'Guatemala',
        'GG': 'Guernsey',
        'GN': 'Guinea',
        'GW': 'Guinea Bissau',
        'GY': 'Guyana',
        'HT': 'Haiti',
        'HM': 'Heard & McDonald Islands',
        'VA': 'Vatican City',
        'HN': 'Honduras',
        'HK': 'Hong Kong',
        'HU': 'Hungary',
        'IS': 'Iceland',
        'IN': 'India',
        'ID': 'Indonesia',
        'IR': 'Iran',
        'IQ': 'Iraq',
        'IE': 'Ireland',
        'IM': 'Isle of Man',
        'IL': 'Israel',
        'IT': 'Italy',
        'JM': 'Jamaica',
        'JP': 'Japan',
        'JE': 'Jersey',
        'JO': 'Jordan',
        'KZ': 'Kazakhstan',
        'KE': 'Kenya',
        'KI': 'Kiribati',
        'KP': 'North Korea',
        'KR': 'South Korea',
        'KW': 'Kuwait',
        'KG': 'Kyrgyzstan',
        'LA': 'Laos',
        'LV': 'Latvia',
        'LB': 'Lebanon',
        'LS': 'Lesotho',
        'LR': 'Liberia',
        'LY': 'Libya',
        'LI': 'Liechtenstein',
        'LT': 'Lithuania',
        'LU': 'Luxembourg',
        'MO': 'Macao',
        'MG': 'Madagascar',
        'MW': 'Malawi',
        'MY': 'Malaysia',
        'MV': 'Maldives',
        'ML': 'Mali',
        'MT': 'Malta',
        'MH': 'Marshall Islands',
        'MQ': 'Martinique',
        'MR': 'Mauritania',
        'MU': 'Mauritius',
        'YT': 'Mayotte',
        'MX': 'Mexico',
        'FM': 'Micronesia',
        'MD': 'Moldova',
        'MC': 'Monaco',
        'MN': 'Mongolia',
        'ME': 'Montenegro',
        'MS': 'Montserrat',
        'MA': 'Morocco',
        'MZ': 'Mozambique',
        'MM': 'Myanmar',
        'NA': 'Namibia',
        'NR': 'Nauru',
        'NP': 'Nepal',
        'NL': 'Netherlands',
        'NC': 'New Caledonia',
        'NZ': 'New Zealand',
        'NI': 'Nicaragua',
        'NE': 'Niger',
        'NG': 'Nigeria',
        'NU': 'Niue',
        'NF': 'Norfolk Island',
        'MK': 'North Macedonia',
        'MP': 'Northern Mariana Islands',
        'NO': 'Norway',
        'OM': 'Oman',
        'PK': 'Pakistan',
        'PW': 'Palau',
        'PS': 'Palestinian Territories',
        'PA': 'Panama',
        'PG': 'Papua New Guinea',
        'PY': 'Paraguay',
        'PE': 'Peru',
        'PH': 'Philippines',
        'PN': 'Pitcairn',
        'PL': 'Poland',
        'PT': 'Portugal',
        'PR': 'Puerto Rico',
        'QA': 'Qatar',
        'RE': 'Réunion',
        'RO': 'Romania',
        'RU': 'Russia',
        'RW': 'Rwanda',
        'BL': 'St. Barthélemy',
        'SH': 'St. Helena',
        'KN': 'St. Kitts & Nevis',
        'LC': 'St. Lucia',
        'MF': 'St. Martin',
        'PM': 'St. Pierre & Miquelon',
        'VC': 'St. Vincent & Grenadines',
        'WS': 'Samoa',
        'SM': 'San Marino',
        'ST': 'São Tomé & Príncipe',
        'SA': 'Saudi Arabia',
        'SN': 'Senegal',
        'RS': 'Serbia',
        'SC': 'Seychelles',
        'SL': 'Sierra Leone',
        'SG': 'Singapore',
        'SX': 'Sint Maarten',
        'SK': 'Slovakia',
        'SI': 'Slovenia',
        'SB': 'Solomon Islands',
        'SO': 'Somalia',
        'ZA': 'South Africa',
        'GS': 'South Georgia & South Sandwich Islands',
        'SS': 'South Sudan',
        'ES': 'Spain',
        'LK': 'Sri Lanka',
        'SD': 'Sudan',
        'SR': 'Suriname',
        'SJ': 'Svalbard & Jan Mayen',
        'SE': 'Sweden',
        'CH': 'Switzerland',
        'SY': 'Syria',
        'TW': 'Taiwan',
        'TJ': 'Tajikistan',
        'TZ': 'Tanzania',
        'TH': 'Thailand',
        'TL': 'Timor Leste',
        'TG': 'Togo',
        'TK': 'Tokelau',
        'TO': 'Tonga',
        'TT': 'Trinidad & Tobago',
        'TN': 'Tunisia',
        'TR': 'Turkey',
        'TM': 'Turkmenistan',
        'TC': 'Turks & Caicos Islands',
        'TV': 'Tuvalu',
        'UG': 'Uganda',
        'UA': 'Ukraine',
        'AE': 'United Arab Emirates',
        'GB': 'United Kingdom',
        'UM': 'U.S. Outlying Islands',
        'US': 'United States of America',
        'UY': 'Uruguay',
        'UZ': 'Uzbekistan',
        'VU': 'Vanuatu',
        'VE': 'Venezuela',
        'VN': 'Vietnam',
        'VG': 'British Virgin Islands',
        'VI': 'U.S. Virgin Islands',
        'WF': 'Wallis & Futuna',
        'EH': 'Western Sahara',
        'YE': 'Yemen',
        'ZM': 'Zambia',
        'ZW': 'Zimbabwe',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String languages(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'English',
        'de': 'German',
        'fr': 'French',
        'aa': 'Afar',
        'ab': 'Abkhazian',
        'ae': 'Avestan',
        'af': 'Afrikaans',
        'ak': 'Akan',
        'am': 'Amharic',
        'an': 'Aragonese',
        'ar': 'Arabic',
        'as': 'Assamese',
        'av': 'Avaric',
        'ay': 'Aymara',
        'az': 'Azerbaijani',
        'ba': 'Bashkir',
        'be': 'Belarusian',
        'bg': 'Bulgarian',
        'bi': 'Bislama',
        'bm': 'Bambara',
        'bn': 'Bengali',
        'bo': 'Tibetan',
        'br': 'Breton',
        'bs': 'Bosnian',
        'ca': 'Catalan',
        'ce': 'Chechen',
        'ch': 'Chamorro',
        'co': 'Corsican',
        'cr': 'Cree',
        'cs': 'Czech',
        'cu': 'Church Slavic',
        'cv': 'Chuvash',
        'cy': 'Welsh',
        'da': 'Danish',
        'dv': 'Dhivehi',
        'dz': 'Dzongkha',
        'ee': 'Ewe',
        'el': 'Modern Greek (1453-)',
        'eo': 'Esperanto',
        'es': 'Spanish',
        'et': 'Estonian',
        'eu': 'Basque',
        'fa': 'Persian',
        'ff': 'Fulah',
        'fi': 'Finnish',
        'fj': 'Fijian',
        'fo': 'Faroese',
        'fy': 'Western Frisian',
        'ga': 'Irish',
        'gd': 'Scottish Gaelic',
        'gl': 'Galician',
        'gn': 'Guarani',
        'gu': 'Gujarati',
        'gv': 'Manx',
        'ha': 'Hausa',
        'he': 'Hebrew',
        'hi': 'Hindi',
        'ho': 'Hiri Motu',
        'hr': 'Croatian',
        'ht': 'Haitian',
        'hu': 'Hungarian',
        'hy': 'Armenian',
        'hz': 'Herero',
        'ia': 'Interlingua (International Auxiliary Language Association)',
        'id': 'Indonesian',
        'ie': 'Interlingue',
        'ig': 'Igbo',
        'ii': 'Sichuan Yi',
        'ik': 'Inupiaq',
        'io': 'Ido',
        'is': 'Icelandic',
        'it': 'Italian',
        'iu': 'Inuktitut',
        'ja': 'Japanese',
        'jv': 'Javanese',
        'ka': 'Georgian',
        'kg': 'Kongo',
        'ki': 'Kikuyu',
        'kj': 'Kuanyama',
        'kk': 'Kazakh',
        'kl': 'Kalaallisut',
        'km': 'Khmer',
        'kn': 'Kannada',
        'ko': 'Korean',
        'kr': 'Kanuri',
        'ks': 'Kashmiri',
        'ku': 'Kurdish',
        'kv': 'Komi',
        'kw': 'Cornish',
        'ky': 'Kirghiz',
        'la': 'Latin',
        'lb': 'Luxembourgish',
        'lg': 'Ganda',
        'li': 'Limburgan',
        'ln': 'Lingala',
        'lo': 'Lao',
        'lt': 'Lithuanian',
        'lu': 'Luba-Katanga',
        'lv': 'Latvian',
        'mg': 'Malagasy',
        'mh': 'Marshallese',
        'mi': 'Maori',
        'mk': 'Macedonian',
        'ml': 'Malayalam',
        'mn': 'Mongolian',
        'mr': 'Marathi',
        'ms': 'Malay (macrolanguage)',
        'mt': 'Maltese',
        'my': 'Burmese',
        'na': 'Nauru',
        'nb': 'Norwegian Bokmål',
        'nd': 'North Ndebele',
        'ne': 'Nepali (macrolanguage)',
        'ng': 'Ndonga',
        'nl': 'Dutch',
        'nn': 'Norwegian Nynorsk',
        'no': 'Norwegian',
        'nr': 'South Ndebele',
        'nv': 'Navajo',
        'ny': 'Nyanja',
        'oc': 'Occitan (post 1500)',
        'oj': 'Ojibwa',
        'om': 'Oromo',
        'or': 'Oriya (macrolanguage)',
        'os': 'Ossetian',
        'pa': 'Panjabi',
        'pi': 'Pali',
        'pl': 'Polish',
        'ps': 'Pushto',
        'pt': 'Portuguese',
        'qu': 'Quechua',
        'rm': 'Romansh',
        'rn': 'Rundi',
        'ro': 'Romanian',
        'ru': 'Russian',
        'rw': 'Kinyarwanda',
        'sa': 'Sanskrit',
        'sc': 'Sardinian',
        'sd': 'Sindhi',
        'se': 'Northern Sami',
        'sg': 'Sango',
        'sh': 'Serbo-Croatian',
        'si': 'Sinhala',
        'sk': 'Slovak',
        'sl': 'Slovenian',
        'sm': 'Samoan',
        'sn': 'Shona',
        'so': 'Somali',
        'sq': 'Albanian',
        'sr': 'Serbian',
        'ss': 'Swati',
        'st': 'Southern Sotho',
        'su': 'Sundanese',
        'sv': 'Swedish',
        'sw': 'Swahili (macrolanguage)',
        'ta': 'Tamil',
        'te': 'Telugu',
        'tg': 'Tajik',
        'th': 'Thai',
        'ti': 'Tigrinya',
        'tk': 'Turkmen',
        'tl': 'Tagalog',
        'tn': 'Tswana',
        'to': 'Tonga (Tonga Islands)',
        'tr': 'Turkish',
        'ts': 'Tsonga',
        'tt': 'Tatar',
        'tw': 'Twi',
        'ty': 'Tahitian',
        'ug': 'Uighur',
        'uk': 'Ukrainian',
        'ur': 'Urdu',
        'uz': 'Uzbek',
        've': 'Venda',
        'vi': 'Vietnamese',
        'vo': 'Volapük',
        'wa': 'Walloon',
        'wo': 'Wolof',
        'xh': 'Xhosa',
        'yi': 'Yiddish',
        'yo': 'Yoruba',
        'za': 'Zhuang',
        'zh': 'Chinese',
        'zu': 'Zulu',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String errors(String error) {
    String _temp0 = intl.Intl.selectLogic(
      error,
      {
        'purposeRequiredBelow': 'This purpose must be accepted at least partially!',
        'purposeRequired': 'This purpose must be accepted at least partially!',
        'purposeDataRecipientRequired': 'Some data recipients must be accepted for this purpose.',
        'purposeDataRecipientRequiredBelow': 'Some data recipients must be accepted for this purpose, see highlighted elements below!',
        'dataRecipientRequired': 'This data recipient must be accepted!',
        'purposeError': 'There are problems with the purposes of this category.',
        'purposeDataRequired': 'Some data must be accepted for this purpose.',
        'purposeDataRequiredBelow': 'Some data must be accepted for this purpose, see highlighted elements below!',
        'dataRequired': 'This data element must be accepted!',
        'other': 'unknown problem identified',
      },
    );
    return '$_temp0';
  }

  @override
  String get expand_all => 'expand all purposes';

  @override
  String get collapse_all => 'collapse all purposes';

  @override
  String get glossary => 'glossary';

  @override
  String get help => 'help';
}
