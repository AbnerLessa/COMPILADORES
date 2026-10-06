var fs = require('fs');
var parser = require('./C_Compiler').parser;

var filename = process.argv[2];
if (!filename) {
    console.log('Uso: node run_compiler.js <arquivo_entrada>');
    process.exit(1);
}

try {
    var input = fs.readFileSync(filename, 'utf8');
    console.log('  Compilador C — Arquivo: ' + filename);
    console.log('--- INICIO DA ANALISE LEXICA E SINTATICA ---\n');
    parser.parse(input);
    console.log('\n--- FIM DA ANALISE ---');
} catch (e) {
    console.error('\nERRO durante a analise:');
    console.error(e.message || e);
    process.exitCode = 1;
}
