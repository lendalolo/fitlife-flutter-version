// import 'dart:io';
//
// Future<void> main() async {
//  const folderPath = 'my folder';
//  const file1Path = '$folderPath/file1.txt';
//  const file2Path = '$folderPath/file2.txt';
//  final folder = Directory(folderPath);
//  if (!(await folder.exists())) {
//   await folder.create();
//   print('Folder created: $folderPath');
//  }
//  final file1 = File(file1Path);
//  final file2 = File(file2Path);
//  await file1.create();
//  await file2.create();
//  await file1.writeAsString('Hello from file 1.\n');
//  await file2.writeAsString('Hello from file 2.\n');
//  print('Reading files:');
//  print(await file1.readAsString());
//  print(await file2.readAsString());
//  await file1.writeAsString('Appended line to file 1.\n', mode: FileMode.append);
//  print(await file1.readAsString());
//  if (await file2.exists()) {
//   await file2.delete();
//   print('Deleted file2.txt');
//  } else {
//   print('file2.txt does not exist.');
//  }
//  if (await folder.exists()) {
//   await folder.delete(recursive: true);
//   print(' Folder and remaining contents deleted.');
//  } else {
//   print('Folder does not exist.');
//  }
// }
