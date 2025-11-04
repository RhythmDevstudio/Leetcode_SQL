#!/bin/bash

# Leetcode SQL Repository Setup Script
# This script helps initialize your local environment for testing SQL solutions

echo "🚀 Leetcode SQL Repository Setup"
echo "================================="

# Check if we're in the correct directory
if [ ! -f "README.md" ] || [ ! -d "Easy" ]; then
    echo "❌ Error: Please run this script from the repository root directory"
    exit 1
fi

echo "✅ Repository structure verified"

# Create a local testing directory
if [ ! -d "local-testing" ]; then
    mkdir local-testing
    echo "📁 Created local-testing directory for your experiments"
fi

# Check for common SQL tools
echo ""
echo "🔍 Checking for SQL tools..."

# Check for MySQL
if command -v mysql &> /dev/null; then
    echo "✅ MySQL found: $(mysql --version | head -1)"
else
    echo "❌ MySQL not found. Install MySQL for full compatibility"
fi

# Check for SQLite
if command -v sqlite3 &> /dev/null; then
    echo "✅ SQLite found: $(sqlite3 --version)"
else
    echo "❌ SQLite not found. Install SQLite for local testing"
fi

# Check for PostgreSQL
if command -v psql &> /dev/null; then
    echo "✅ PostgreSQL found: $(psql --version)"
else
    echo "❌ PostgreSQL not found. Install PostgreSQL for advanced features"
fi

echo ""
echo "📖 Quick Start Guide:"
echo "1. Browse problems in Easy/, Medium/, or Hard/ folders"
echo "2. Use Templates/solution_template.sql for new solutions"  
echo "3. Test queries using Schemas/common_schemas.sql"
echo "4. Check CONTRIBUTING.md for submission guidelines"
echo ""
echo "💡 Pro tip: Start with Easy problems if you're new to SQL!"
echo ""
echo "🎯 Happy coding! Visit https://leetcode.com/problemset/database/ for problems"