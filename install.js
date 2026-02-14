#!/usr/bin/env node

/**
 * skills-list npm package installer
 * Automatically installs the skill to .claude/skills/ directory
 */

const fs = require('fs');
const path = require('path');

const SKILL_SOURCE = path.join(__dirname, 'SKILL.md');
const SKILL_NAME = 'skills-list.md';

// Determine installation directory
// Priority: project level (.claude/skills/) > user level (~/.claude/skills/)
const projectSkillsDir = path.join(process.cwd(), '.claude', 'skills');
const userSkillsDir = path.join(process.env.HOME || process.env.USERPROFILE, '.claude', 'skills');

let targetDir;
let installType;

if (fs.existsSync(path.join(process.cwd(), '.git')) || fs.existsSync(path.join(process.cwd(), 'package.json'))) {
    // Project level installation
    targetDir = projectSkillsDir;
    installType = 'project';
} else {
    // User level installation
    targetDir = userSkillsDir;
    installType = 'user';
}

// Create directory if it doesn't exist
if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
}

// Copy skill file
const targetPath = path.join(targetDir, SKILL_NAME);
fs.copyFileSync(SKILL_SOURCE, targetPath);

console.log('\n\x1b[32m╔═══════════════════════════════════════════╗\x1b[0m');
console.log('\x1b[32m║      skills-list installed!               ║\x1b[0m');
console.log('\x1b[32m╚═══════════════════════════════════════════╝\x1b[0m');
console.log(`\n\x1b[36mInstallation type:\x1b[0m ${installType} level`);
console.log(`\x1b[36mSkill location:\x1b[0m ${targetPath}`);
console.log('\n\x1b[33mUsage:\x1b[0m');
console.log('  In Claude Code, say: "有哪些skills？" or "查看skills列表"');
console.log('');
