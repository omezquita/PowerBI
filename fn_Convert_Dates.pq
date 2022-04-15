let func =   
 // fn_Convert_Dates
(date) =>
let
    text_dates =  try Date.ToText(date, "MM/dd/yyyy") otherwise Text.BeforeDelimiter(date, " "),
    Result = Date.FromText(text_dates, [Format = "dd/MM/yyyy"])
in
    Result ,
documentation = [
Documentation.Name =  " fn_Convert_Dates ",
Documentation.Description = " Receives text values in the format dd/MM/yyyy HH:mm:ss or date values in the format MM/dd/yyyy and converts then to dates in the locale configured in the machine",
Documentation.LongDescription = " Receives text values in the format dd/MM/yyyy HH:mm:ss or date values in the format MM/dd/yyyy and converts then to dates in the locale configured in the machine.
Custom function created by: Orlando Mezquita ",
Documentation.Category = " ",
Documentation.Source = " ",
Documentation.Version = " 1.0 ",
Documentation.Examples = {[Description =  "  ",
Code = "  ",
Result = "  "]}]
  
 in  
  Value.ReplaceType(func, Value.ReplaceMetadata(Value.Type(func), documentation))
