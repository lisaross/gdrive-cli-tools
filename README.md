# Google Drive CLI Tools for AI Agents

Simple, agent-friendly command-line tools for Google Drive operations using rclone. Designed specifically for use with Claude, ChatGPT, and other AI coding assistants.

## Features

- 🚀 **Simple Commands**: `gdrive-upload`, `gdrive-download`, `gdrive-list`
- 🤖 **AI Agent Friendly**: Clear error messages, predictable outputs, no interactive prompts
- 📁 **Project-Aware**: Automatically organizes files by project/directory name
- ✅ **Error Handling**: Robust error handling with helpful suggestions
- 🎯 **Minimal Setup**: One-time rclone configuration, then just works

## Quick Start

### 1. Install Dependencies

```bash
# macOS (Homebrew)
brew install rclone

# Linux (most distributions)
curl https://rclone.org/install.sh | sudo bash

# Or using package managers:
# Ubuntu/Debian: sudo apt install rclone
# Arch: sudo pacman -S rclone
# Fedora: sudo dnf install rclone
```

### 2. Install Scripts

```bash
# Clone this repository
git clone https://github.com/lisaross/gdrive-cli-tools.git
cd gdrive-cli-tools

# Run the installation script
./install.sh
```

### 3. Configure Google Drive (One-time setup)

```bash
# Configure rclone with your Google account
rclone config

# Choose:
# - n (New remote)
# - Enter name: "lisaross" (or your preferred name)
# - Choose "22" (Google Drive)
# - Leave client_id blank (press Enter)
# - Leave client_secret blank (press Enter)
# - Choose "1" (Full access)
# - y (Use web browser to authenticate)
# - Follow browser login process
# - n (Not a Shared Drive)
# - y (Keep this remote)
# - q (Quit config)
```

## Usage

### For AI Agents

These commands are designed to be used by AI agents like Claude, ChatGPT, etc.

```bash
# Upload files (automatically creates project folders)
gdrive-upload myfile.txt
gdrive-upload report.pdf
gdrive-upload data.json ai-projects/my-special-project

# Download files
gdrive-download myfile.txt
gdrive-download report.pdf ai-projects/my-special-project

# List files in current project folder
gdrive-list

# List files in specific folder
gdrive-list ai-projects/my-special-project
```

### Behavior

- **Default folder structure**: `ai-projects/{current-directory-name}/`
- **Automatic folder creation**: Creates folders if they don't exist
- **Project-aware**: Uses current directory name for organization
- **Clear feedback**: Success/error messages with emojis for easy parsing

### Examples

```bash
# Working in ~/my-app directory
cd ~/my-app

# Upload a file - goes to ai-projects/my-app/
gdrive-upload config.json
# ✅ Successfully uploaded 'config.json' to Google Drive/ai-projects/my-app/

# List files in the project folder
gdrive-list
# 📂 Listing files in Google Drive folder 'ai-projects/my-app':
#       1024 config.json

# Download the file
gdrive-download config.json
# ✅ Successfully downloaded 'config.json' from Google Drive/ai-projects/my-app/
```

## AI Agent Integration

### For Claude Code / Cursor / Other AI Tools

Add these instructions to your AI assistant:

```markdown
## Google Drive Integration

The user has gdrive-cli-tools installed. You can use these commands:

- `gdrive-upload <file>` - Upload files to Google Drive
- `gdrive-download <file>` - Download files from Google Drive  
- `gdrive-list` - List files in the project folder

Files are automatically organized in `ai-projects/{project-name}/` folders.
All commands provide clear success/error feedback and handle folder creation automatically.
```

### Project-Specific Setup

For consistent folder naming across AI sessions, you can set a project name:

```bash
# In your project directory, create a .gdrive-project file
echo "my-special-project" > .gdrive-project

# The scripts will use this name instead of the directory name
gdrive-upload myfile.txt
# ✅ Uploads to ai-projects/my-special-project/
```

## Configuration

### Custom Remote Name

If you used a different name during rclone config, edit the scripts:

```bash
# Edit each script and change "lisaross" to your remote name
sed -i 's/lisaross:/your-remote-name:/g' ~/bin/gdrive-*
```

### Custom Default Folder

To change the default folder structure, edit the scripts and change:
```bash
FOLDER="${2:-ai-projects/$(basename "$PWD")}"
# to
FOLDER="${2:-your-custom-folder/$(basename "$PWD")}"
```

## Troubleshooting

### Authentication Issues

If you get authentication errors:

```bash
# Check if rclone is configured
rclone listremotes

# Test basic connection
rclone lsd lisaross:

# Reconfigure if needed
rclone config reconnect lisaross:
```

### Permission Errors

```bash
# Make sure scripts are executable
chmod +x ~/bin/gdrive-*

# Check if ~/bin is in your PATH
echo $PATH | grep "$HOME/bin"

# If not, add to your shell profile
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Script Not Found

```bash
# Check if scripts are installed
ls -la ~/bin/gdrive-*

# If missing, reinstall
./install.sh
```

## Advanced Usage

### Batch Operations

```bash
# Upload multiple files
for file in *.txt; do gdrive-upload "$file"; done

# Upload entire directories (as tar)
tar -czf backup.tar.gz ./src/
gdrive-upload backup.tar.gz backups
```

### Integration with Other Tools

```bash
# Upload command output
echo "System info: $(uname -a)" > system.txt
gdrive-upload system.txt logs

# Download and process
gdrive-download data.json
jq '.users' data.json
```

## Development

### Adding New Features

The scripts are simple bash files in `bin/`. To modify:

1. Edit the scripts in `bin/`
2. Test locally
3. Update README if needed
4. Submit PR

### Dependencies

- `rclone` (primary dependency)
- `bash` (standard on Unix systems)
- `basename`, `pwd` (standard Unix tools)

## License

MIT License - see LICENSE file for details.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with multiple scenarios
5. Submit a pull request

## Support

- Issues: [GitHub Issues](https://github.com/lisaross/gdrive-cli-tools/issues)
- Discussions: [GitHub Discussions](https://github.com/lisaross/gdrive-cli-tools/discussions)