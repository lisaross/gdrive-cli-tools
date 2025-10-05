#!/bin/bash
# Installation script for gdrive-cli-tools
# Usage: ./install.sh

set -e

echo "🚀 Installing Google Drive CLI Tools for AI Agents..."
echo ""

# Check if rclone is installed
if ! command -v rclone &> /dev/null; then
    echo "❌ Error: rclone is not installed"
    echo ""
    echo "Please install rclone first:"
    echo "  macOS: brew install rclone"
    echo "  Linux: curl https://rclone.org/install.sh | sudo bash"
    echo "  Or visit: https://rclone.org/downloads/"
    exit 1
fi

echo "✅ rclone found: $(rclone --version | head -1)"

# Create ~/bin directory if it doesn't exist
mkdir -p ~/bin

# Copy scripts to ~/bin
echo "📦 Installing scripts to ~/bin..."
cp bin/gdrive-* ~/bin/
chmod +x ~/bin/gdrive-*

echo "✅ Scripts installed:"
ls -la ~/bin/gdrive-*

# Check if ~/bin is in PATH
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo ""
    echo "⚠️  ~/bin is not in your PATH"
    echo "Adding to shell profile..."
    
    # Detect shell and add to appropriate profile
    if [[ $SHELL == *"zsh"* ]]; then
        echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
        echo "✅ Added to ~/.zshrc"
        echo "Run: source ~/.zshrc"
    elif [[ $SHELL == *"bash"* ]]; then
        echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bash_profile
        echo "✅ Added to ~/.bash_profile"  
        echo "Run: source ~/.bash_profile"
    else
        echo "Add this to your shell profile:"
        echo '  export PATH="$HOME/bin:$PATH"'
    fi
else
    echo "✅ ~/bin is already in PATH"
fi

echo ""
echo "🔧 Next Steps:"
echo "1. Configure rclone with Google Drive:"
echo "   rclone config"
echo ""
echo "2. Test the installation:"
echo "   gdrive-list"
echo ""
echo "3. For AI agents, add this to your assistant instructions:"
echo "   'User has gdrive-cli-tools: gdrive-upload, gdrive-download, gdrive-list'"
echo ""
echo "✅ Installation complete!"