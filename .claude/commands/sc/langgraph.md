---
command: "/sc:langgraph"
category: "Development & Orchestration"
purpose: "Multi-agent workflow orchestration with LangGraph"
wave-enabled: true
performance-profile: "complex"
personas: [langgraph-expert, architect, analyzer]
mcp-servers: [sequential, context7]
allowed-tools: [Read, Write, Edit, MultiEdit, Bash, Glob, Grep, TodoWrite, Task]
---

# /sc:langgraph - Multi-Agent Development Workflow

## Purpose
Create and manage autonomous multi-agent development workflows using LangGraph for complete feature development lifecycle from description to merged PR.

## Usage
```
/sc:langgraph [feature-description] [--mode development|review|status] [--workflow-type standard|experimental]
```

## Arguments
- `feature-description` - Natural language description of the feature to implement
- `--mode` - Workflow execution mode:
  - `development` (default): Full development workflow from issue to PR
  - `review`: Review and analyze existing workflow state
  - `status`: Check status of running workflows
- `--workflow-type` - Workflow variant:
  - `standard` (default): Standard development workflow
  - `experimental`: Enable experimental workflow features
- `--persist` - Enable cross-session workflow persistence
- `--human-gates` - Configure human approval gates (default: issue approval, PR review)
- `--auto-fix` - Enable automatic test fixing during development
- `--qa-depth` - QA analysis depth (basic|comprehensive)

## Workflow Architecture

### Core Flow
```
Feature Request → Issue Creation → Human Approval → Development → PR Creation → QA Review → Human Review → Merge
```

### Agent Nodes
1. **Orchestrator Node**: Central coordination and state management
2. **Issue Creator Node**: GitHub issue creation with analysis
3. **Development Node**: Code implementation with testing
4. **QA Node**: Quality assurance and test coverage analysis
5. **Integration Node**: PR creation and CI/CD coordination

### Human Gates
- **Issue Approval**: Comment `@langgraph approve` on created issue
- **PR Review**: Standard GitHub review process with QA recommendations
- **Emergency Stop**: Comment `@langgraph halt` to pause workflow

## Execution Modes

### Development Mode (Default)
Complete autonomous development workflow:
1. **Analysis Phase**: Feature analysis and requirement extraction
2. **Issue Creation**: GitHub issue with detailed specifications
3. **Wait for Approval**: Human gate requiring `@langgraph approve` comment
4. **Development Phase**: Autonomous implementation with testing
5. **PR Creation**: Pull request with QA analysis and recommendations
6. **Quality Gate**: Final human review and merge

### Review Mode
Analyze and review workflow execution:
- Current workflow status and progress
- Agent decision history and rationale
- Quality metrics and test coverage analysis
- Performance recommendations and optimizations

### Status Mode
Monitor active workflows:
- List all active workflows with status
- Show bottlenecks and waiting states
- Display estimated completion times
- Provide intervention recommendations

## Integration Features

### GitHub Integration
- **Branch Management**: Auto-create `feature/lg-{issue-number}-{kebab-case-title}`
- **Issue Templates**: Structured issue creation with acceptance criteria
- **PR Templates**: Automated PR with QA checklist and test coverage
- **Labels**: Auto-apply `langgraph-workflow` tag
- **Comments**: Bot interactions for workflow progression

### SuperClaude Integration
- **Persona Orchestration**: Dynamic persona activation based on task type
- **MCP Coordination**: Sequential for orchestration, Context7 for patterns
- **Task Persistence**: Integration with `/sc:task` for cross-session state
- **Command Chaining**: Seamless integration with other SuperClaude commands

### CI/CD Integration
- **Test Automation**: Integration with GitHub Actions and test suites
- **Quality Gates**: Automated quality checks and coverage analysis
- **Deployment**: Optional deployment pipeline integration
- **Monitoring**: Workflow execution monitoring and alerting

## State Management

### Workflow State
Persistent state stored in `.claude/tasks/langgraph-{workflow-id}.md`:
```yaml
workflow_id: lg-2024-001
status: development
current_node: development
feature_description: "User authentication system"
github_issue: 123
branch_name: "feature/lg-123-user-authentication-system"
agents:
  orchestrator: active
  development: in_progress
  qa: pending
human_gates:
  issue_approval: completed
  pr_review: pending
```

### Agent Communication
- **Shared Context**: LangGraph state dictionary for inter-agent communication
- **Event System**: Async event propagation between agents
- **State Snapshots**: Regular state persistence for recovery
- **Audit Trail**: Complete log of agent actions and decisions

### Error Recovery
- **Automatic Retry**: Configurable retry logic for transient failures
- **State Rollback**: Ability to rollback to previous stable state
- **Human Escalation**: Automatic escalation on critical failures
- **Graceful Degradation**: Continue workflow with reduced functionality

## Quality Assurance

### QA Agent Capabilities
- **Test Coverage Analysis**: Identify missing test coverage areas
- **Code Quality Review**: Static analysis and quality metrics
- **Performance Assessment**: Identify potential performance issues
- **Security Review**: Basic security vulnerability assessment
- **Integration Testing**: Playwright-based E2E test recommendations

### Quality Gates
- **Code Standards**: Enforce coding standards and conventions
- **Test Requirements**: Minimum test coverage thresholds
- **Performance Budgets**: Response time and resource usage limits
- **Security Checks**: Basic security vulnerability scanning
- **Documentation**: Ensure adequate documentation coverage

## Usage Examples

### Start Development Workflow
```bash
/sc:langgraph "Implement user dashboard with analytics widgets" --mode development --auto-fix
```

### Review Workflow Status
```bash
/sc:langgraph --mode status --workflow-id lg-2024-001
```

### Advanced Configuration
```bash
/sc:langgraph "Add OAuth integration" --workflow-type experimental --qa-depth comprehensive --persist
```

## Performance Targets
- **Workflow Creation**: <5 seconds from description to GitHub issue
- **Agent Response**: <2 seconds for inter-agent communication
- **State Persistence**: <1 second for state updates
- **Recovery Time**: <30 seconds from failure to resumed operation
- **End-to-End**: <2 hours for typical feature (varies by complexity)

## Success Metrics
- **Completion Rate**: >95% successful workflow completion
- **Quality Score**: >90% QA approval rate
- **Time to PR**: <4 hours average for standard features
- **Human Intervention**: <10% workflows requiring manual intervention
- **Test Coverage**: >80% code coverage on generated code

## Claude Code Integration
- **Wave System**: Multi-stage execution with progressive enhancement
- **Hook Integration**: Real-time workflow monitoring and optimization
- **Tool Coordination**: Intelligent batching and parallel execution
- **Context Retention**: Maintain context across workflow stages
- **Evidence Collection**: Comprehensive audit trail and metrics