class AIService {
  AIService._();

  static Future<String> ask(String prompt) async {
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    final text = prompt.toLowerCase();

    if (text.contains("valuation")) {
      return "Paper valuation completed successfully.";
    }

    if (text.contains("attendance")) {
      return "Attendance analytics generated successfully.";
    }

    if (text.contains("student")) {
      return "Student profile retrieved successfully.";
    }

    if (text.contains("poem")) {
      return """
Roses compile,
Widgets align,
Flutter keeps
everything running fine.
""";
    }

    if (text.contains("report")) {
      return "Academic report generated successfully.";
    }

    return "Command executed successfully.";
  }
}
