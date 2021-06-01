bool isFieldEnabled(Map<String, dynamic> fieldSchema) {
  if (fieldSchema.containsKey("enabled")) {
    if (fieldSchema["enabled"] == true || fieldSchema["enabled"] == "true") {
      return true;
    }
    else if (fieldSchema["enabled"] == false) {
      return false;
    }
  } 
  return true;
}
