# JsonFormBuilder
## A FormBuilder that receives a JSON Schema

JsonFormBuilder is a wrapper around FlutterFormBuilder that receives the fields as a JSON Schema

## Features
- customize the fields with the available options
- Inject initial values to the fields
- enable/disable all the fields
- dinamic fields

## Available types
- **textfield**
- **checkboxgroup**
- **datepicker**
- **imagepicker**
- **segmentedcontrol**
- **switch**
- **checkbox**
- **dropdown**
- **tageditor**
- **locationfield**
- **title**
# Available Fields
## textfield properties
-**name:** A unique identifier String for this field
-**minLines:** The min lines that this field has 
-**maxLines:** The max lines that this field has
-**value:** The initial String value of this field
-**label:** The String to be displayed as the label
## locationfield properties
-**name:** A unique identifier String for this field
-**value:** The initial String value of this field
-**label:** The String to be displayed as the label
## imagepicker properties
-**name:** A unique identifier String for this field
-**value:** The initial String value of this field
-**label:** The String to be displayed as the label
## tageditor properties
-**name:** A unique identifier String for this field
-**value:** The initial List<String> value of this field
-**label:** The String to be displayed as the label
## checkbox properties
-**name:** A unique identifier String for this field
-**value:** The initial bool value of this field
-**label:** The String to be displayed as the label
## switch properties
-**name:** A unique identifier String for this field
-**value:** The initial bool value of this field
-**label:** The String to be displayed as the label
## datepicker properties
-**name:** A unique identifier String for this field
-**value:** The initial String value of this field in the following format (y-M-d)
-**label:** The String to be displayed as the label
## checkboxgroup properties
-**name:** A unique identifier String for this field
-**value:** The initial List<dynamic> value of this field
-**label:** The String to be displayed as the label
-**options:** A List<Map<String,dynamic>> to be the fields as e.g. [{"label":"Apple","value": 1}{"label":"Orange","value": 2]
## dropdown properties
-**name:** A unique identifier String for this field
-**value:** The initial List<dynamic> value of this field
-**label:** The String to be displayed as the label
-**options:** A List<Map<String,dynamic>> to be the fields as e.g. [{"label":"Apple","value": 1}{"label":"Orange","value": 2]
## radiogroup properties
-**name:** A unique identifier String for this field
-**value:** The initial dynamic value of this field
-**label:** The String to be displayed as the label
-**options:** A List<Map<String,dynamic>> to be the fields as e.g. [{"label":"Apple","value": 1}{"label":"Orange","value": 2]
## segmentedcontrol properties
-**name:** A unique identifier String for this field
-**value:** The initial dynamic value of this field
-**label:** The String to be displayed as the label
-**options:** A List<Map<String,dynamic>> to be the fields as e.g. [{"label":"Apple","value": 1}{"label":"Orange","value": 2]
## title properties
-**title:** a String 
-**subtitle:** a String
## imagepicker properties
-**name:** A unique identifier String for this field
-**value:** The initial dynamic value of this field
-**label:** The String to be displayed as the label
## keyboardType property options 
-**email**
-**phone**
-**number**
-**streetAddress**
## validators
-**required**:true
-**numeric**:true,
-**ip**:true
-**integer**:true
-**min:**:number
-**max:** number
-**minLength:** number
-**maxLength:** number
-**arrayMinLength:** number
-**arrayMaxLength:** number
-**email:** number
-**equal:** dynamic
-**notEqual:**:dynamic
