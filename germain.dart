import 'dart:io';

void main() {
  bool exit = false;
  print('Bem-vindo ao Gerenciador de Arquivos!');
  
  while (!exit) {
    print('Selecione uma opção:');
    print('1. Listar arquivos em um diretório');
    print('2. Criar um diretório');
    print('3. Criar um arquivo');
    print('4. Ler o conteúdo de um arquivo');
    print('5. Escrever conteúdo em um arquivo');
    print('6. Sair');

    String option = stdin.readLineSync() ?? '';
    
    switch (option) {
      case '1':
        listFiles();
        break;
      case '2':
        createDirectory();
        break;
      case '3':
        createFile();
        break;
      case '4':
        readFile();
        break;
      case '5':
        writeFile();
        break;
      case '6':
        exit = true;
        break;
      default:
        print('Opção inválida. Tente novamente.');
        break;
    }

    print('\n');
  }
}

void listFiles() {
  print('Digite o caminho do diretório:');
  String directoryPath = stdin.readLineSync() ?? '';

  try {
    Directory directory = Directory(directoryPath);
    if (directory.existsSync()) {
      List<FileSystemEntity> files = directory.listSync();
      print('Arquivos no diretório:');
      files.forEach((file) => print(file.path));
    } else {
      print('O diretório não existe.');
    }
  } catch (e) {
    print('Ocorreu um erro ao listar os arquivos: $e');
  }
}

void createDirectory() {
  print('Digite o caminho do diretório que deseja criar:');
  String directoryPath = stdin.readLineSync() ?? '';

  try {
    Directory directory = Directory(directoryPath);
    directory.createSync(recursive: true);
    print('Diretório criado com sucesso!');
  } catch (e) {
    print('Ocorreu um erro ao criar o diretório: $e');
  }
}

void createFile() {
  print('Digite o caminho do arquivo que deseja criar:');
  String filePath = stdin.readLineSync() ?? '';

  try {
    File file = File(filePath);
    file.createSync(recursive: true);
    print('Arquivo criado com sucesso!');
  } catch (e) {
    print('Ocorreu um erro ao criar o arquivo: $e');
  }
}

void readFile() {
  print('Digite o caminho do arquivo que deseja ler:');
  String filePath = stdin.readLineSync() ?? '';

  try {
    File file = File(filePath);
    if (file.existsSync()) {
      String content = file.readAsStringSync();
      print('Conteúdo do arquivo:');
      print(content);
    } else {
      print('O arquivo não existe.');
    }
  } catch (e) {
    print('Ocorreu um erro ao ler o arquivo: $e');
  }
}

void writeFile() {
  print('Digite o caminho do arquivo que deseja escrever:');
  String filePath = stdin.readLineSync() ?? '';

  print('Digite o conteúdo do arquivo:');
  String content = stdin.readLineSync() ?? '';

  try {
    File file = File(filePath);
    file.writeAsStringSync(content);
    print('Conteúdo gravado no arquivo com sucesso!');
  } catch (e) {
    print('Ocorreu um erro ao gravar o arquivo: $e');
  }
}