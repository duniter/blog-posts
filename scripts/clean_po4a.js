var fs = require('fs');

var content = fs.readFileSync(process.argv[2], 'utf8');

// To Unix style
content = content.replace(/\r\n/gm, '\n');

content = content.replace(/\n/gm, '===');
content = content.replace(/======/gm, '\n\n');

var lines = content.split('\n');

for (var i = 0; i < lines.length; i++) {
    var line = lines[i];
    var codeWithCRregexp = /```(.*)===(.*)```/;
    var matches;
    do {
        matches = line.match(codeWithCRregexp);
        if (matches) {
            line = line.replace(codeWithCRregexp, '```' + matches[1] + 'BBB' + matches[2] + '```');
        }
    } while (matches);
    lines[i] = line.replace(/BBB/g, '\n');
}

content = lines.join('\n');
content = content.replace(/===>/gm, '\n>');
content = content.replace(/[?.!]\s+(#+)/gm, '.\n$1');
content = content.replace(/===(#+)/gm, '\n\n$1');
content = content.replace(/(\w)===(\s)*\* /gm, '$1\n$2* ');
content = content.replace(/([^\w\s])===(\s)*\* /gm, '$1\n$2* ');
content = content.replace(/===\* /gm, '\n* ');
content = content.replace(/===\*/gm, ' *');
content = content.replace(/===\*/gm, '\n*');
content = content.replace(/===```/gm, '\n```');
content = content.replace(/=== -/gm, '\n\n*');
content = content.replace(/=== -/gm, '\n\n*');
content = content.replace(/\.    -/gm, '\n -');
content = content.replace(/^ -/gm, '*');
content = content.replace(/\.===/gm, '.\n');
content = content.replace(/===/gm, ' ');

console.log(content);

process.exit(0);
