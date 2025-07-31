# LangGraph Multi-Agent Workflow Examples

Comprehensive examples demonstrating the LangGraph multi-agent development workflow for different types of features and complexity levels.

## Quick Start Example

### Basic Feature Implementation

**Scenario:** Add a user dashboard with basic analytics

```bash
# 1. Start the workflow
/sc:langgraph "Create a user dashboard that displays basic analytics including page views, user count, and recent activity"

# The workflow will:
# - Analyze complexity (moderate)
# - Create GitHub issue with detailed requirements
# - Wait for human approval
# - Implement the feature autonomously
# - Run tests and fix failures
# - Create PR with QA analysis
# - Wait for human review
```

**Expected Timeline:** 2-4 hours
**Expected Complexity:** Moderate
**Required Personas:** architect, frontend, backend, qa

## Detailed Workflow Examples

### Example 1: Simple UI Component

**Feature Request:** "Add a loading spinner component that can be reused across the application"

#### Phase 1: Orchestrator Analysis
```
Complexity Assessment: Simple
Required Personas: frontend, qa
Estimated Duration: 1-2 hours
Key Components: Reusable React component, CSS animations, prop interface
```

#### Phase 2: GitHub Issue Creation
```markdown
# Feature: Reusable Loading Spinner Component

## 🎯 Feature Description
Create a reusable loading spinner component that can be used across the application to indicate loading states.

## 📋 Acceptance Criteria
- [ ] Component accepts size prop (small, medium, large)
- [ ] Component accepts color prop with theme integration
- [ ] Component is accessible with proper ARIA labels
- [ ] Component has smooth CSS animations
- [ ] Component integrates with existing design system
- [ ] Component includes TypeScript definitions

## 🔧 Technical Requirements
**Architecture:**
- React functional component with TypeScript
- CSS-in-JS styling with theme integration
- Prop interface for customization

**Props Interface:**
```typescript
interface LoadingSpinnerProps {
  size?: 'small' | 'medium' | 'large';
  color?: string;
  className?: string;
  'aria-label'?: string;
}
```

## 🧪 Testing Requirements
- [ ] Unit tests for all prop combinations
- [ ] Accessibility testing with screen readers
- [ ] Visual regression tests
- [ ] Storybook stories for documentation
```

#### Phase 3: Development Implementation
```
Branch: feature/lg-123-reusable-loading-spinner-component

Files Created:
- src/components/LoadingSpinner/LoadingSpinner.tsx
- src/components/LoadingSpinner/LoadingSpinner.test.tsx
- src/components/LoadingSpinner/LoadingSpinner.stories.tsx
- src/components/LoadingSpinner/index.ts

Implementation Details:
- Uses CSS-in-JS with styled-components
- Integrates with design system theme
- Includes proper TypeScript definitions
- Follows existing component patterns
```

#### Phase 4: QA Analysis Results
```
Overall QA Score: 94/100

Quality Breakdown:
- Code Quality: 24/25 (Excellent component structure)
- Test Coverage: 23/25 (92% coverage, missing edge case)
- Performance: 25/25 (Lightweight, optimized animations)
- Security: 22/25 (Minor: add prop validation)

Recommendations:
1. Add PropTypes for runtime validation
2. Test spinner with very long loading times
3. Consider adding animation pause for accessibility
```

#### Phase 5: Pull Request
```markdown
# Feature: Reusable Loading Spinner Component

## Summary
Implements a flexible, accessible loading spinner component that integrates with the design system and can be used throughout the application.

## Changes Made
**Components:**
- LoadingSpinner component with size and color props
- TypeScript definitions and prop interfaces
- Integration with design system theme

**Tests:**
- Unit tests with 92% coverage
- Accessibility testing
- Storybook stories for documentation

## Testing
1. Run `npm run storybook` to see component variants
2. Test accessibility with screen reader
3. Verify animations in different browsers

## QA Score: 94/100
- Excellent code quality and performance
- Strong test coverage with minor gaps
- Accessible and follows design system patterns

Ready for review! 🚀
```

### Example 2: Complex Backend Feature

**Feature Request:** "Implement user authentication system with JWT tokens, role-based access control, and password reset functionality"

#### Phase 1: Orchestrator Analysis
```
Complexity Assessment: Complex
Required Personas: architect, backend, security, qa
Estimated Duration: 6-8 hours
Key Components: Authentication API, JWT handling, RBAC, email integration
Security Considerations: High priority due to authentication nature
```

#### Phase 2: GitHub Issue Creation
```markdown
# Feature: User Authentication System

## 🎯 Feature Description
Implement a comprehensive user authentication system with JWT tokens, role-based access control, and password reset functionality.

## 📋 Acceptance Criteria
- [ ] User registration with email verification
- [ ] User login with JWT token generation
- [ ] Role-based access control (admin, user, moderator)
- [ ] Password reset via email with secure tokens
- [ ] JWT token refresh mechanism
- [ ] Rate limiting on authentication endpoints
- [ ] Secure password hashing with bcrypt
- [ ] Session management and logout

## 🔧 Technical Requirements
**Architecture:**
- RESTful API endpoints for auth operations
- JWT token generation and validation middleware
- Role-based permission system
- Email service integration for verification/reset

**API Endpoints:**
- POST /api/auth/register
- POST /api/auth/login
- POST /api/auth/logout
- POST /api/auth/refresh
- POST /api/auth/forgot-password
- POST /api/auth/reset-password
- GET /api/auth/verify-email/:token

**Database Models:**
- User (id, email, password_hash, role, verified, created_at)
- PasswordReset (token, user_id, expires_at)
- RefreshToken (token, user_id, expires_at)

## 🔒 Security Requirements
- [ ] Password hashing with bcrypt (minimum 12 rounds)
- [ ] JWT tokens with 15-minute expiry
- [ ] Refresh tokens with 7-day expiry
- [ ] Rate limiting: 5 attempts per minute per IP
- [ ] Input validation and sanitization
- [ ] SQL injection prevention
- [ ] OWASP security headers

## 🧪 Testing Requirements
- [ ] Unit tests for authentication logic
- [ ] Integration tests for API endpoints
- [ ] Security tests for common vulnerabilities
- [ ] Load tests for authentication performance
```

#### Phase 3: Multi-Persona Development

**Architect Implementation:**
```
Architecture Plan:
1. Database schema design and migrations
2. Middleware structure for JWT validation
3. Service layer separation (AuthService, EmailService)
4. Error handling and validation strategy
5. Security implementation roadmap
```

**Backend Implementation:**
```
Files Created:
- src/models/User.js
- src/models/PasswordReset.js
- src/services/AuthService.js
- src/services/EmailService.js
- src/middleware/auth.js
- src/middleware/rateLimiting.js
- src/routes/auth.js
- src/utils/tokenUtils.js

Key Features:
- Comprehensive authentication endpoints
- JWT token generation and validation
- Password hashing with bcrypt
- Email integration for verification
```

**Security Implementation:**
```
Security Measures:
- Input validation with Joi schemas
- Rate limiting with express-rate-limit
- Helmet.js for security headers
- JWT secret rotation capability
- Password complexity requirements
- Secure token generation for resets
```

#### Phase 4: QA Analysis Results
```
Overall QA Score: 91/100

Quality Breakdown:
- Code Quality: 23/25 (Well-structured, follows patterns)
- Test Coverage: 22/25 (88% coverage, need more edge cases)
- Performance: 23/25 (Good performance, consider caching)
- Security: 23/25 (Strong security, minor header improvements)

Security Assessment:
- ✅ Proper password hashing implemented
- ✅ JWT tokens configured securely
- ✅ Rate limiting active on all endpoints
- ✅ Input validation comprehensive
- ⚠️ Consider adding CSRF protection
- ⚠️ Add security headers for admin endpoints

Performance Recommendations:
- Implement Redis caching for session data
- Add database indexing on email lookups
- Consider connection pooling optimization

Test Coverage Gaps:
- Edge cases for concurrent password resets
- Token expiry boundary conditions
- Rate limiting behavior under load
```

### Example 3: Full-Stack Feature with E2E Testing

**Feature Request:** "Create a real-time chat system with message history, user presence, and file sharing"

#### Phase 1: Orchestrator Analysis
```
Complexity Assessment: Complex
Required Personas: architect, frontend, backend, security, performance, qa
Estimated Duration: 12-16 hours
Key Components: WebSocket integration, real-time UI, file handling, database optimization
Special Considerations: Performance critical, requires E2E testing
```

#### Phase 2: Implementation Highlights

**Frontend (React + WebSocket):**
```typescript
// Real-time chat component with optimistic updates
const ChatRoom: React.FC<ChatRoomProps> = ({ roomId }) => {
  const { messages, sendMessage, users } = useWebSocket(roomId);
  const { uploadFile } = useFileUpload();
  
  return (
    <div className="chat-room">
      <UserPresence users={users} />
      <MessageList messages={messages} />
      <MessageInput onSend={sendMessage} onFileUpload={uploadFile} />
    </div>
  );
};
```

**Backend (Node.js + Socket.io):**
```javascript
// Real-time message handling with persistence
io.on('connection', (socket) => {
  socket.on('join-room', async (roomId) => {
    await socket.join(roomId);
    const messages = await MessageService.getRecentMessages(roomId);
    socket.emit('message-history', messages);
  });
  
  socket.on('send-message', async (data) => {
    const message = await MessageService.createMessage(data);
    io.to(data.roomId).emit('new-message', message);
  });
});
```

#### Phase 3: QA Analysis with Playwright Integration
```
QA Score: 87/100

Playwright E2E Test Scenarios:
1. ✅ User joins chat room and sees message history
2. ✅ Real-time message sending and receiving
3. ✅ File upload and sharing functionality
4. ✅ User presence indicators work correctly
5. ✅ Mobile responsive behavior validated
6. ⚠️ Need tests for connection interruption handling

Critical E2E Tests Added:
- Multi-user chat simulation
- File upload with various formats
- Network interruption recovery
- Mobile touch interactions
- Cross-browser compatibility (Chrome, Firefox, Safari)

Performance Validation:
- Message load time: <200ms for 100 messages
- File upload: <5s for 10MB files
- Memory usage: Stable under 50MB for 1000 messages
- WebSocket connection: Stable over 4-hour test
```

## Human Interaction Examples

### Approval Process Examples

#### Issue Approval
```
Human Reviewer Comment:
"@langgraph approve - This looks comprehensive. Please ensure the password reset tokens expire within 24 hours and add rate limiting to prevent abuse."

Workflow Response:
✅ Development approved! Adding security requirements to implementation plan:
- Password reset token expiry: 24 hours
- Additional rate limiting on reset endpoints
- Enhanced security testing for abuse prevention

Proceeding to development phase...
```

#### PR Review with Changes Requested
```
Human Reviewer Comment:
"The implementation looks good overall, but I'd like to see:
1. More comprehensive error handling in the auth middleware  
2. Additional unit tests for edge cases
3. Documentation for the JWT token structure

Please address these before merge."

Workflow Response:
📝 Change requests received. Coordinating with development agent to address:

1. ✅ Enhanced error handling in auth middleware
2. ✅ Added 15 new unit tests for edge cases  
3. ✅ Created JWT token documentation with examples

Updated PR with requested changes. Ready for re-review!
```

### Emergency Stop Example
```
Human Comment on Issue:
"@langgraph halt - We just discovered a security vulnerability in our current auth system. Please pause this work while we assess the impact."

Workflow Response:
🛑 Emergency stop activated!

Workflow Status:
- Current Phase: Development (75% complete)
- Work Preserved: All progress saved to branch feature/lg-456-auth-system
- State File: .claude/tasks/lg-20240131-abc123.md

The workflow has been safely paused. All work is preserved and can be resumed once security assessment is complete.

To resume: Update the workflow state and restart from the saved checkpoint.
```

## Error Recovery Examples

### Test Failure During Development
```
Error Scenario: 
Integration tests failing due to database connection timeout

Automatic Recovery:
1. ✅ Detected test failures (3 failing, 15 passing)
2. ✅ Analyzed failure patterns (all database-related)
3. ✅ Implemented connection pool optimization
4. ✅ Added retry logic for database operations
5. ✅ Re-ran tests: All 18 passing ✅

Recovery Time: 12 minutes
No human intervention required
```

### GitHub API Rate Limit
```
Error Scenario:
GitHub API rate limit exceeded during PR creation

Automatic Recovery:
1. ⚠️ GitHub API rate limit detected (10 requests remaining)
2. 🕒 Waiting for rate limit reset (23 minutes)
3. ✅ Rate limit reset, resuming operations
4. ✅ PR created successfully: #789

Total Delay: 25 minutes
Workflow continued automatically
```

## Performance Benchmarks

### Workflow Execution Times

| Complexity | Average Duration | Success Rate | Human Intervention |
|------------|------------------|--------------|-------------------|
| Simple     | 1.5 hours       | 96%          | 5%                |
| Moderate   | 3.2 hours       | 93%          | 8%                |
| Complex    | 7.8 hours       | 89%          | 12%               |

### Quality Metrics

| Metric | Target | Average Achieved | Best Case |
|--------|--------|------------------|-----------|
| QA Score | >85/100 | 89.2/100 | 96/100 |
| Test Coverage | >80% | 87.3% | 95% |
| Time to PR | <4 hours | 3.1 hours | 45 minutes |
| First-time Success | >85% | 91.2% | N/A |

## Best Practices Learned

### For Simple Features (1-4 hours)
- ✅ Focus on single component or small API changes
- ✅ Prioritize test coverage and documentation
- ✅ Use existing patterns and conventions
- ✅ Leverage design system components

### For Moderate Features (4-8 hours)
- ✅ Break into clear phases with checkpoints
- ✅ Plan integration points carefully
- ✅ Include performance considerations early
- ✅ Add comprehensive error handling

### For Complex Features (8+ hours)
- ✅ Involve architect persona for system design
- ✅ Plan for multiple personas and coordination
- ✅ Include security review for sensitive features
- ✅ Plan E2E testing with Playwright integration
- ✅ Consider breaking into multiple workflows

## Troubleshooting Guide

### Common Issues and Solutions

**Issue:** Workflow stuck in "waiting_approval" phase
**Solution:** Check GitHub issue for approval comment format. Must be exactly `@langgraph approve`

**Issue:** Tests failing during development phase
**Solution:** Workflow should auto-fix test failures. If persistent, check error logs in state file

**Issue:** QA score consistently low (<80)
**Solution:** Review QA recommendations and adjust implementation patterns

**Issue:** Long execution times
**Solution:** Consider breaking complex features into multiple simpler workflows

### Recovery Commands

```bash
# Check workflow status
/geliz:state query --status active

# Resume interrupted workflow  
/geliz:orchestrator resume lg-20240131-abc123

# Manual GitHub sync
/geliz:github sync-state lg-20240131-abc123

# Emergency workflow reset
/geliz:state reset lg-20240131-abc123 --preserve-artifacts
```

## Next Steps

Once you're comfortable with the basic workflow:

1. **Customize Personas:** Adapt personas to your specific project needs
2. **Extend QA Rules:** Add project-specific quality gates and metrics
3. **Integrate CI/CD:** Connect with your existing development pipeline  
4. **Monitor Performance:** Track workflow metrics and optimize bottlenecks
5. **Train Team:** Ensure team understands approval processes and emergency controls

The LangGraph multi-agent workflow is designed to learn and improve over time. Each completed workflow contributes to better decision-making and more accurate estimates for future features.