class LanguagesKey {
  final int id;
  final String name;
  final String languageCode;
  LanguagesKey(this.id, this.languageCode, this.name);

  static List<LanguagesKey> languagesKeyList() {
    return <LanguagesKey>[
      LanguagesKey(1, 'Indonesia', 'id'),
      LanguagesKey(2, 'English', 'en'),
    ];
  }
}
