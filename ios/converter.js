const fs = require("fs");
const path = require("path");

const inputFile = process.argv[2];
if (!inputFile) {
  console.error("❌ Usage: node convert.js <inputFile>");
  process.exit(1);
}

const input = fs.readFileSync(inputFile, "utf8");

let insideNewArchBlock = false;

const lines = input.split("\n");
const outputLines = [];

// Updated regex to capture extra args after `tag`
const regex =
  /([^;{\n\r]+)\[\[self documentViewManager\]\s+([A-Za-z_]*)ForDocumentViewTag:tag([^;]*);/;

for (let i = 0; i < lines.length; i++) {
  const line = lines[i];

  if (line.includes("#if RCT_NEW_ARCH_ENABLED")) {
    insideNewArchBlock = true;
    outputLines.push(line);
    continue;
  }

  if (line.includes("#endif")) {
    insideNewArchBlock = false;
    outputLines.push(line);
    continue;
  }

  if (insideNewArchBlock) {
    outputLines.push(line);
    continue;
  }

  const match = line.match(regex);

  if (match) {
    const prefix = match[1];
    const methodName = match[2];
    let extraArgs = match[3] || "";

    // Trim trailing spaces and closing brackets ']' from extraArgs
    extraArgs = extraArgs.replace(/[\]\s]*$/, "");

    const indentMatch = line.match(/^([ \t]*)/);
    const indent = indentMatch ? indentMatch[1] : "";

    const nextLine = lines[i + 1] || "";
    const hasResolve = nextLine.trim().startsWith("resolve");

    let newBlock = `
${indent}#if RCT_NEW_ARCH_ENABLED
${indent}[_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
${indent}    RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
${indent}    ${prefix}[[self documentViewManager] ${methodName}ForDocumentView:documentView${extraArgs}];`;

    if (hasResolve) {
      newBlock += `
${indent}    ${nextLine.trim()}`;
    }

    newBlock += `
${indent}}];
${indent}#else
${indent}${prefix}[[self documentViewManager] ${methodName}ForDocumentViewTag:tag${extraArgs}];`;

    if (hasResolve) {
      newBlock += `
${indent}${nextLine.trim()}`;
    }

    newBlock += `
${indent}#endif`;

    outputLines.push(newBlock.trim());

    if (hasResolve) {
      i++; // skip original resolve line
    }
  } else {
    outputLines.push(line);
  }
}

const outputFile =
  path.basename(inputFile).replace(/\.m$/, "") + ".converted.m";
fs.writeFileSync(outputFile, outputLines.join("\n"));
console.log(`✅ Done! Saved to ${outputFile}`);
