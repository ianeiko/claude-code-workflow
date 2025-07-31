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

# /sc:langgraph - LangGraph PRD Generation

## Purpose
Generate Product Requirements Document (PRD) for planned work using the langgraph-expert persona and LangGraph workflows.

## Usage
```
/sc:langgraph [feature-description] [--output docs/prd.md] [--format standard|detailed]
```

## Arguments
- `feature-description` - Natural language description of the planned work or feature
- `--output` - Output file path (default: docs/prd.md)
- `--format` - PRD format:
  - `standard` (default): Standard PRD structure with essential sections
  - `detailed`: Comprehensive PRD with extended analysis

## Workflow Architecture

### Core Flow
```
Feature Description → Analysis → PRD Generation → Documentation Output
```

### Processing Stages
1. **Requirements Analysis**: Extract and analyze feature requirements
2. **Technical Planning**: Define technical approach and architecture considerations
3. **PRD Generation**: Create structured Product Requirements Document
4. **Output Formatting**: Format and save to specified location

## Execution Process

### Standard Format
1. **Feature Analysis**: Analyze the provided feature description
2. **Requirements Extraction**: Identify core requirements and acceptance criteria
3. **Technical Considerations**: Outline technical approach and constraints
4. **PRD Creation**: Generate structured PRD document
5. **File Output**: Save to docs/prd.md or specified path

### Detailed Format
Enhanced PRD generation with additional sections:
- **Stakeholder Analysis**: Identify key stakeholders and their needs
- **Risk Assessment**: Potential risks and mitigation strategies
- **Implementation Timeline**: High-level timeline and milestones
- **Success Metrics**: Measurable success criteria

## LangGraph Expert Integration

### Persona Activation
- **Primary Persona**: langgraph-expert (assumed ready for usage)
- **Supporting Analysis**: Architect persona for technical considerations
- **Documentation**: Scribe persona for professional PRD formatting

### SuperClaude Integration
- **MCP Coordination**: Sequential for structured analysis, Context7 for documentation patterns
- **Tool Integration**: Read, Write, Edit for file operations and PRD creation
- **Command Chaining**: Compatible with other SuperClaude documentation commands

### Output Features
- **Structured Format**: Professional PRD template with consistent sections
- **Markdown Output**: Clean markdown formatting for documentation systems
- **File Management**: Automatic directory creation and file placement

## PRD Structure

### Standard PRD Template
Generated PRD includes the following sections:
```markdown
# Feature Name

## Overview
Brief description and objectives

## Requirements
- Functional requirements
- Non-functional requirements
- Acceptance criteria

## Technical Approach
- Architecture considerations
- Technology choices
- Implementation notes

## Success Criteria
- Measurable outcomes
- Validation methods
```

### Detailed PRD Template
Enhanced version includes additional sections:
- **Stakeholder Analysis**
- **Risk Assessment**
- **Implementation Timeline**
- **Resource Requirements**
- **Dependencies and Constraints**

## Quality Standards

### PRD Quality Criteria
- **Completeness**: All required sections included and populated
- **Clarity**: Clear, unambiguous language throughout
- **Feasibility**: Technically achievable requirements
- **Measurability**: Quantifiable success criteria
- **Consistency**: Consistent formatting and structure

### Validation Process
- **Content Review**: Verify all sections are complete and accurate
- **Technical Validation**: Ensure technical approach is sound
- **Format Check**: Confirm proper markdown formatting
- **File Placement**: Verify correct output location

## Usage Examples

### Standard PRD Generation
```bash
/sc:langgraph "Implement user dashboard with analytics widgets"
```

### Custom Output Location
```bash
/sc:langgraph "Add OAuth integration" --output requirements/oauth-prd.md
```

### Detailed PRD Format
```bash
/sc:langgraph "Real-time chat system" --format detailed --output docs/chat-prd.md
```

## Performance Targets
- **Analysis Time**: <30 seconds for feature analysis
- **PRD Generation**: <60 seconds for standard format
- **File Output**: <5 seconds for document creation and save
- **Total Process**: <2 minutes from input to completed PRD

## Success Metrics
- **PRD Completeness**: >95% of required sections populated
- **Technical Accuracy**: >90% of technical approaches validated as feasible
- **Format Consistency**: 100% proper markdown formatting
- **Output Success**: >98% successful file creation and placement

## Claude Code Integration
- **Persona System**: Automatic activation of langgraph-expert persona
- **MCP Coordination**: Sequential for analysis, Context7 for documentation patterns
- **Tool Integration**: Seamless file operations and document generation
- **Command Compatibility**: Works with other SuperClaude documentation commands