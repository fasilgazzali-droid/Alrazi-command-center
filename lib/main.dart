import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'dart:async';

void main() {
  runApp(const AlRaziApp());
}

class AlRaziApp extends StatelessWidget {
  const AlRaziApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        cardColor: const Color(0xFF161B22),
        primaryColor: const Color(0xFF00F0FF),
      ),
      home: const CommandCenterDashboard(),
    );
  }
}

class CommandCenterDashboard extends StatefulWidget {
  const CommandCenterDashboard({Key? key}) : super(key: key);

  @override
  _CommandCenterDashboardState createState() => _CommandCenterDashboardState();
}

class _CommandCenterDashboardState extends State<CommandCenterDashboard> {
  // --- CORE APP CALCULATOR STATE ---
  int influencePoints = 75;
  int capitalCredits = 650; // Increased base value so you can test purchases instantly
  int staminaIndex = 88;
  int shadowFavors = 3;
  
  String selectedIntelView = 'none';
  String? currentVoteCast;
  bool isUnderSubpoena = false;
  double billPassingProbability = 54.0;
  
  final List<String> _systemLogs = [
    "System Engine Online. Secure handshake achieved.",
    "Database Sync: Live student ledger verified."
  ];

  int _tickerIndex = 0;
  final List<String> _tickerNews = [
    "⚡ CRISIS ALERT: District 4 power grid failure entering hour 12.",
    "📰 MEDIA OUTRAGE: Public polling drops 8% over legislative delay.",
    "👁️ DEEP STATE LEAK: Anonymous files trace energy contract funds.",
    "⚖️ MOCK COURT: Subpoena filed against Minister of Finance."
  ];

  late Timer _tickerTimer;
  late Timer _staminaRegenTimer;

  @override
  void initState() {
    super.initState();
    // News ticker animation loop
    _tickerTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _tickerIndex = (_tickerIndex + 1) % _tickerNews.length;
        });
      }
    });

    // Background passive processing loop: Restores stamina slowly if not fully drained
    _staminaRegenTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      if (mounted && staminaIndex > 0 && staminaIndex < 100) {
        setState(() {
          staminaIndex = (staminaIndex + 1).clamp(0, 100);
        });
      }
    });
  }

  @override
  void dispose() {
    _tickerTimer.cancel();
    _staminaRegenTimer.cancel();
    super.dispose();
  }

  // --- ACTIONS SYSTEM LOGIC ---
  void _addLog(String msg) {
    if (mounted) {
      setState(() {
        _systemLogs.insert(0, "[${DateTime.now().toString().split(' ')[1].substring(0, 8)}] $msg");
      });
    }
  }

  bool _verifyStamina() {
    if (staminaIndex <= 0) {
      _addLog("REJECTED: Executive exhaustion. Perform a system reset to clear fatigue.");
      return false;
    }
    return true;
  }

  void _executeWiretap() {
    if (!_verifyStamina()) return;
    
    if (capitalCredits >= 200) {
      setState(() {
        capitalCredits -= 200;
        staminaIndex = (staminaIndex - 15).clamp(0, 100);
        shadowFavors += 1;
        selectedIntelView = 'deepstate';
      });
      _addLog("TRANSACTION SUCCESS: Wiretap node online (-200 CC, -15 Stamina). +1 Shadow Favor.");
    } else {
      _addLog("ERROR: Insufficient Capital Credits. 200 CC required.");
    }
  }

  void _triggerAssetFreeze() {
    if (!_verifyStamina()) return;

    if (influencePoints >= 80) {
      setState(() {
        influencePoints -= 20;
        staminaIndex = (staminaIndex - 25).clamp(0, 100);
        isUnderSubpoena = true;
      });
      _addLog("JUDICIAL ACTION: Opposition accounts frozen via Mock Subpoena (-20 IP).");
    } else {
      _addLog("ERROR: Influence index too low. Requires minimum 80 IP to push judicial order.");
    }
  }

  void _performSystemReset() {
    setState(() {
      staminaIndex = 100;
      isUnderSubpoena = false;
    });
    _addLog("SYSTEM RESET: Rest cycle complete. Stamina fully normalized.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 1. TOP HEADER & TICKER
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF161B22),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[800]!),
                ),
                child: Row(
                  children: [
                    const Icon(Lucide.terminal, color: Color(0xFF00F0FF)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("AL-RAZI PROJECT", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00F0FF), letterSpacing: 1.5)),
                          const SizedBox(height: 2),
                          Text(_tickerNews[_tickerIndex], style: const TextStyle(color: Colors.amber, fontSize: 11), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 2. STATS OVERVIEW CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF161B22),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[800]!),
                ),
                child: Column(
                  children: [
                    _buildStatBar("Influence (IP)", influencePoints / 100, Colors.emerald, "$influencePoints / 100"),
                    const SizedBox(height: 12),
                    _buildStatBar("Capital Credits (CC)", capitalCredits / 1000, Colors.amber, "$capitalCredits CC"),
                    const SizedBox(height: 12),
                    _buildStatBar("Executive Stamina", staminaIndex / 100, Colors.rose, "$staminaIndex%"),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 3. ASYMMETRIC INTEL SELECTION MATRIX
              Expanded(
                child: ListView(
                  children: [
                    const Text("ASYMMETRIC INTEL MATRIX", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _intelButton("01 // Bureaucrat", 'bureaucrat'),
                        const SizedBox(width: 8),
                        _intelButton("02 // Media", 'media'),
                        const SizedBox(width: 8),
                        _intelButton("03 // Deep State", 'deepstate'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      minHeight: 110,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[900]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_getIntelText(), style: const TextStyle(fontFamily: 'Courier', fontSize: 12, color: Colors.white70)),
                          if (selectedIntelView != 'none') ...[
                            const Divider(color: Colors.white10, height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (selectedIntelView == 'media')
                                  TextButton.icon(
                                    onPressed: _triggerAssetFreeze,
                                    icon: const Icon(Lucide.gavel, size: 14, color: Colors.roseAccent),
                                    label: const Text("File Subpoena Order", style: TextStyle(fontSize: 11, color: Colors.roseAccent)),
                                  ),
                                if (selectedIntelView == 'deepstate')
                                  TextButton.icon(
                                    onPressed: _executeWiretap,
                                    icon: const Icon(Lucide.radio, size: 14, color: Color(0xFF00F0FF)),
                                    label: const Text("Deploy Deep Wiretap (Costs 200 CC)", style: TextStyle(fontSize: 11, color: Color(0xFF00F0FF))),
                                  ),
                              ],
                            )
                          ]
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 4. PARLIAMENTARY ARENA
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF161B22),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[800]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.between,
                            children: [
                              const Text("MOCK PARLIAMENT PORTAL", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                              Text("Passing Chance: ${billPassingProbability.toStringAsFixed(1)}%", style: const TextStyle(fontSize: 11, color: Colors.amber)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text("Bill 104: Emergency Grid Stabilization Act", style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: currentVoteCast == 'Aye' ? Colors.emerald.withOpacity(0.3) : Colors.grey[900],
                                    side: BorderSide(color: currentVoteCast == 'Aye' ? Colors.emerald : Colors.transparent),
                                  ),
                                  onPressed: () {
                                    if (!_verifyStamina()) return;
                                    setState(() {
                                      currentVoteCast = 'Aye';
                                      influencePoints = (influencePoints + 8).clamp(0, 100);
                                      capitalCredits += 75;
                                      staminaIndex = (staminaIndex - 10).clamp(0, 100);
                                      billPassingProbability = (billPassingProbability + 4.5).clamp(0, 100);
                                    });
                                    _addLog("VOTED AYE: Coalition metric advanced (+8 IP, +75 CC).");
                                  },
                                  child: const Text("Vote AYE", style: TextStyle(color: Colors.emeraldAccent)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: currentVoteCast == 'Nay' ? Colors.rose.withOpacity(0.3) : Colors.grey[900],
                                    side: BorderSide(color: currentVoteCast == 'Nay' ? Colors.rose : Colors.transparent),
                                  ),
                                  onPressed: () {
                                    if (!_verifyStamina()) return;
                                    setState(() {
                                      currentVoteCast = 'Nay';
                                      shadowFavors += 1;
                                      staminaIndex = (staminaIndex - 10).clamp(0, 100);
                                      billPassingProbability = (billPassingProbability - 6.0).clamp(0, 100);
                                    });
                                    _addLog("VOTED NAY: Opposition lines strengthened (+1 Shadow Favor).");
                                  },
                                  child: const Text("Vote NAY", style: TextStyle(color: Colors.roseAccent)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // UTILITY ROW (Emergency recovery if user runs out of stamina during execution tests)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(isUnderSubpoena ? "⚠️ SUBPOENA LOCK ACTIVE" : "🟢 LEGAL COMPLIANCE OK", style: TextStyle(fontSize: 10, color: isUnderSubpoena ? Colors.rose : Colors.grey, fontWeight: FontWeight.bold)),
                        TextButton.icon(
                          onPressed: _performSystemReset,
                          icon: const Icon(Lucide.refresh_cw, size: 12, color: Colors.blueAccent),
                          label: const Text("Emergency Recovery Rest", style: TextStyle(fontSize: 11, color: Colors.blueAccent)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // 5. CONSOLE LOG OUTPUT
                    Container(
                      height: 110,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                      child: ListView.builder(
                        itemCount: _systemLogs.length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(_systemLogs[i], style: const TextStyle(fontFamily: 'Courier', fontSize: 11, color: Colors.greenAccent)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBar(String title, double val, Color col, String trailingText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 11, fontFamily: 'Courier', color: Colors.white70)),
            Text(trailingText, style: TextStyle(fontSize: 11, fontFamily: 'Courier', color: col, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(value: val.clamp(0.0, 1.0), color: col, backgroundColor: Colors.black24, minHeight: 6),
      ],
    );
  }

  Widget _intelButton(String text, String view) {
    bool isSel = selectedIntelView == view;
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          side: BorderSide(color: isSel ? const Color(0xFF00F0FF) : Colors.grey[800]!),
          backgroundColor: isSel ? const Color(0xFF00F0FF).withOpacity(0.05) : Colors.transparent,
        ),
        onPressed: () {
          setState(() { selectedIntelView = view; });
          _addLog("Accessing $text Node Layer.");
        },
        child: Text(text, style: TextStyle(fontSize: 10, color: isSel ? const Color(0xFF00F0FF) : Colors.white60), textAlign: TextAlign.center),
      ),
    );
  }

  String _getIntelText() {
    if (selectedIntelView == 'bureaucrat') return "• Power grid capacity dropping by 14.2MW/hr.\n• Reserves diverted completely away from civilian zones to industrial nodes.\n[Actionable data node found]";
    if (selectedIntelView == 'media') return "• Regional public panic index scaling up 34%.\n• Target Keywords trending: #GridFailure, #ResignNow.\n[System action unlock: File Subpoena]";
    if (selectedIntelView == 'deepstate') return "• INTERCEPTED WIRE: 'Block the infrastructure audit at all costs. If the court reads the ledger, the balance splits.'\n[System action unlock: Deploy Wiretap]";
    return "Select a data terminal module vector above to decrypt files...";
  }
}
