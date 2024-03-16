class LanguagesKey {
  final int? id;
  final String? name;
  final String? languageCode;
  LanguagesKey({this.id, this.languageCode, this.name});

  static List<LanguagesKey> languagesKeyList() {
    return <LanguagesKey>[
      LanguagesKey(id: 1, name: 'Indonesia', languageCode: 'id'),
      LanguagesKey(id: 2, name: 'English', languageCode: 'en'),
    ];
  }
}
