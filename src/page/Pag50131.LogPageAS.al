// page 50131 "Log Page AS"
// {
//     PageType = list;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "Log Table";

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("User Name"; Rec."User Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Time"; Rec.Time)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Action"; Rec.Action)
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(ActionName)
//             {

//                 trigger OnAction()
//                 begin

//                 end;
//             }
//         }
//     }

//     var
//         myInt: Integer;
// }

//Task 29
page 50131 "Log Page AS"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Log Table";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Old Credit Limit"; Rec."Old Credit Limit")
                {
                    ApplicationArea = all;
                }
                field("New Credit Limit"; Rec."New Credit Limit")
                {
                    ApplicationArea = all;
                }
                field("Date and Time"; Rec." Date and Time")
                {
                    ApplicationArea = all;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}