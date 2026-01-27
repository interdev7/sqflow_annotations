# sqflow_annotations

Annotation library for declarative SQL table and schema definitions in Dart.

This package provides a small set of annotations intended to be used by a source code generator (for example, a builder using `source_gen`/`build_runner`) to produce SQL table definitions, migrations, and runtime metadata from Dart model classes.

Package
-------

- Name: `sqflow_annotations`
- Version: 1.0.0
- Dart SDK: >=3.0.0 <4.0.0

Installation
------------

Add to your `pubspec.yaml` (if publishing, replace `publish_to: none` accordingly):

dependencies:
  sqflow_annotations: ^1.0.0

dev_dependencies:
  build_runner: ^2.4.0
  sqflow_generator: ^1.0.0  # replace with actual generator package if different

Then run:

```bash
dart pub get
```

Usage
-----

Import the annotations in your Dart code:

```dart
import 'package:sqflow_annotations/sqflow_annotations.dart';
```

Annotate your classes and fields to describe tables and columns. The generator will consume these annotations and emit SQL schemas, migration helpers, or runtime metadata.

A minimal example (update with the actual annotation names if different):

```dart
@Table('users')
class User {
  @PrimaryKey()
  final int id;

  @Column('username')
  final String username;

  @Column('email', unique: true)
  final String email;

  User(this.id, this.username, this.email);
}
```

Run the code generator (example):

```bash
dart run build_runner build --delete-conflicting-outputs
```

Replace the command above with `flutter pub run build_runner build` if used in a Flutter project.

Annotations (reference)
-----------------------

Note: Replace or extend the list below once you confirm the exact annotation class names and options in `lib/`.

- `@Table(String name)` — Marks a Dart class as representing a database table. `name` is the table name.
- `@Column(String name, {String? type, bool unique = false, bool nullable = false, dynamic defaultValue})` — Declares a column for a field. Options may include SQL type mapping, uniqueness, nullability and a default value.
- `@PrimaryKey({bool autoIncrement = false})` — Marks a field as the primary key. Optionally allow auto-increment behavior.
- `@Ignore()` — Excludes a field from being generated as a column.

Examples and generated output
----------------------------

After running the generator, generated files will typically be placed under `lib/src/generated/` or `build/` depending on your generator configuration. Generated code may include:

- Table definition classes
- Column metadata
- DAO / helper methods for CRUD operations
- Migration scripts or version metadata

Contributing
------------

Contributions are welcome. Suggested workflow:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/your-feature`.
3. Add/update tests and examples.
4. Run `dart format` and `dart analyze`.
5. Open a pull request describing the changes.

If you add or change annotations, please include examples showing the usage and update this README accordingly.

License
-------

Specify a license for this repository (e.g., MIT). If you want me to add a default license file, tell me which license to use and I can create `LICENSE`.

Maintainers
-----------

- interdev7 (https://github.com/interdev7)

Acknowledgements
----------------

- Intended to be used alongside generator packages and runtimes such as `sqflow_generator`/`sqflow` (replace with the actual runtime package names used in your project).