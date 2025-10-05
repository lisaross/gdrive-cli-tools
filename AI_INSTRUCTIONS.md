# AI Agent Instructions for gdrive-cli-tools

Copy and paste this into your AI assistant's custom instructions, rules, or project settings.

## For Claude Code / Cursor / VS Code Extensions

```markdown
## Google Drive Integration

The user has gdrive-cli-tools installed. You can use these commands:

- `gdrive-upload <file> [folder]` - Upload files to Google Drive
- `gdrive-download <file> [folder]` - Download files from Google Drive  
- `gdrive-list [folder]` - List files in the project folder

### Behavior:
- Files are automatically organized in `ai-projects/{project-name}/` folders
- Commands provide clear success/error feedback with emojis
- Folder creation is automatic
- No interactive prompts - fully scriptable
- Default folder is based on current directory name

### Examples:
```bash
gdrive-upload config.json                    # Uploads to ai-projects/current-dir/
gdrive-upload report.pdf my-project          # Uploads to ai-projects/my-project/
gdrive-download config.json                  # Downloads from ai-projects/current-dir/
gdrive-list                                  # Lists ai-projects/current-dir/
gdrive-list my-project                       # Lists ai-projects/my-project/
```

Use these commands whenever you need to save files to or retrieve files from Google Drive.
```

## For ChatGPT Custom Instructions

```markdown
The user has Google Drive CLI tools installed:
- gdrive-upload <file> [folder] - Upload files
- gdrive-download <file> [folder] - Download files  
- gdrive-list [folder] - List files

Files go to ai-projects/{project-name}/ by default. All commands are non-interactive and provide clear feedback.
```

## For GitHub Copilot Workspace Instructions

Add to `.github/copilot-instructions.md`:

```markdown
## Google Drive Integration

Use these commands for Google Drive operations:
- `gdrive-upload <file>` - Upload files
- `gdrive-download <file>` - Download files
- `gdrive-list` - List files

Files are organized in project-specific folders automatically.
```

## For Project-Specific Setup

Create a `.ai-instructions` file in your project root:

```markdown
This project uses gdrive-cli-tools for cloud storage:
- gdrive-upload: Save generated files
- gdrive-download: Retrieve shared files
- gdrive-list: Check available files

Current project folder: ai-projects/PROJECT_NAME
```

## Common Use Cases

### For Code Generation Projects
```markdown
When generating configuration files, documentation, or data files, 
use `gdrive-upload filename.ext` to save them to Google Drive for 
sharing and backup.
```

### For Data Analysis Projects
```markdown
Use `gdrive-download data.csv` to retrieve datasets and 
`gdrive-upload results.json` to save analysis results.
```

### For Documentation Projects
```markdown
Use `gdrive-upload README.md` to backup documentation and 
`gdrive-list docs` to see available documentation files.
```