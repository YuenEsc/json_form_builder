bool isFieldEnabled(Map<String, dynamic> fieldSchema) {
  if (fieldSchema.containsKey("enabled")) {
    if (fieldSchema["enabled"] == true) {
      return true;
    }
    if (fieldSchema["enabled"] == false) {
      return false;
    }
  } else {
    return true;
  }
}
