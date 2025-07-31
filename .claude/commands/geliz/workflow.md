---
command: "/geliz:workflow"
category: "LangGraph Multi-Agent Development"
purpose: "Orchestrate complete feature development from description to merged PR"
wave-enabled: true
performance-profile: "complex"
personas: [langgraph-expert, architect, analyzer]
mcp-servers: [sequential, context7]
allowed-tools: [Read, Write, Edit, MultiEdit, Bash, Glob, Grep, TodoWrite, Task]
---

# LangGraph Multi-Agent Development Workflow

You are orchestrating a complete multi-agent development workflow. Follow this structured approach:

## Phase 1: Feature Analysis & Issue Creation

**Task:** Analyze the feature request and create a comprehensive GitHub issue.

### Step 1: Feature Analysis
```
As a langgraph-expert working with an analyzer, thoroughly analyze this feature request:

Feature Description: $ARGUMENTS

Provide:
1. **Complexity Assessment**: Simple/Moderate/Complex with reasoning
2. **Required Personas**: Which personas needed for implementation
3. **Implementation Approach**: Architecture and development strategy  
4. **Acceptance Criteria**: Clear, testable requirements
5. **Risk Assessment**: Potential challenges and mitigation strategies
6. **Timeline Estimate**: Hours/days with key milestones
7. **Dependencies**: External systems, libraries, or prerequisites
8. **Quality Gates**: Testing and validation requirements

Focus on creating a complete technical specification that enables autonomous development.
```

### Step 2: GitHub Issue Creation
```
As a scribe working with the analyzer, create a professional GitHub issue:

Feature: $ARGUMENTS
Analysis: [Use output from Step 1]

Create a GitHub issue with:
- **Title**: Clear, descriptive title following pattern "Feature: [brief description]"
- **Problem Statement**: Why this feature is needed
- **Acceptance Criteria**: Bulleted list of testable requirements
- **Technical Approach**: High-level implementation strategy
- **Dependencies**: Required systems, APIs, or libraries
- **Definition of Done**: Clear completion criteria
- **Testing Requirements**: Expected test coverage and types

Format with proper GitHub markdown. Add labels: "langgraph-workflow", "enhancement"

Include workflow instructions:
- Comment `@langgraph approve` to start development
- Branch naming: `feature/lg-{issue-number}-{kebab-case-title}`
```

### Step 3: Issue Creation & Approval Gate
1. Create the GitHub issue using `gh issue create`
2. Wait for human approval (comment `@langgraph approve`)
3. Update workflow state in `.claude/tasks/lg-workflow-{date}.md`

## Phase 2: Development Execution

**Task:** Implement the feature with appropriate personas and testing.

### Step 4: Development Planning
```
As an architect, create detailed implementation plan:

Feature: $ARGUMENTS
GitHub Issue: #{issue-number}
Analysis: [Reference Step 1 output]

Create implementation roadmap:
1. **Architecture Design**: System components and interactions
2. **Development Phases**: Ordered implementation steps
3. **Persona Assignments**: Which persona handles each component
4. **Integration Points**: How components work together
5. **Testing Strategy**: Unit, integration, and E2E test approach
6. **Quality Checkpoints**: Code review and validation gates

Ensure plan enables autonomous implementation with clear handoffs between personas.
```

### Step 5: Branch Creation & Implementation
1. Create feature branch: `feature/lg-{issue-number}-{kebab-case-title}`
2. Implement using appropriate personas (frontend, backend, security, etc.)
3. Run tests and auto-fix failures during development
4. Perform code quality checks

### Step 6: Implementation with Persona Coordination
```
Coordinate implementation across required personas:

**If Frontend Required:**
As a frontend specialist with Magic integration:
- Implement UI components with modern best practices
- Ensure responsive design and accessibility
- Add appropriate tests and documentation

**If Backend Required:**
As a backend specialist with Context7 integration:
- Implement APIs and business logic
- Ensure proper error handling and validation
- Add comprehensive tests and security measures

**If Security Required:**
As a security specialist:
- Implement authentication and authorization
- Add input validation and sanitization
- Perform security vulnerability assessment

**Quality Assurance (Always):**
As a QA specialist:
- Review implementation quality
- Identify test coverage gaps
- Suggest additional testing scenarios
```

## Phase 3: Quality Assurance & PR Creation

**Task:** Comprehensive QA review and pull request creation.

### Step 7: QA Analysis
```
As a QA specialist, perform comprehensive quality review:

Implementation: [Reference development output]
Test Results: [Current test status]

Analyze:
1. **Code Quality**: Maintainability, readability, best practices
2. **Test Coverage**: Unit, integration, E2E coverage analysis
3. **Performance**: Potential bottlenecks and optimization opportunities
4. **Security**: Basic security vulnerability assessment
5. **Documentation**: Code comments and user documentation
6. **Playwright Opportunities**: E2E testing scenarios for critical workflows

Provide:
- Overall quality score (0-100)
- Top 5 recommendations for improvement
- Test coverage gaps and suggestions
- Performance considerations
- Security recommendations
```

### Step 8: Pull Request Creation
```
As a scribe, create comprehensive pull request:

Feature: $ARGUMENTS
Implementation: [Reference development output]
QA Report: [Reference Step 7 output]

Create PR with:
- **Title**: Clear, descriptive title
- **Summary**: What this PR accomplishes
- **Changes Made**: Key implementation details
- **Testing**: How to test the changes
- **QA Report**: Quality score and key recommendations
- **Checklist**: Completed items and verification steps
- **Screenshots**: If UI changes are involved

Use professional GitHub PR formatting with proper markdown.
```

### Step 9: PR Creation & Review Gate
1. Create pull request using `gh pr create`
2. Add QA recommendations as PR comments
3. Wait for human review and approval
4. Handle any requested changes

## Phase 4: Completion & Documentation

**Task:** Finalize workflow and document outcomes.

### Step 10: Workflow Completion
```
As a langgraph-expert, generate completion summary:

Feature: $ARGUMENTS
GitHub Issue: #{issue-number}
GitHub PR: #{pr-number}
Implementation: [Reference all previous outputs]

Create completion report:
1. **Executive Summary**: What was accomplished
2. **Key Deliverables**: Files created/modified, tests added
3. **Quality Metrics**: Test coverage, QA score, performance
4. **Timeline**: Actual vs estimated duration
5. **Lessons Learned**: What worked well and improvement opportunities
6. **Future Recommendations**: Potential enhancements or follow-up work

Format as professional project completion report.
```

### Step 11: Issue Closure & State Management
1. Update issue with completion summary and PR link
2. Close GitHub issue
3. Update workflow state in task file
4. Archive workflow artifacts

## Human Gates & Approval Process

**Issue Approval Gate:**
- Human comments `@langgraph approve` on GitHub issue
- Workflow proceeds to development phase
- Rejection with `@langgraph reject` stops workflow

**PR Review Gate:**
- Standard GitHub PR review process
- QA agent provides recommendations as comments
- Human reviewer approves or requests changes

**Emergency Stop:**
- Comment `@langgraph halt` on issue or PR to pause workflow
- Allows manual intervention and course correction

## Error Handling & Recovery

**Development Phase Errors:**
- Auto-fix failing tests during development
- Retry failed operations with exponential backoff
- Continue workflow with reduced functionality if needed

**Post-PR Errors:**
- Escalate to human intervention
- Pause workflow for manual resolution
- Provide clear error context and recovery suggestions

## State Management

**Workflow State File:** `.claude/tasks/lg-workflow-{date}-{id}.md`

Track:
- Current phase and status
- GitHub issue and PR numbers
- Persona assignments and completions
- Quality metrics and test results
- Human approval status
- Error log and recovery actions

## Success Criteria

- ✅ Feature implemented according to acceptance criteria
- ✅ All tests passing with >80% coverage
- ✅ QA score >85/100
- ✅ PR approved and merged
- ✅ Human intervention <10% of workflow time
- ✅ Complete audit trail maintained