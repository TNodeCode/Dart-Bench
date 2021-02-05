import 'package:args/args.dart';

ArgResults argResults;
const flagNumber = 'maxNumber';
const flagThreads = 'nThreads';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(flagNumber, abbr: 'n', defaultsTo: '10000')
    ..addOption(flagThreads, abbr: 't', defaultsTo: '1');

  argResults = parser.parse(arguments);

  int argMaxNumber = int.parse(argResults[flagNumber]);
  int primesFound = findPrimeNumbers(argMaxNumber);

  print('Found ' + primesFound.toString() + ' prime numbers');
}

int findPrimeNumbers(int maxNumber) {
  int counter = 0;

  for (int i = 2; i < maxNumber; i++) {
    if (isPrime(i)) {
      counter++;
    }
  }

  return counter;
}

bool isPrime(int n) {
  for (int i = 2; i < n - 1; i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}
