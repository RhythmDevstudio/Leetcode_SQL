# Contributing to Leetcode SQL Solutions 🤝

Thank you for your interest in contributing to this repository! This guide will help you get started.

## How to Contribute

### 1. Adding New Solutions

1. **Check for Duplicates**: Ensure the problem hasn't been solved already
2. **Choose Correct Folder**: Place solutions in appropriate difficulty folder (Easy/Medium/Hard)
3. **Follow Naming Convention**: Use `{ProblemNumber}_{ProblemName}/` format
4. **Use the Template**: Copy and fill out the solution template from `Templates/solution_template.sql`

### 2. Improving Existing Solutions

- Alternative solutions are welcome
- Performance optimizations
- Better explanations and comments
- Bug fixes

### 3. Repository Improvements

- Documentation updates
- Schema additions
- Template improvements
- Organizational enhancements

## Submission Guidelines

### File Structure
```
Difficulty/
└── ProblemNumber_ProblemName/
    └── ProblemNumber_ProblemName.sql
```

### Solution Requirements

**Must Include:**
- Complete problem statement (as comment)
- Table schema definition
- Example input/output
- Working SQL solution
- Detailed explanation
- Time/space complexity (when applicable)

**Good to Have:**
- Alternative approaches
- Edge case considerations
- Performance notes
- Related problems references

### Code Style

- Use clear, readable SQL formatting
- Include meaningful comments
- Follow standard SQL conventions
- Use consistent indentation (2 or 4 spaces)
- UPPERCASE for SQL keywords (SELECT, FROM, WHERE, etc.)

### Example Format
```sql
/*
Problem: 175 - Combine Two Tables
Difficulty: Easy
Source: https://leetcode.com/problems/combine-two-tables/
Date Solved: YYYY-MM-DD

Problem Statement:
[Full problem description]

Table Schema:
[Schema definitions]
*/

-- Solution approach explanation
SELECT 
    column1,
    column2
FROM 
    table1 t1
    LEFT JOIN table2 t2 ON t1.id = t2.id;

/*
Explanation:
[Detailed explanation of approach and logic]
*/
```

## Testing Your Solutions

1. **Verify Syntax**: Ensure SQL syntax is correct
2. **Test with Sample Data**: Use provided examples to verify output
3. **Consider Edge Cases**: Test with empty tables, NULL values, etc.
4. **Performance Check**: For complex queries, consider execution efficiency

## Pull Request Process

1. **Fork the Repository**
2. **Create Feature Branch**: `git checkout -b solution/problem-number-name`
3. **Follow File Structure**: Use correct naming and placement
4. **Add Complete Solution**: Include all required components
5. **Test Thoroughly**: Verify your solution works
6. **Submit PR**: Include clear description of changes
7. **Respond to Feedback**: Address any review comments promptly

## Quality Standards

### SQL Code Quality
- ✅ Correct and efficient solution
- ✅ Proper formatting and indentation
- ✅ Clear variable and alias names
- ✅ Appropriate comments and documentation

### Documentation Quality
- ✅ Complete problem statement
- ✅ Clear explanation of approach
- ✅ Example input/output included
- ✅ Complexity analysis (when applicable)

## Getting Help

- **Issues**: Open an issue for questions or problems
- **Discussions**: Use discussions for general questions
- **Review**: All contributions are reviewed before merging

## Recognition

Contributors will be recognized in the repository and their contributions are greatly appreciated!

## Code of Conduct

- Be respectful and constructive
- Help others learn and improve
- Focus on problem-solving and learning
- Maintain high quality standards

---

Happy coding and thank you for contributing! 🚀