// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get policy_edit_accept_bar_select_none => 'Nichts Auswählen';

  @override
  String get policy_edit_accept_bar_select_required => 'Erforderliche Auswählen';

  @override
  String get policy_edit_accept_bar_select_all => 'Alles Auswählen';

  @override
  String get policy_edit_accept_bar_next => 'Weiter';

  @override
  String get policy_edit_accept_bar_full_text_policy => 'Klassische Datenschutzerklärung';

  @override
  String get policy_edit_accept_bar_full_text_policy_not_provided => '???';

  @override
  String get policy_edit_checkout_bar_back => 'Zurück';

  @override
  String get policy_edit_description_title => 'Beschreibung';

  @override
  String get policy_edit_general_information_title => 'Allgemeine Informationen';

  @override
  String get policy_edit_general_information_data_controllers_title => 'Datenverantwortliche';

  @override
  String get policy_edit_general_information_data_controller => 'Datenverantwortliche Person';

  @override
  String get policy_edit_general_information_data_protection_officers_title => 'Datenschutzbeauftragte';

  @override
  String get policy_edit_general_information_data_subject_rights_title => 'Rechte der betroffenen Person';

  @override
  String get policy_edit_general_information_supervisory_authority_title => 'Aufsichtsbehörde';

  @override
  String get policy_edit_header_version => 'Version';

  @override
  String get policy_edit_header_version_not_provided => '???';

  @override
  String get policy_edit_header_difficulty_advanced => 'Fortgeschritten';

  @override
  String get policy_edit_header_difficulty_basic => 'Einfach';

  @override
  String get policy_edit_header_language_legally_binding => 'Verbindlich';

  @override
  String get policy_edit_processing_overview_title => 'Verarbeitungsübersicht';

  @override
  String policy_edit_purposes(String policy_edit_purposes_title) {
    String _temp0 = intl.Intl.selectLogic(
      policy_edit_purposes_title,
      {
        'vendorManagement': 'Verwaltung der Lieferanten',
        'serviceProvision': 'Bereitstellung des Dienstes',
        'researchAndDevelopment': 'Forschung und Entwicklung',
        'recordManagement': 'Verwaltung von Aufzeichnungen',
        'personalisation': 'Personalisierung',
        'organisationGovernance': 'Verwaltung der Organisation',
        'marketing': 'Vermarktung',
        'legalCompliance': 'Einhaltung von Rechtsvorschriften',
        'accountManagement': 'Verwaltung des Kontos',
        'communicationManagement': 'Verwaltung der Kommunikation',
        'customerManagement': 'Verwaltung der Kunden',
        'enforceSecurity': 'Durchsetzung der Sicherheit',
        'humanResourceManagement': 'Verwaltung des Personals',
        'other': 'Sonstiges',
      },
    );
    return '$_temp0';
  }

  @override
  String get policy_edit_purposes_title => 'Verwendungszwecke';

  @override
  String get policy_checkout_purpose_details => 'Details der Verwendungszwecke';

  @override
  String get purpose_card_description => 'Beschreibung';

  @override
  String get purpose_card_data => 'Daten';

  @override
  String get purpose_card_retention => 'Aufbewahrungszeit';

  @override
  String get purpose_card_legal_bases => 'Rechtlichsgrundlage';

  @override
  String get purpose_card_data_recipients => 'Datenverarbeiter';

  @override
  String get purpose_card_automated_decision_making => 'automatisierte Entscheidungsfindung';

  @override
  String get purpose_card_more_details => 'weitere Informationen';

  @override
  String get purpose_card_privacy_models => 'Datenschutzmodelle';

  @override
  String get purpose_card_pseudonymization => 'Pseudonymisierung';

  @override
  String get purpose_card_privacy_models_and_pseudonymization => 'Technische Informationen';

  @override
  String get purpose_card_required => 'erforderlich';

  @override
  String get purpose_card_sub_purposes => 'Untergeordnete Verwendungszwecke';

  @override
  String get years => 'Jahre';

  @override
  String get months => 'Monate';

  @override
  String get days => 'Tage';

  @override
  String retention_types(String purpose_card_retention) {
    String _temp0 = intl.Intl.selectLogic(
      purpose_card_retention,
      {
        'indefinite': 'auf unbestimmte Zeit',
        'afterPurpose': 'nach dem Ende des Verwendungszwecks',
        'fixedDate': 'bis zu einem bestimmten Datum',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get retention_indefinite => 'auf unbestimmte Zeit';

  @override
  String get retention_after_purpose => 'nach dem Ende des Verwendungszwecks';

  @override
  String get retention_fixed_Date => 'bis zum';

  @override
  String date(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String get data_description => 'Beschreibung';

  @override
  String get data_anonymized => 'anonymisiert';

  @override
  String get data_recipient_description => 'Beschreibung';

  @override
  String get data_recipient_country => 'Zielland';

  @override
  String get data_recipient_type => 'Typ';

  @override
  String get data_recipient_safeguards => 'Sicherungsmaßnahmen';

  @override
  String get matrix_external_empty => 'Es gibt keine darzustellende Datenverarbeitung!';

  @override
  String privacy_groups(String privacy_group) {
    String _temp0 = intl.Intl.selectLogic(
      privacy_group,
      {
        'EI': 'eindeutig identifizierende Informationen',
        'QID': 'teilweise identifizierende Informationen',
        'SD': 'sensible Informationen',
        'NSD': 'nicht sensible Daten',
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
        'dc_derived': 'abgeleitete personenbezogene Daten',
        'dc_knowledge': 'Glauben und Wissen',
        'dc_authenticating': 'Authentifizierung',
        'dc_preference': 'Präferenz',
        'dc_identifying': 'Identifizierung',
        'dc_ethnicity': 'Ethnie',
        'dc_behavioral': 'Verhalten',
        'dc_demographic': 'Demographie',
        'dc_physical': 'physikalische Eigenschaften',
        'dc_computer': 'Geräteinformationen',
        'dc_contact': 'Kontaktinformationen',
        'dc_location': 'Standort',
        'dc_historical': 'historische Informationen',
        'dc_account': 'Kontoinformationen',
        'dc_ownership': 'Eigentumsverhältnisse',
        'dc_transactional': 'Transaktionsinformationen',
        'dc_credit': 'Kreditwürdigkeit',
        'dc_professional': 'Berufsinformationen',
        'dc_criminal': 'strafrechtliche Informationen',
        'dc_public': 'öffentliches Leben',
        'dc_family': 'Familie',
        'dc_social': 'soziale Netzwerke',
        'dc_communication': 'Kommunikationsinhalte',
        'dc_medical': 'Gesundheitsinformationen',
        'dc_sexual': 'Sexualität',
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
        'LegalEntity': 'juristische Person',
        'Person': 'Einzelperson',
        'PublicAuthority': 'öffentliche Einrichtung',
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
        'consent': 'Zustimmung',
        'contract': 'Vertragserfüllung',
        'legalObligation': 'gesetzliche Verpflichtung',
        'vitalInterest': 'wesentliches Interesse',
        'publicTask': 'öffentliche Aufgabe',
        'legitimateInterest': 'berechtigtes Interesse',
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
        '_': 'Land unbekannt',
        'AF': 'Afghanistan',
        'EG': 'Ägypten',
        'AL': 'Albanien',
        'DZ': 'Algerien',
        'AD': 'Andorra',
        'AO': 'Angola',
        'AG': 'AntiguaundBarbuda',
        'GQ': 'Äquatorialguinea',
        'AR': 'Argentinien',
        'AM': 'Armenien',
        'AZ': 'Aserbaidschan',
        'ET': 'Äthiopien',
        'AU': 'Australien',
        'BS': 'Bahamas',
        'BH': 'Bahrain',
        'BD': 'Bangladesch',
        'BB': 'Barbados',
        'BE': 'Belgien',
        'BZ': 'Belize',
        'BJ': 'Benin',
        'BT': 'Bhutan',
        'BO': 'Bolivien',
        'BA': 'BosnienundHerzegowina',
        'BW': 'Botsuana',
        'BR': 'Brasilien',
        'BN': 'BruneiDarussalam',
        'BG': 'Bulgarien',
        'BF': 'BurkinaFaso',
        'BI': 'Burundi',
        'CL': 'Chile',
        'CN': 'China',
        'CK': 'Cookinseln',
        'CR': 'CostaRica',
        'CI': 'Côted\'Ivoire',
        'DK': 'Dänemark',
        'DE': 'Deutschland',
        'DM': 'Dominica',
        'DO': 'DominikanischeRepublik',
        'DJ': 'Dschibuti',
        'EC': 'Ecuador',
        'SV': 'ElSalvador',
        'ER': 'Eritrea',
        'EE': 'Estland',
        'FJ': 'Fidschi',
        'FI': 'Finnland',
        'FR': 'Frankreich',
        'GA': 'Gabun',
        'GM': 'Gambia',
        'GE': 'Georgien',
        'GH': 'Ghana',
        'GD': 'Grenada',
        'GR': 'Griechenland',
        'GT': 'Guatemala',
        'GN': 'Guinea',
        'GW': 'Guinea Bissau',
        'GY': 'Guyana',
        'HT': 'Haiti',
        'HN': 'Honduras',
        'IN': 'Indien',
        'ID': 'Indonesien',
        'IQ': 'Irak',
        'IR': 'Iran,IslamischeRepublik',
        'IE': 'Irland',
        'IS': 'Island',
        'IL': 'Israel',
        'IT': 'Italien',
        'JM': 'Jamaika',
        'JP': 'Japan',
        'YE': 'Jemen',
        'JO': 'Jordanien',
        'KH': 'Kambodscha',
        'CM': 'Kamerun',
        'CA': 'Kanada',
        'CV': 'KapVerde',
        'KZ': 'Kasachstan',
        'QA': 'Katar',
        'KE': 'Kenia',
        'KG': 'Kirgisistan',
        'KI': 'Kiribati',
        'CO': 'Kolumbien',
        'KM': 'Komoren',
        'CG': 'Kongo',
        'CD': 'Kongo,DemokratischeRepublik',
        'KP': 'Korea,DemokratischeVolksrepublik',
        'KR': 'Korea,Republik',
        'HR': 'Kroatien',
        'CU': 'Kuba',
        'KW': 'Kuwait',
        'LA': 'Laos,DemokratischeVolksrepublik',
        'LS': 'Lesotho',
        'LV': 'Lettland',
        'LB': 'Libanon',
        'LR': 'Liberia',
        'LY': 'Libysch ArabischeDschamahirija',
        'LI': 'Liechtenstein',
        'LT': 'Litauen',
        'LU': 'Luxemburg',
        'MG': 'Madagaskar',
        'MW': 'Malawi',
        'MY': 'Malaysia',
        'MV': 'Malediven',
        'ML': 'Mali',
        'MT': 'Malta',
        'MA': 'Marokko',
        'MH': 'Marshallinseln',
        'MR': 'Mauretanien',
        'MU': 'Mauritius',
        'MK': 'Mazedonien,ehemaligejugoslawischeRepublik',
        'MX': 'Mexiko',
        'FM': 'Mikronesien,FöderierteStaatenvon',
        'MD': 'Moldau,Republik',
        'MC': 'Monaco',
        'MN': 'Mongolei',
        'ME': 'Montenegro',
        'MZ': 'Mosambik',
        'MM': 'Myanmar',
        'NA': 'Namibia',
        'NR': 'Nauru',
        'NP': 'Nepal',
        'NZ': 'Neuseeland',
        'NI': 'Nicaragua',
        'NL': 'Niederlande',
        'NE': 'Niger',
        'NG': 'Nigeria',
        'NU': 'Niue',
        'NO': 'Norwegen',
        'OM': 'Oman',
        'AT': 'Österreich',
        'PK': 'Pakistan',
        'PW': 'Palau',
        'PA': 'Panama',
        'PG': 'Papua Neuguinea',
        'PY': 'Paraguay',
        'PE': 'Peru',
        'PH': 'Philippinen',
        'PL': 'Polen',
        'PT': 'Portugal',
        'RW': 'Ruanda',
        'RO': 'Rumänien',
        'RU': 'RussischeFöderation',
        'SB': 'Salomonen',
        'ZM': 'Sambia',
        'WS': 'Samoa',
        'SM': 'SanMarino',
        'ST': 'SãoToméundPríncipe',
        'SA': 'Saudi Arabien',
        'SE': 'Schweden',
        'CH': 'Schweiz',
        'SN': 'Senegal',
        'RS': 'Serbien',
        'SC': 'Seychellen',
        'SL': 'SierraLeone',
        'ZW': 'Simbabwe',
        'SG': 'Singapur',
        'SK': 'Slowakei',
        'SI': 'Slowenien',
        'SO': 'Somalia',
        'ES': 'Spanien',
        'LK': 'SriLanka',
        'KN': 'St.KittsundNevis',
        'LC': 'St.Lucia',
        'VC': 'St.VincentunddieGrenadinen',
        'ZA': 'Südafrika',
        'SD': 'Sudan',
        'SR': 'Suriname',
        'SZ': 'Swasiland',
        'SY': 'Syrien,ArabischeRepublik',
        'TJ': 'Tadschikistan',
        'TZ': 'Tansania,VereinigteRepublik',
        'TH': 'Thailand',
        'TL': 'Timor Leste',
        'TG': 'Togo',
        'TO': 'Tonga',
        'TT': 'TrinidadundTobago',
        'TD': 'Tschad',
        'CZ': 'TschechischeRepublik',
        'TN': 'Tunesien',
        'TR': 'Türkei',
        'TM': 'Turkmenistan',
        'TV': 'Tuvalu',
        'UG': 'Uganda',
        'UA': 'Ukraine',
        'HU': 'Ungarn',
        'UY': 'Uruguay',
        'UZ': 'Usbekistan',
        'VU': 'Vanuatu',
        'VA': 'Vatikanstadt',
        'VE': 'Venezuela',
        'AE': 'VereinigteArabischeEmirate',
        'US': 'VereinigteStaaten',
        'GB': 'VereinigtesKönigreich',
        'VN': 'Vietnam',
        'BY': 'Weißrussland',
        'CF': 'ZentralafrikanischeRepublik',
        'CY': 'Zypern',
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
        'af': 'Afrikaans',
        'ar': 'Arabisch',
        'bg': 'Bulgarisch',
        'bo': 'Tibetanisch',
        'br': 'Bretonisch',
        'ca': 'Katalanisch',
        'co': 'Korsisch',
        'cs': 'Tschechisch',
        'cy': 'Walisisch',
        'da': 'Dänisch',
        'de': 'Deutsch',
        'el': 'Griechisch',
        'en': 'Englisch',
        'eo': 'Esperanto',
        'es': 'Spanisch',
        'et': 'Estnisch',
        'eu': 'Baskisch',
        'fa': 'Persisch',
        'fi': 'Finnisch',
        'fo': 'Färöisch',
        'fr': 'Französisch',
        'ga': 'Irisch',
        'he': 'Hebräisch',
        'hi': 'Hindi',
        'hr': 'Kroatisch',
        'hu': 'Ungarisch',
        'hy': 'Armenisch',
        'id': 'Indonesisch',
        'is': 'Isländisch',
        'it': 'Italienisch',
        'ja': 'Japanisch',
        'ka': 'Georgisch',
        'kk': 'Kasachisch',
        'ko': 'Koreanisch',
        'ku': 'Kurdisch',
        'la': 'Lateinisch',
        'lv': 'Lettisch',
        'mk': 'Mazedonisch',
        'mn': 'Mongolisch',
        'mo': 'Moldavisch',
        'ms': 'Malaysisch',
        'mt': 'Maltesisch',
        'ne': 'Nepalesisch',
        'nl': 'Niederländisch',
        'no': 'Norwegisch',
        'pa': 'Pundjabisch',
        'pl': 'Polnisch',
        'pt': 'Portugiesisch',
        'ro': 'Rumänisch',
        'ru': 'Russisch',
        'sk': 'Slowakisch',
        'sl': 'Slowenisch',
        'so': 'Somalisch',
        'sq': 'Albanisch',
        'sr': 'Serbisch',
        'sv': 'Schwedisch',
        'sw': 'Suaheli',
        'th': 'Thai',
        'tr': 'Türkisch',
        'uk': 'Ukrainisch',
        'ur': 'Urdu',
        'uz': 'Usbekisch',
        'vi': 'Vietnamesisch',
        'yi': 'Jiddish',
        'zh': 'Chinesisch',
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
        'purposeRequiredBelow': 'Dieser Verwendungszweck muss mindestens teilweise akzeptiert werden!',
        'purposeRequired': 'Dieser Verwendungszweck muss mindestens teilweise akzeptiert werden!',
        'purposeDataRecipientRequired': 'Einige Empfänger dieses Verwendungszwecks müssen akzeptiert werden.',
        'purposeDataRecipientRequiredBelow': 'Einige Empfänger dieses Verwendungszwecks müssen akzeptiert werden, beachten Sie die unten hervorgehobenen Empfänger!',
        'dataRecipientRequired': 'Dieser Empfänger muss akzeptiert werden!',
        'purposeError': 'Es liegen Probleme mit den Verwendungszwecken in dieser Kategorie vor.',
        'purposeDataRequired': 'Einige Daten dieses Verwendungszwecks müssen akzeptiert werden.',
        'purposeDataRequiredBelow': 'Einige Daten dieses Verwendungszwecks müssen akzeptiert werden, beachten Sie die unten hervorgehobenen Daten!',
        'dataRequired': 'Diese Daten müssen akzeptiert werden!',
        'other': 'Unbekanntes Problem identifiziert',
      },
    );
    return '$_temp0';
  }

  @override
  String get expand_all => 'Alle Verwendungszwecke aufklappen';

  @override
  String get collapse_all => 'Alle Verwendungszwecke zuklappen';

  @override
  String get glossary => 'Glossar';

  @override
  String get help => 'Hilfe';
}
