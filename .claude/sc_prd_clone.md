# sc_prd_clone.md - Streamlined PRD to Dev Stories Generator

```yaml
---
command: "/sc:prd-clone"
category: "Documentation & Planning"
purpose: "Generate PRD and development stories from basic project description"
wave-enabled: false
performance-profile: "standard"
---
```

**Auto-Persona**: LangGraph-Expert
**MCP Integration**: Sequential (analysis), Context7 (documentation patterns)
**Tool Orchestration**: [Read, Write, Edit, MultiEdit, TodoWrite]
**Arguments**: `[project-description]`, `--output docs/prd-stories.md`, `--format compact|detailed`

## Purpose

Streamlined command that converts a basic project description into a complete PRD with development stories breakdown. Combines the PRD generation capabilities of `/langgraph` with the task breakdown features of `/sc:workflow` into a single, efficient command.

## Usage

```bash
# Basic usage
/sc:prd-clone "Build a user dashboard with analytics and real-time data"

# With output file specification
/sc:prd-clone "E-commerce checkout flow" --output docs/checkout-prd.md

# Detailed format
/sc:prd-clone "API authentication system" --format detailed
```

## Command Execution

### Auto-Activation Triggers
- **Persona**: langgraph-expert (technical planning and PRD expertise)
- **MCP Servers**: Sequential for structured analysis, Context7 for documentation patterns
- **Keywords**: PRD, requirements, planning, stories, breakdown

### Execution Steps

1. **Project Analysis**: Analyze the project description for scope, complexity, and domain
2. **PRD Generation**: Create streamlined PRD focusing on essential elements only
3. **Story Breakdown**: Convert requirements into Epic → Story → Task format
4. **Integration**: Combine PRD and stories into single actionable document
5. **Output**: Generate markdown document ready for development team

### Output Structure

**Essential Sections Only**:
- **Project Overview** (2-3 sentences: what + why)
- **Key Features** (3-5 prioritized features)
- **Success Criteria** (measurable outcomes)
- **Implementation Stories** (Epic → Story → Task breakdown)
- **Basic Estimates** (time/complexity indicators)

## Integrated Prompt

When this command is executed, use the following integrated approach:

### Phase 1: PRD Generation (LangGraph-Expert Persona)
```
You are a LangGraph domain expert specializing in creating precise, actionable PRDs. 

Given the project description: "{project-description}"

Create a streamlined PRD with ONLY these essential sections:

## Project Overview
- What: [2-3 sentence description of what the project does]
- Why: [1-2 sentence business justification]

## Key Features (Prioritized)
- [ ] Feature 1: [Brief description with priority: High/Medium/Low]
- [ ] Feature 2: [Brief description with priority: High/Medium/Low] 
- [ ] Feature 3: [Brief description with priority: High/Medium/Low]
[Maximum 5 features]

## Success Criteria
- [Measurable outcome 1]
- [Measurable outcome 2]
- [Measurable outcome 3]

Focus on technical accuracy and implementation clarity. Keep each section concise but complete.
```

### Phase 2: Story Breakdown (Workflow Integration)
```
Now convert the above PRD into development stories using this format:

## Implementation Stories

### Epic: [Main project goal]

#### Story: [Feature 1 from PRD]
- [ ] Task: [Specific implementation task]
- [ ] Task: [Another specific task]
- [ ] Task: [Testing/validation task]
**Estimate**: [Hours/Days] | **Complexity**: [Low/Medium/High]

#### Story: [Feature 2 from PRD]  
- [ ] Task: [Specific implementation task]
- [ ] Task: [Another specific task]
- [ ] Task: [Testing/validation task]
**Estimate**: [Hours/Days] | **Complexity**: [Low/Medium/High]

[Continue for all high-priority features]

### Epic: [Secondary features]
[Repeat story format for medium-priority features]

Use Epic → Story → Task hierarchy. Each task should be specific and actionable.
Provide basic estimates and complexity ratings.
```

### Phase 3: Integration
```
Combine both sections into a single document with this structure:

# [Project Name] - PRD & Development Stories

[Include Project Overview section]
[Include Key Features section]  
[Include Success Criteria section]
[Include Implementation Stories section]

Add a final section:
## Next Steps
- [ ] Review and validate requirements with stakeholders
- [ ] Set up development environment and project structure
- [ ] Begin with highest priority Epic/Story
- [ ] Establish testing and validation workflow

The output should be immediately actionable for a development team.
```

## Integration with SuperClaude Framework

**Command Registration**: Integrates with existing command system through ORCHESTRATOR.md routing
**Persona Integration**: Leverages langgraph-expert persona for technical precision
**MCP Coordination**: Uses Sequential for structured thinking, Context7 for documentation patterns
**Quality Gates**: Follows 8-step validation cycle for output quality
**Flag Integration**: Supports standard SuperClaude flags (--uc, --validate, --safe-mode)

## Examples

### Input
```bash
/sc:prd-clone "Real-time collaborative whiteboard app with user authentication"
```

### Output Preview
```markdown
# Real-time Collaborative Whiteboard - PRD & Development Stories

## Project Overview
- What: Web-based collaborative whiteboard allowing multiple users to draw, annotate, and share ideas in real-time
- Why: Enable remote teams to brainstorm and collaborate visually with immediate synchronization

## Key Features (Prioritized)
- [ ] User Authentication & Sessions: High
- [ ] Real-time Drawing Canvas: High  
- [ ] Multi-user Collaboration: High
- [ ] Persistent Storage: Medium
- [ ] Export/Sharing: Low

## Success Criteria
- Support 10+ concurrent users per whiteboard
- <100ms latency for drawing operations
- 99.9% uptime for authentication system

## Implementation Stories

### Epic: Core Whiteboard Functionality

#### Story: User Authentication & Sessions
- [ ] Task: Implement user registration/login system
- [ ] Task: Create session management with JWT tokens
- [ ] Task: Add password reset functionality
**Estimate**: 2-3 days | **Complexity**: Medium

#### Story: Real-time Drawing Canvas
- [ ] Task: Set up HTML5 Canvas with drawing tools
- [ ] Task: Implement WebSocket connection for real-time sync
- [ ] Task: Add drawing tools (pen, shapes, text)
**Estimate**: 3-4 days | **Complexity**: High

...
```

## Performance & Efficiency

**Token Usage**: ~8K-12K tokens (optimized for essential elements only)
**Execution Time**: 30-60 seconds for typical project descriptions
**Output Quality**: Ready-to-use PRD + stories without additional processing
**Context Preservation**: Maintains consistency between PRD and story breakdown

---

**Framework Compliance**: Follows SuperClaude PRINCIPLES.md, integrates with ORCHESTRATOR.md routing, and supports standard FLAGS.md options.