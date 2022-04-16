/* Query to create a calendar table from StartDate to EndDate
   Author: Orlando Mézquita
   Version: 1.0 */

let
// Parameters to modify: StartDate and EndDate
// Arguments for #date function are entered in this order: Year, Month, Day order----> #date(Year, Month, Day)

    StartDate = #date(2017,  1,  1),
    EndDate =   #date(2020, 12, 31),

// *************** DO NOT MODIFY AFTER THIS LINE **********************************************************   
    Custom = List.Dates(StartDate, Number.From(EndDate)- Number.From(StartDate) + 1 ,#duration(1,0,0,0)),
    #"Converted to Table" = Table.FromList(Custom, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Changed Type" = Table.TransformColumnTypes(#"Converted to Table",{{"Column1", type date}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Column1", "Date"}}),
    #"Inserted Day" = Table.AddColumn(#"Renamed Columns", "Day", each Date.Day([Date]), type number),
    #"Inserted Day of Week" = Table.AddColumn(#"Inserted Day", "DayOfWeek", each Date.DayOfWeek([Date]), type number),
    #"Inserted Month" = Table.AddColumn(#"Inserted Day of Week", "Month", each Date.Month([Date]), type number),
    #"Inserted Year" = Table.AddColumn(#"Inserted Month", "Year", each Date.Year([Date]), type number),
    #"Inserted Quarter" = Table.AddColumn(#"Inserted Year", "Quarter", each Date.QuarterOfYear([Date]), type number),
    #"Added Day Name" = Table.AddColumn(#"Inserted Quarter", "DayName", each Date.ToText([Date], "dddd")),
    #"Added Month Name" = Table.AddColumn(#"Added Day Name", "MonthName", each Date.ToText([Date], "MMM")),
    #"Changed Type1" = Table.TransformColumnTypes(#"Added Month Name",{{"DayName", type text}, 
                                                                       {"MonthName", type text}, 
                                                                       {"Day", Int64.Type}, 
                                                                       {"DayOfWeek", Int64.Type}, 
                                                                       {"Month", Int64.Type}, 
                                                                       {"Year", Int64.Type}, 
                                                                       {"Quarter", Int64.Type}})
in
    #"Changed Type1"
