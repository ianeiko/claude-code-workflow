# LangGraph Multi-Agent Workflow Examples

Comprehensive examples demonstrating the LangGraph multi-agent development workflow for building autonomous AI agent systems.

## Quick Start Example

### Basic Agent Implementation

**Scenario:** Create a code review agent that analyzes pull requests and provides feedback

```bash
# 1. Start the workflow
/sc:langgraph "Create a code review agent that analyzes pull requests, identifies potential issues, and provides constructive feedback"

# The workflow will:
# - Analyze complexity (moderate)
# - Create GitHub issue with detailed requirements
# - Wait for human approval
# - Implement the agent autonomously
# - Run tests and validate agent behavior
# - Create PR with QA analysis
# - Wait for human review
```

**Expected Complexity:** Moderate
**Required Personas:** langgraph-expert, architect, analyzer, qa

## Detailed Workflow Examples

### Example 1: Simple Agent Node

**Feature Request:** "Add a validation agent node that checks code quality and returns a score"

#### Phase 1: Orchestrator Analysis
```
Complexity Assessment: Simple
Required Personas: langgraph-expert, analyzer
Key Components: Single node agent, quality scoring logic, state management
```

#### Phase 2: GitHub Issue Creation
```markdown
# Feature: Code Quality Validation Agent Node

## 🎯 Feature Description
Create a LangGraph agent node that analyzes code quality and returns a numerical score with recommendations.

## 📋 Acceptance Criteria
- [ ] Agent node accepts code input and returns quality score (0-100)
- [ ] Node provides specific improvement recommendations
- [ ] Agent integrates with existing LangGraph workflow
- [ ] Node handles errors gracefully and logs issues
- [ ] Agent state is properly managed between invocations
- [ ] Node includes comprehensive unit tests

## 🔧 Technical Requirements
**Architecture:**
- LangGraph StateGraph node implementation
- Stateful agent with persistent memory
- Tool integration for code analysis

**Node Interface:**
```python
class CodeQualityAgent:
    def __init__(self, state: AgentState):
        self.state = state
        self.tools = [code_analyzer, quality_scorer]
    
    def invoke(self, input_data: dict) -> dict:
        # Agent implementation
        pass
```

## 🧪 Testing Requirements
- [ ] Unit tests for agent logic and scoring
- [ ] Integration tests with LangGraph workflow
- [ ] Edge case testing for malformed code
- [ ] State persistence validation
```

#### Phase 3: Development Implementation
```
Branch: feature/lg-123-code-quality-validation-agent

Files Created:
- src/agents/code_quality_agent.py
- src/agents/tests/test_code_quality_agent.py
- src/tools/code_analyzer.py
- src/graphs/quality_workflow.py

Implementation Details:
- LangGraph StateGraph integration
- Agent state management with TypedDict
- Tool calling for code analysis
- Error handling and recovery
```

#### Phase 4: QA Analysis Results
```
Overall QA Score: 92/100

Quality Breakdown:
- Agent Logic: 24/25 (Excellent state management)
- Test Coverage: 22/25 (88% coverage, missing error cases)
- Performance: 25/25 (Efficient processing, proper caching)
- Integration: 21/25 (Minor: improve error propagation)

Recommendations:
1. Add error handling for timeout scenarios
2. Test agent with very large code inputs
3. Improve state serialization for persistence
```

### Example 2: Complex Multi-Agent System

**Feature Request:** "Implement a multi-agent system for automated code refactoring with review and approval workflow"

#### Phase 1: Orchestrator Analysis
```
Complexity Assessment: Complex
Required Personas: langgraph-expert, architect, analyzer, security
Key Components: Multiple specialized agents, workflow orchestration, human-in-the-loop
Agent Architecture: Analyzer → Refactorer → Reviewer → Approver
```

#### Phase 2: GitHub Issue Creation
```markdown
# Feature: Multi-Agent Code Refactoring System

## 🎯 Feature Description
Implement a comprehensive multi-agent system that automatically analyzes code, proposes refactoring improvements, reviews changes, and manages approval workflow.

## 📋 Acceptance Criteria
- [ ] Analysis agent identifies refactoring opportunities
- [ ] Refactoring agent implements code improvements
- [ ] Review agent validates proposed changes
- [ ] Approval agent manages human-in-the-loop workflow
- [ ] System maintains full audit trail of decisions
- [ ] Agents communicate through shared state
- [ ] Workflow supports rollback and recovery
- [ ] System integrates with existing CI/CD pipeline

## 🔧 Technical Requirements
**Architecture:**
- StateGraph with 4 specialized agent nodes
- Shared state management using TypedDict
- Conditional workflow routing based on confidence scores
- Human approval gates for significant changes

**Agent Specifications:**
1. **AnalyzerAgent**: Code analysis and opportunity identification
2. **RefactoringAgent**: Code modification and improvement implementation
3. **ReviewAgent**: Change validation and quality assessment
4. **ApprovalAgent**: Human workflow management and decision tracking

**State Schema:**
```python
class RefactoringState(TypedDict):
    code_input: str
    analysis_results: List[RefactoringOpportunity]
    proposed_changes: List[CodeChange]
    review_feedback: ReviewResult
    approval_status: ApprovalDecision
    workflow_history: List[WorkflowStep]
```

## 🔒 Security Requirements
- [ ] Code analysis runs in sandboxed environment
- [ ] No code execution during analysis phase
- [ ] Secure state serialization and storage
- [ ] Audit logging for all agent decisions
- [ ] Access control for approval workflows

## 🧪 Testing Requirements
- [ ] Unit tests for each agent implementation
- [ ] Integration tests for multi-agent workflows
- [ ] End-to-end tests for complete refactoring cycles
- [ ] Performance tests for large codebases
- [ ] Security tests for malicious code inputs
```

#### Phase 3: Multi-Agent Implementation

**LangGraph-Expert Implementation:**
```python
from langgraph.graph import StateGraph, END
from typing import TypedDict, List

class RefactoringState(TypedDict):
    code_input: str
    analysis_results: List[dict]
    proposed_changes: List[dict]
    review_feedback: dict
    approval_status: str
    confidence_score: float

def create_refactoring_workflow():
    workflow = StateGraph(RefactoringState)
    
    # Add agent nodes
    workflow.add_node("analyzer", AnalyzerAgent())
    workflow.add_node("refactorer", RefactoringAgent())
    workflow.add_node("reviewer", ReviewAgent())
    workflow.add_node("approver", ApprovalAgent())
    
    # Define workflow edges
    workflow.add_edge("analyzer", "refactorer")
    workflow.add_conditional_edges(
        "refactorer",
        lambda state: "reviewer" if state["confidence_score"] > 0.8 else "approver",
        {"reviewer": "reviewer", "approver": "approver"}
    )
    workflow.add_conditional_edges(
        "reviewer",
        lambda state: END if state["review_feedback"]["approved"] else "refactorer"
    )
    
    workflow.set_entry_point("analyzer")
    return workflow.compile()
```

**Agent Implementations:**
```python
class AnalyzerAgent:
    def __init__(self):
        self.tools = [code_complexity_analyzer, pattern_detector, smell_detector]
    
    def __call__(self, state: RefactoringState) -> RefactoringState:
        analysis_results = []
        for tool in self.tools:
            result = tool.analyze(state["code_input"])
            analysis_results.extend(result.opportunities)
        
        return {**state, "analysis_results": analysis_results}

class RefactoringAgent:
    def __init__(self):
        self.tools = [code_transformer, pattern_applier, optimizer]
    
    def __call__(self, state: RefactoringState) -> RefactoringState:
        proposed_changes = []
        confidence_scores = []
        
        for opportunity in state["analysis_results"]:
            change = self.apply_refactoring(opportunity, state["code_input"])
            proposed_changes.append(change)
            confidence_scores.append(change.confidence)
        
        avg_confidence = sum(confidence_scores) / len(confidence_scores)
        
        return {
            **state, 
            "proposed_changes": proposed_changes,
            "confidence_score": avg_confidence
        }
```

#### Phase 4: QA Analysis Results
```
Overall QA Score: 89/100

Quality Breakdown:
- Agent Architecture: 23/25 (Well-designed state management)
- Workflow Logic: 22/25 (Good conditional routing, minor edge cases)
- Integration: 24/25 (Excellent LangGraph integration)
- Testing: 20/25 (Need more complex scenario tests)

Multi-Agent Validation:
- ✅ State properly shared between agents
- ✅ Conditional workflow routing working correctly
- ✅ Human-in-the-loop integration functional
- ✅ Error recovery and rollback mechanisms active
- ⚠️ Performance optimization needed for large codebases
- ⚠️ Add monitoring for agent decision quality

Recommendations:
- Implement caching for repeated analysis patterns
- Add metrics collection for agent performance
- Consider parallel execution for independent refactoring tasks
```

### Example 3: LangGraph Integration Patterns

**Feature Request:** "Create a documentation agent that automatically generates and maintains API documentation"

#### Key LangGraph Building Blocks

**1. State Management:**
```python
from typing import TypedDict, List, Optional

class DocumentationState(TypedDict):
    source_code: str
    api_endpoints: List[dict]
    documentation: str
    review_status: str
    update_history: List[dict]
```

**2. Agent Node Implementation:**
```python
from langgraph.graph import StateGraph

class DocumentationAgent:
    def __init__(self, name: str, tools: List):
        self.name = name
        self.tools = tools
    
    def __call__(self, state: DocumentationState) -> DocumentationState:
        # Agent processing logic
        result = self.process_with_tools(state)
        return {**state, **result}
    
    def process_with_tools(self, state):
        # Tool calling and processing
        pass
```

**3. Workflow Orchestration:**
```python
def create_documentation_workflow():
    workflow = StateGraph(DocumentationState)
    
    # Add specialized agent nodes
    workflow.add_node("code_analyzer", CodeAnalyzerAgent())
    workflow.add_node("doc_generator", DocumentationGeneratorAgent())
    workflow.add_node("quality_checker", QualityCheckerAgent())
    workflow.add_node("reviewer", ReviewerAgent())
    
    # Define processing flow
    workflow.set_entry_point("code_analyzer")
    workflow.add_edge("code_analyzer", "doc_generator")
    workflow.add_edge("doc_generator", "quality_checker")
    
    # Conditional routing based on quality score
    workflow.add_conditional_edges(
        "quality_checker",
        route_based_on_quality,
        {
            "high_quality": "reviewer",
            "needs_improvement": "doc_generator",
            "requires_human": "reviewer"
        }
    )
    
    return workflow.compile()

def route_based_on_quality(state: DocumentationState) -> str:
    quality_score = state.get("quality_score", 0)
    if quality_score >= 0.9:
        return "high_quality"
    elif quality_score >= 0.7:
        return "needs_improvement"
    else:
        return "requires_human"
```

**4. Tool Integration:**
```python
from langchain.tools import BaseTool

class APIExtractorTool(BaseTool):
    name = "api_extractor"
    description = "Extract API endpoints from source code"
    
    def _run(self, source_code: str) -> List[dict]:
        # Implementation for API extraction
        endpoints = self.parse_api_endpoints(source_code)
        return endpoints

class DocumentationGeneratorTool(BaseTool):
    name = "doc_generator"
    description = "Generate documentation from API specifications"
    
    def _run(self, api_specs: List[dict]) -> str:
        # Implementation for documentation generation
        documentation = self.create_documentation(api_specs)
        return documentation
```

## Agent System Patterns

### 1. Linear Pipeline Pattern
```python
# Sequential processing with checkpoints
workflow.add_edge("input_validator", "processor")
workflow.add_edge("processor", "output_formatter")
workflow.add_edge("output_formatter", "quality_checker")
```

### 2. Conditional Branching Pattern
```python
# Dynamic routing based on conditions
workflow.add_conditional_edges(
    "decision_node",
    lambda state: "path_a" if condition(state) else "path_b",
    {"path_a": "node_a", "path_b": "node_b"}
)
```

### 3. Loop with Exit Pattern
```python
# Iterative processing with termination
workflow.add_conditional_edges(
    "processor",
    lambda state: "processor" if needs_retry(state) else END,
    {"continue": "processor"}
)
```

### 4. Human-in-the-Loop Pattern
```python
# Strategic approval points
workflow.add_node("human_review", HumanReviewAgent())
workflow.add_conditional_edges(
    "human_review",
    lambda state: "approved" if state["human_decision"] == "approve" else "rejected",
    {"approved": "continue_workflow", "rejected": END}
)
```

## Best Practices for LangGraph Agents

### Agent Design Principles
- **Single Responsibility**: Each agent handles one specific task
- **Stateful Operations**: Use shared state for agent communication
- **Tool Integration**: Leverage existing tools through structured interfaces
- **Error Resilience**: Implement graceful error handling and recovery
- **Observable Behavior**: Include logging and monitoring for agent actions

### Workflow Orchestration
- **Clear Entry Points**: Define obvious workflow starting points
- **Conditional Logic**: Use state-based routing for dynamic workflows
- **Exit Strategies**: Always provide clear termination conditions
- **State Validation**: Ensure state consistency between agent transitions
- **Checkpoint Management**: Enable workflow pause and resume capabilities

### Performance Optimization
- **State Serialization**: Efficient state storage and retrieval
- **Tool Caching**: Cache expensive tool operations
- **Parallel Execution**: Run independent agents concurrently when possible
- **Resource Management**: Monitor and limit resource usage per agent
- **Incremental Processing**: Break large tasks into manageable chunks

## Integration with SuperClaude Framework

### Persona Integration
- **langgraph-expert**: Primary agent design and workflow orchestration
- **architect**: System design and agent interaction patterns
- **analyzer**: Agent performance analysis and optimization
- **qa**: Agent testing and validation workflows

### MCP Server Coordination
- **Sequential**: Complex multi-step agent logic and analysis
- **Context7**: LangGraph patterns and best practices
- **Tool Integration**: Seamless tool calling within agent workflows

### Quality Standards
- **Reliability**: 99.5% successful agent execution rate
- **Autonomy**: Minimal human intervention required
- **Observability**: Complete audit trail of agent decisions
- **Performance**: Efficient resource usage and response times

The LangGraph multi-agent workflow enables building sophisticated autonomous systems that can handle complex tasks while maintaining human oversight and control where needed.