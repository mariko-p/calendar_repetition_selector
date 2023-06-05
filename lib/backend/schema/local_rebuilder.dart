// Note(istepanic): Implement this class to rebuild the firestore entites.
// Implement this class to rebuild the firestore entities (records and structures).
// This package: FF-Custom-Recurring-Selectors only uses the structures.
// After 20. 5. 2023. FlutterFlow no longer supports the rebuilder classes.
// Every time you change the schema, you will need to manually update the rebuilder classes.
abstract class LocalRebuilder<T> {
  T? rebuild<T>();
} 