const fs = require('fs');
const util = require('util');
const path = require('path');
const parseCommand = require('shell-quote').parse;
const { exec } = require('promisify-child-process');

const readFile = util.promisify(fs.readFile);
const readdir = util.promisify(fs.readdir);

<<<<<<< HEAD
const getLastCommand = async (dir = process.cwd()) => {
=======
const getLastCommand = async (howManyBack = 0, parse = true, dir = process.cwd()) => {
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
  const pathToBashLogs = path.join(dir, '../../', '.bash_history');
  const bashLogs = await readFile(pathToBashLogs, 'utf8');

  if (!bashLogs) {
    throw new Error(`Could not find ${pathToBashLogs}`);
  }

  const logs = bashLogs.split('\n');
<<<<<<< HEAD
  const lastLog = logs[logs.length - 2];
  const parsedCommand = parseCommand(lastLog);

  return parsedCommand;
=======
  const lastLog = logs[logs.length - howManyBack - 2];

  if(parse) {
    return parseCommand(lastLog);
  } else {
    return lastLog;
  }
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
};

const getNextCommand = async (dir = process.cwd()) => {
  const pathToNextCommandLogs = path.join(dir, './test', '.next_command');
  const nextCommandLogs = await readFile(pathToNextCommandLogs, 'utf8');

  if (!nextCommandLogs) {
    throw new Error(`Could not find ${pathToNextCommandLogs}`);
  }

  const logs = nextCommandLogs.split('\n');
  const nextCommand = logs[logs.length - 2];
  const parsedCommand = parseCommand(nextCommand);

  return parsedCommand;
};

const getCwd = async (dir = process.cwd()) => {
  const pathToCwdLogs = path.join(dir, './test', '.cwd');
  const cwdLogs = await readFile(pathToCwdLogs, 'utf8');

  if (!cwdLogs) {
    throw new Error(`Could not find ${pathToCwdLogs}`);
  }

  const logs = cwdLogs.split('\n');
  const lastLog = logs[logs.length - 2];

  return lastLog;
};

const getPreviousCwd = async (dir = process.cwd()) => {
  const pathToCwdLogs = path.join(dir, './test', '.cwd');
  const cwdLogs = await readFile(pathToCwdLogs, 'utf8');

  if (!cwdLogs) {
    throw new Error(`Could not find ${pathToCwdLogs}`);
  }

  const logs = cwdLogs.split('\n');
  const previousLog = logs[logs.length - 3];

  return previousLog;
};

const getDirectoryContents = async (dir = process.cwd()) => {
  const directoryContents = await readdir(dir);

  if (!directoryContents) {
    throw new Error(`Could not find folder ${dir}`);
  }

  return directoryContents;
};

const getPgLogs = async (dir = process.cwd()) => {
<<<<<<< HEAD
  const pathToPgLogs = path.join(dir, './test', 'pg.log');
=======
  const pathToPgLogs = path.join(dir, '../../', 'pg.log');
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
  const pgLogs = await readFile(pathToPgLogs, 'utf8');

  if (!pgLogs) {
    throw new Error(`Could not find ${pathToPgLogs}`);
  }
  return pgLogs;
};

const getLastLog = async (removeWhiteSpace = false, logsBack = 1) => {
<<<<<<< HEAD
  const pathToPgLogs = path.join(process.cwd(), './test', 'pg.log');
=======
  const pathToPgLogs = path.join(process.cwd(), '../../', 'pg.log');
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
  const pgLogs = await readFile(pathToPgLogs, 'utf8');

  if (!pgLogs) {
    throw new Error(`Could not find ${pathToPgLogs}`);
  }

  const logsArray = pgLogs.split('LOG: ');
  const previousLog = logsArray[logsArray.length - logsBack];

  if (removeWhiteSpace) return previousLog.replace(/\s/g, '');

  return previousLog;
};

const getLastQueryResult = async () => {
<<<<<<< HEAD
  const pathToQueryResults = path.join(process.cwd(), './test', 'queryResults.log');
=======
  const pathToQueryResults = path.join(process.cwd(), '../../', 'queryResults.log');
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
  const queryResults = await readFile(pathToQueryResults, 'utf8');

  if (!queryResults) {
    throw new Error(`Could not find ${pathToQueryResults}`);
  }

  const regexSplitter = /\n{2,}/g;
  const resultsArray = queryResults.split(regexSplitter);
  const lastResult = resultsArray[resultsArray.length - 2];

  return lastResult.replace(/\s/g, '');
};

const getFileContents = async (file = process.cwd()) => {
  const fileContents = await readFile(file);

  if (!fileContents) {
    throw new Error(`Could not read file ${file}`);
  }

  return fileContents.toString();
};

<<<<<<< HEAD
=======
const canExecute = async function(file) {
  try {
    fs.accessSync(file, fs.constants.X_OK);
    return true;
  } catch (err) {
    return false;
  }
}

>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
const getScriptOutput = async function (command) {
  let nextInput = 1;

  const child = exec(command, {});
  child.stdout.on('data', () => {
    if (arguments[nextInput]) {
      child.stdin.write(`${arguments[nextInput++] || ''}\n`);
    }
  });

  child.stderr.on('data', err => {
    console.log(`An error occurred running ${command}`);
    console.log(err);
  });

  setTimeout(() => {
    child.kill();
  }, 1000);

  const { stdout } = await child;
  return stdout;
};

<<<<<<< HEAD
const canExecute = async function(file) {
  try {
    fs.accessSync(file, fs.constants.X_OK);
    return true;
  } catch (err) {
    return false;
  }
}

=======
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
exports.getLastCommand = getLastCommand;
exports.getNextCommand = getNextCommand;
exports.getCwd = getCwd;
exports.getPreviousCwd = getPreviousCwd;
exports.getDirectoryContents = getDirectoryContents;
exports.getPgLogs = getPgLogs;
exports.getLastLog = getLastLog;
exports.getLastQueryResult = getLastQueryResult;
exports.getFileContents = getFileContents;
<<<<<<< HEAD
exports.getScriptOutput = getScriptOutput;
exports.canExecute = canExecute;
=======
exports.canExecute = canExecute;
exports.getScriptOutput = getScriptOutput;
>>>>>>> f2e0d8ee0c06afa8e8312b3bd3ae62bb368c75f5
