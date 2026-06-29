import 'package:flutter/material.dart';

void main() {
  runApp(const AlRaziCommandCenterApp());
}

class AlRaziCommandCenterApp extends StatelessWidget {
  const AlRaziCommandCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Razi CommandCenter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff090a0f), // Absolute Ink Black
        cardColor: const Color(0xff121420),              // Deep Volcanic Charcoal
        dividerColor: Colors.white10,
      ),
      home: const CommandCenterAppHub(),
    );
  }
}

// Architectural Enums
enum UserRole { principal, teacher, student }
enum CoCurricularTab { debate, parliament }

// =========================================================================
// 📑 DATA STRUCTURE: 360-DEGREE HOLISTIC STUDENT PROFILE MODEL
// =========================================================================
class HolisticStudentProfile {
  final String studentId;
  final String fullName;
  final String assignedClass;
  
  // Pillar Alpha: Academic Performance Telemetry
  final double academicGpa;             // Clamped 0.0 -> 1.0
  final double assignmentValuationSpeed; // Clamped 0.0 -> 1.0
  final double conceptMasteryScore;       // Clamped 0.0 -> 1.0

  // Pillar Beta: Cognitive & Mental Health Diagnostics
  final double workloadAdaptability;     // Clamped 0.0 -> 1.0
  final double focusSustainRate;         // Clamped 0.0 -> 1.0
  final double stressFatigueIndex;       // Clamped 0.0 -> 1.0

  // Pillar Gamma: Social & Extracurricular Dynamics
  final double peerCollaborationRatio;   // Clamped 0.0 -> 1.0
  final double communicationClarity;     // Clamped 0.0 -> 1.0
  final double leadershipInitiative;     // Clamped 0.0 -> 1.0

  // Pillar Delta: Structural Physical Vitality
  final double attendanceStaminaIndex;   // Clamped 0.0 -> 1.0
  final double wellnessLogConsistency;   // Clamped 0.0 -> 1.0
  final double spatialCoordinationScore; // Clamped 0.0 -> 1.0

  const HolisticStudentProfile({
    required this.studentId,
    required this.fullName,
    required this.assignedClass,
    required this.academicGpa,
    required this.assignmentValuationSpeed,
    required this.conceptMasteryScore,
    required this.workloadAdaptability,
    required this.focusSustainRate,
    required this.stressFatigueIndex,
    required this.peerCollaborationRatio,
    required this.communicationClarity,
    required this.leadershipInitiative,
    required this.attendanceStaminaIndex,
    required this.wellnessLogConsistency,
    required this.spatialCoordinationScore,
  });
}

class CommandCenterAppHub extends StatefulWidget {
  const CommandCenterAppHub({super.key});

  @override
  State<CommandCenterAppHub> createState() => _CommandCenterAppHubState();
}

class _CommandCenterAppHubState extends State<CommandCenterAppHub> {
  // Gatekeeper State Matrix
  bool _isAuthenticated = false;
  UserRole? _authenticatedRole;
  String _currentIdentityTag = '';
  final TextEditingController _passkeyInputFieldController = TextEditingController();
  String _terminalErrorFeedback = '';

  // Co-Curricular Live Subsystem States
  CoCurricularTab _activeActivityTab = CoCurricularTab.debate;
  final String _activeDebateMotion = 'Global Automation Displaces Academic Assessment Systems';
  final String _activeParliamentBill = 'Institutional Bill 104-A: Decentralized Funding Allotment';
  final String _currentSpeakerRole = 'Speaker of the House';
  int _ayeVotes = 14;
  int _nayVotes = 9;

  // Integrated AI Assistant Console Memory
  final TextEditingController _aiInputController = TextEditingController();
  final List<Map<String, String>> _aiChatLogMemory = [
    {
      'sender': 'ai',
      'text': '🤖 [AI Core]: Terminal Sync Stable. Core assistant module standing by. Ask me to cross-reference paperwork metrics, evaluate arguments, draft text segments, or calculate regional performance balances.'
    }
  ];
  bool _isAiThinking = false;

  // Hardware Credential Passkey Registry
  final Map<String, Map<String, dynamic>> _securityGateRegistry = {
    'PRIN_MAIN_990X#ALRAZI_SECURE': {
      'role': UserRole.principal, 
      'tag': 'PRINCIPAL ADMIN CORE // SUITE_990X'
    },
    'TECH_FACULTY_404M$ALRAZI_DESK': {
      'role': UserRole.teacher, 
      'tag': 'FACULTY ROOM WORKSPACE // DESK_404M'
    },
    'STUD_PORTAL_101Z@ALRAZI_HUB': {
      'role': UserRole.student, 
      'tag': 'STUDENT LOGISTIC PORTAL // NODE_101Z'
    },
  };

  // High-Density Core Record Instance
  final HolisticStudentProfile _targetProfileInstance = const HolisticStudentProfile(
    studentId: "AR-2026-99A",
    fullName: "M. Fasil K.",
    assignedClass: "Senior Tier Alpha",
    academicGpa: 0.92,
    assignmentValuationSpeed: 0.85,
    conceptMasteryScore: 0.89,
    workloadAdaptability: 0.78,
    focusSustainRate: 0.84,
    stressFatigueIndex: 0.31,
    peerCollaborationRatio: 0.95,
    communicationClarity: 0.90,
    leadershipInitiative: 0.87,
    attendanceStaminaIndex: 0.96,
    wellnessLogConsistency: 0.88,
    spatialCoordinationScore: 0.81,
  );

  void _executeSecurityGateHandshake() {
    final rawInput = _passkeyInputFieldController.text.trim();
    if (_securityGateRegistry.containsKey(rawInput)) {
      setState(() {
        _isAuthenticated = true;
        _authenticatedRole = _securityGateRegistry[rawInput]!['role'];
        _currentIdentityTag = _securityGateRegistry[rawInput]!['tag'];
        _terminalErrorFeedback = '';
      });
    } else {
      setState(() {
        _terminalErrorFeedback = 'ACCESS DENIED: INVALID SYSTEM PASSKEY CODE';
        _passkeyInputFieldController.clear();
      });
    }
  }

  void _terminateSecureSession() {
    setState(() {
      _isAuthenticated = false;
      _authenticatedRole = null;
      _currentIdentityTag = '';
      _passkeyInputFieldController.clear();
      _aiInputController.clear();
      _aiChatLogMemory.removeRange(1, _aiChatLogMemory.length); // Clear session memory safely
    });
  }

  // =========================================================================
  // 🧠 INTEGRATED CONSOLE AI DISPATCH ENGINE
  // =========================================================================
  void _askInbuiltAiEngine() {
    final query = _aiInputController.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _aiChatLogMemory.add({'sender': 'user', 'text': query});
      _isAiThinking = true;
    });
    _aiInputController.clear();

    // Deep Processing Simulation Delay
    Future.delayed(const Duration(milliseconds: 750), () {
      final normalizedQuery = query.toLowerCase();
      String responseText = '';

      if (normalizedQuery.contains('valuation') || normalizedQuery.contains('check') || normalizedQuery.contains('papers')) {
        responseText = "🤖 [AI Core]: Valuation analytics processed. Current workload balance tracking at 92 units checks out clean. Scoring profile maps efficiently with no variance flags recorded.";
      } else if (normalizedQuery.contains('poetry') || normalizedQuery.contains('poem') || normalizedQuery.contains('verse')) {
        responseText = "🤖 [AI Core]: Verse generation pipeline completed:\n\n'In dark terminals where bright lines gleam,\nWe map the parameters of a scholar's dream.\nThrough numbers and verses, the balance is true,\nA workspace built purely for you.'";
      } else if (normalizedQuery.contains('campaign') || normalizedQuery.contains('thira') || normalizedQuery.contains('report')) {
        responseText = "🤖 [AI Core]: Regional documentation formatting set for 'Thira' deployment. Strategic coordinates: Tondernad and Kunjom sectors active. Budgetary allocations ready to draft in structural templates.";
      } else if (normalizedQuery.contains('clear') || normalizedQuery.contains('flush')) {
        setState(() {
          _aiChatLogMemory.removeRange(1, _aiChatLogMemory.length);
          _isAiThinking = false;
        });
        return;
      } else {
        responseText = "🤖 [AI Core]: Command recognized. System node parsed entry successfully. Metrics logged into terminal instance history under dynamic telemetry parameters.";
      }

      setState(() {
        _isAiThinking = false;
        _aiChatLogMemory.add({'sender': 'ai', 'text': responseText});
      });
    });
  }

  @override
  void dispose() {
    _passkeyInputFieldController.dispose();
    _aiInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAuthenticated) {
      return _buildZeroKnowledgeGatekeeperHub();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildIndustrialHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _resolveRoleWorkspaceDashboard(),
                    const SizedBox(height: 24),
                    _buildAiInteractiveTerminalConsole(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  // 🔐 1. ZERO-KNOWLEDGE GATEKEEPER SECURE LOGIN HUB
  // =========================================================================
  Widget _buildZeroKnowledgeGatekeeperHub() {
    return Scaffold(
      backgroundColor: const Color(0xff090a0f),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: const Color(0xff121420),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: _terminalErrorFeedback.isNotEmpty ? Colors.redAccent : Colors.white10,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.terminal, color: _terminalErrorFeedback.isNotEmpty ? Colors.redAccent : const Color(0xFF00F0FF), size: 20),
                    const SizedBox(width: 12),
                    const Text(
                      'AL-RAZI COMMANDCENTER v4.0',
                      style: TextStyle(fontFamily: 'Courier', fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5, color: Colors.white),
                    ),
                  ],
                ),
                const Divider(color: Colors.white10, height: 32),
                const Text(
                  'ENTER KEY REGISTER PASSCODE TO BOOT MATRIX',
                  style: TextStyle(fontSize: 10, fontFamily: 'Courier', color: Colors.white38, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passkeyInputFieldController,
                  obscureText: true,
                  obscuringCharacter: '▪',
                  style: const TextStyle(fontFamily: 'Courier', letterSpacing: 3, color: Color(0xFF00F0FF), fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'HARDWARE AUTH KEY PASSKEY REQUIRED',
                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 11, letterSpacing: 0, fontFamily: 'Courier'),
                    filled: true,
                    fillColor: Colors.black38,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  ),
                  onSubmitted: (_) => _executeSecurityGateHandshake(),
                ),
                if (_terminalErrorFeedback.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    _terminalErrorFeedback,
                    style: const TextStyle(color: Colors.redAccent, fontFamily: 'Courier', fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _executeSecurityGateHandshake,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00F0FF),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: const Text('INITIALIZE ACCESS SHIELD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndustrialHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: Color(0xff121420),
        border: Border(bottom: BorderSide(color: Colors.white10, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.security, color: Color(0xFF00F0FF), size: 16),
              const SizedBox(width: 10),
              Text(
                'LOGGED // $_currentIdentityTag',
                style: const TextStyle(fontFamily: 'Courier', fontWeight: FontWeight.bold, fontSize: 11, color: Colors.white70),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.power_settings_new, color: Colors.redAccent, size: 18),
            onPressed: _terminateSecureSession,
            tooltip: 'DISCONNECT INSTANTLY',
          ),
        ],
      ),
    );
  }

  Widget _resolveRoleWorkspaceDashboard() {
    switch (_authenticatedRole) {
      case UserRole.principal:
        return _buildPrincipalMacroWorkspace();
      case UserRole.teacher:
        return _buildTeacherFacultyDesk();
      case UserRole.student:
        return _buildStudentPersonalNode();
      default:
        return const SizedBox.shrink();
    }
  }

  // =========================================================================
  // 🏢 WORKSPACE DOMAIN: PRINCIPAL MACRO CONTROL SUITE
  // =========================================================================
  Widget _buildPrincipalMacroWorkspace() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeaderTag('CAMPUS INFRASTRUCTURE BALANCES & REVENUE'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildMacroNumericCard('TOTAL COMMAND CAPITAL', '785,400 CC UNITS', const Color(0xFF00F0FF))),
            const SizedBox(width: 12),
            Expanded(child: _buildMacroNumericCard('REGULATORY CHECKSTATUS', '100% COMPLIANT', Colors.emerald)),
          ],
        ),
        const SizedBox(height: 16),
        _buildClampedTelemetryProgressRow('Departmental Strategic Funding Reserves Allotment', 0.74, const Color(0xFF00F0FF)),
        _buildClampedTelemetryProgressRow('Institutional Audit Core Validation Clearance Metrics', 1.00, Colors.emerald),
        
        const SizedBox(height: 28),
        _buildSectionHeaderTag('CORE ROSTER ADMINISTRATIVE RECOGNITION SUMMARY'),
        const SizedBox(height: 12),
        _buildHolistic360SpectrumDisplayCard(_targetProfileInstance),
        
        const SizedBox(height: 28),
        _buildSectionHeaderTag('CO-CURRICULAR LOGISTICS ARCHITECTURE INTERFACE'),
        const SizedBox(height: 12),
        _buildCoCurricularInteractiveSubmodule(),
      ],
    );
  }

  // =========================================================================
  // 📝 WORKSPACE DOMAIN: TEACHER FACULTY ROOM WORKSPACE
  // =========================================================================
  Widget _buildTeacherFacultyDesk() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeaderTag('FACULTY TRACKING PIPELINES & ROSTER STATUS'),
        const SizedBox(height: 12),
        _buildClampedTelemetryProgressRow('Academic Paper Evaluation and Score Recording Load', 0.85, const Color(0xFF00F0FF)),
        _buildClampedTelemetryProgressRow('Curricular Distribution Timeline & Milestone Logs', 0.73, Colors.amber),
        
        const SizedBox(height: 28),
        _buildSectionHeaderTag('360° HIGH-DENSITY HOLISTIC DIAGNOSTIC MATRIX'),
        const SizedBox(height: 12),
        _buildHolistic360SpectrumDisplayCard(_targetProfileInstance),
        
        const SizedBox(height: 28),
        _buildSectionHeaderTag('CO-CURRICULAR SKILL DEVELOPMENT EVALUATION BOARDS'),
        const SizedBox(height: 12),
        _buildCoCurricularInteractiveSubmodule(),
      ],
    );
  }

  // =========================================================================
  // 🎒 WORKSPACE DOMAIN: STUDENT LOGISTIC PORTAL NODE
  // =========================================================================
  Widget _buildStudentPersonalNode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeaderTag('INDIVIDUAL DATA PROFILE TELEMETRY'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xff121420), borderRadius: BorderRadius.circular(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('STUDENT RECORD ID: ${_targetProfileInstance.studentId}', style: const TextStyle(fontFamily: 'Courier', fontSize: 13, color: Color(0xFF00F0FF), fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('CLASS CLASSIFICATION ROSTER: ${_targetProfileInstance.assignedClass}', style: const TextStyle(fontSize: 12, color: Colors.white54)),
              const Divider(color: Colors.white10, height: 24),
              _buildClampedTelemetryProgressRow('My Core Personal Attendance Line Performance', _targetProfileInstance.attendanceStaminaIndex, Colors.emerald),
              _buildClampedTelemetryProgressRow('Calculated Terminal Academic Index (GPA Metric)', _targetProfileInstance.academicGpa, const Color(0xFF00F0FF)),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // 📊 COMPONENT: 360-DEGREE HOLISTIC MATRIX VISUAL LAYOUT
  // =========================================================================
  Widget _buildHolistic360SpectrumDisplayCard(HolisticStudentProfile profile) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff121420),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.fullName.toUpperCase(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5)),
                  const SizedBox(height: 2),
                  Text('ID: ${profile.studentId} // INDEX LEVEL: ${profile.assignedClass}', style: const TextStyle(fontFamily: 'Courier', fontSize: 10, color: Colors.white38)),
                ],
              ),
              const Icon(Icons.analytics, color: Color(0xFF00F0FF), size: 20),
            ],
          ),
          const Divider(color: Colors.white10, height: 24),
          
          // PILLAR ALPHA
          _buildPillarSubheading('PILLAR ALPHA // INTELLECTUAL & ACADEMIC PROGRESS', Icons.menu_book),
          _buildClampedTelemetryProgressRow('  - Cumulative GPA Telemetry Profile', profile.academicGpa, const Color(0xFF00F0FF)),
          _buildClampedTelemetryProgressRow('  - Valuation Speed Response Indexing', profile.assignmentValuationSpeed, const Color(0xFF00F0FF)),
          _buildClampedTelemetryProgressRow('  - Concept Master-System Benchmark Mark', profile.conceptMasteryScore, const Color(0xFF00F0FF)),
          const SizedBox(height: 14),

          // PILLAR BETA
          _buildPillarSubheading('PILLAR BETA // COGNITIVE PERFORMANCE & FATIGUE PATHWAYS', Icons.psychology),
          _buildClampedTelemetryProgressRow('  - Curricular Adaptability Endurance Limit', profile.workloadAdaptability, Colors.amber),
          _buildClampedTelemetryProgressRow('  - Focused Core Attention Retention Metric', profile.focusSustainRate, Colors.amber),
          _buildClampedTelemetryProgressRow('  - Burnout Stress Accumulation Index Value', profile.stressFatigueIndex, Colors.redAccent),
          const SizedBox(height: 14),

          // PILLAR GAMMA
          _buildPillarSubheading('PILLAR GAMMA // COHORT COLLABORATION & DYNAMICS LOGS', Icons.groups),
          _buildClampedTelemetryProgressRow('  - Collective Collaboration Task Ratio', profile.peerCollaborationRatio, Colors.emerald),
          _buildClampedTelemetryProgressRow('  - Public Interaction Clarity Performance', profile.communicationClarity, Colors.emerald),
          _buildClampedTelemetryProgressRow('  - Independent Leadership Initiative Vector', profile.leadershipInitiative, Colors.emerald),
          const SizedBox(height: 14),

          // PILLAR DELTA
          _buildPillarSubheading('PILLAR DELTA // VITALITY BASES & PHYSICAL ALIGNMENT', Icons.directions_run),
          _buildClampedTelemetryProgressRow('  - Constant Attendance Stamina Metric Lines', profile.attendanceStaminaIndex, Colors.purpleAccent),
          _buildClampedTelemetryProgressRow('  - Systematic Wellness Tracking Accuracy Log', profile.wellnessLogConsistency, Colors.purpleAccent),
          _buildClampedTelemetryProgressRow('  - Spatial Test Coordination Balance Check', profile.spatialCoordinationScore, Colors.purpleAccent),
        ],
      ),
    );
  }

  // =========================================================================
  // 🏛️ COMPONENT: CO-CURRICULAR TRACKING (DEBATE & LEGISLATIVE ASSEMBLY)
  // =========================================================================
  Widget _buildCoCurricularInteractiveSubmodule() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[900]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _activeActivityTab = CoCurricularTab.debate),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _activeActivityTab == CoCurricularTab.debate ? const Color(0xff121420) : Colors.transparent,
                      border: Border(bottom: BorderSide(color: _activeActivityTab == CoCurricularTab.debate ? const Color(0xFF00F0FF) : Colors.transparent, width: 2)),
                    ),
                    child: Text(
                      'FORENSICS & DEBATES ENGINE',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: _activeActivityTab == CoCurricularTab.debate ? Colors.white : Colors.white38),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _activeActivityTab = CoCurricularTab.parliament),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _activeActivityTab == CoCurricularTab.parliament ? const Color(0xff121420) : Colors.transparent,
                      border: Border(bottom: BorderSide(color: _activeActivityTab == CoCurricularTab.parliament ? Colors.orange : Colors.transparent, width: 2)),
                    ),
                    child: Text(
                      'YOUTH PARLIAMENT WORKFLOWS',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: _activeActivityTab == CoCurricularTab.parliament ? Colors.white : Colors.white38),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: _activeActivityTab == CoCurricularTab.debate
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ACTIVE MOTION UNDER RESOLUTION TOPIC STRING:', style: TextStyle(fontSize: 9, fontFamily: 'Courier', color: Colors.white38)),
                    const SizedBox(height: 4),
                    Text('"${_activeDebateMotion.toUpperCase()}"', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF00F0FF))),
                    const Divider(color: Colors.white10, height: 16),
                    _buildClampedTelemetryProgressRow('Affirmative Group Structural Construction Evaluation', 0.74, const Color(0xFF00F0FF)),
                    _buildClampedTelemetryProgressRow('Negative Counter Rebuttal Cross-Examination Scores', 0.81, Colors.orange),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DIGITAL BILL ASSEMBLY OVERVIEW:', style: TextStyle(fontSize: 9, fontFamily: 'Courier', color: Colors.white38)),
                    const SizedBox(height: 4),
                    Text(_activeParliamentBill.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.orange)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.black38,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('CHAIR CONFIG ROLE', style: TextStyle(fontSize: 8, color: Colors.white38)),
                                Text(_currentSpeakerRole.toUpperCase(), style: const TextStyle(fontSize: 11, fontFamily: 'Courier', fontWeight: FontWeight.bold, color: Color(0xFF00F0FF))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => setState(() => _ayeVotes++),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.emerald, foregroundColor: Colors.black, dense: true),
                          child: Text('AYE [$_ayeVotes]', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => setState(() => _nayVotes++),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white, dense: true),
                          child: Text('NAY [$_nayVotes]', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                        ),
                      ],
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // 🧠 2. INBUILT LIVE INTERACTIVE TERMINAL AI CONSOLE MODULE
  // =========================================================================
  Widget _buildAiInteractiveTerminalConsole() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[900]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.psychology, color: Colors.purpleAccent, size: 16),
              const SizedBox(width: 8),
              Text(
                'CORE CONSOLE LOG ENTRY ASSISTANT MODULE',
                style: TextStyle(fontFamily: 'Courier', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[400]),
              ),
            ],
          ),
          const Divider(color: Colors.white10, height: 16),
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xff090a0f), borderRadius: BorderRadius.circular(4)),
            child: ListView.builder(
              itemCount: _aiChatLogMemory.length + (_isAiThinking ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _aiChatLogMemory.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: SizedBox(height: 14, width: 14, child: CircularProgressIndicator(strokeWidth: 1.5, color: Colors.purpleAccent)),
                  );
                }
                final message = _aiChatLogMemory[index];
                final isUser = message['sender'] == 'user';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    isUser ? '>> ${message['text']}' : '${message['text']}',
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 11,
                      color: isUser ? const Color(0xFF00F0FF) : Colors.white80,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _aiInputController,
                  style: const TextStyle(fontSize: 12, fontFamily: 'Courier'),
                  decoration: InputDecoration(
                    hintText: 'Enter command string, query parameters or text requests...',
                    hintStyle: const TextStyle(color: Colors.white24, fontSize: 11, fontFamily: 'Courier'),
                    filled: true,
                    fillColor: const Color(0xff121420),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  onSubmitted: (_) => _askInbuiltAiEngine(),
                ),
              ),
              const SizedBox(width: 6),
              IconButton(
                icon: const Icon(Icons.send_rounded, color: Colors.purpleAccent, size: 18),
                onPressed: _askInbuiltAiEngine,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Pure Utilities Layout Helpers
  Widget _buildSectionHeaderTag(String tagText) {
    return Text(tagText, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.grey[500]));
  }

  Widget _buildPillarSubheading(String line, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 12, color: Colors.white38),
          const SizedBox(width: 6),
          Text(line, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white38)),
        ],
      ),
    );
  }

  Widget _buildMacroNumericCard(String label, String numeral, Color numColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xff121420), borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.white10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 9, color: Colors.white38, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(numeral, style: TextStyle(fontFamily: 'Courier', fontSize: 13, fontWeight: FontWeight.bold, color: numColor)),
        ],
      ),
    );
  }

  Widget _buildClampedTelemetryProgressRow(String label, double dynamicValue, Color barAccentColor) {
    // Rigid programmatic clamping boundary calculation to prevent display layouts clipping
    final double definitiveSafeValue = dynamicValue.clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.white90)),
              Text(
                '${(definitiveSafeValue * 100).toInt()}%',
                style: TextStyle(fontFamily: 'Courier', fontSize: 11, color: barAccentColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: definitiveSafeValue,
            color: barAccentColor,
            backgroundColor: Colors.white10,
            minHeight: 2.5,
          ),
        ],
      ),
    );
  }
}
