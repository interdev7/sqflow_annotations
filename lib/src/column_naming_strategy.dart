enum ColumnNamingStrategy {
  /// Преобразование camelCase → snake_case (стандартное поведение большинства SQL-проектов)
  snakeCase,

  /// Имя колонки = имя поля в Dart (camelCase как есть)
  camelCase,

  /// Имя колонки берётся ТОЛЬКО из свойства `name: '...'`
  /// Если `name` не указано → ошибка генерации
  custom,
}
