class HolisticStudentProfile {
  final String studentId;
  final String fullName;
  final String assignedClass;

  final double academicGpa;
  final double assignmentSpeed;
  final double conceptMastery;

  final double workload;
  final double focus;
  final double stress;

  final double collaboration;
  final double communication;
  final double leadership;

  final double attendance;
  final double wellness;
  final double coordination;

  const HolisticStudentProfile({
    required this.studentId,
    required this.fullName,
    required this.assignedClass,
    required this.academicGpa,
    required this.assignmentSpeed,
    required this.conceptMastery,
    required this.workload,
    required this.focus,
    required this.stress,
    required this.collaboration,
    required this.communication,
    required this.leadership,
    required this.attendance,
    required this.wellness,
    required this.coordination,
  });

  factory HolisticStudentProfile.demo() {
    return const HolisticStudentProfile(
      studentId: "AR-2026-99A",
      fullName: "M. Fasil K.",
      assignedClass: "Senior Tier Alpha",
      academicGpa: 0.92,
      assignmentSpeed: 0.85,
      conceptMastery: 0.89,
      workload: 0.78,
      focus: 0.84,
      stress: 0.31,
      collaboration: 0.95,
      communication: 0.90,
      leadership: 0.87,
      attendance: 0.96,
      wellness: 0.88,
      coordination: 0.81,
    );
  }
}
