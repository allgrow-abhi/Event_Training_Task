// page 50133 "Overdue Invoice Email"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = Customer;

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("No"; Rec."No.")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Name"; Rec.Name)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Email"; Rec."E-Mail")
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

//             action(PostingDateSetUp)
//             {
//                 trigger OnAction()
//                 var
//                     SetUpRec: Record "SetUp Page";
//                 begin
//                     SetUpRec.Get('SETUP');
//                     Page.RunModal(Page::"SetUp Page AS", SetupRec);
//                     CurrPage.Update(false);
//                 end;
//             }
//             action(GetOverDueInvoices)
//             {
//                 trigger OnAction()
//                 begin
//                     LoadOverDueCustomer();
//                     Message('LoadOverDueCustomer Function Runs');
//                 end;
//             }

//             action(SendRemainderEmailCustomer)
//             {
//                 trigger OnAction()
//                 begin
//                     SendReMainderEmail();
//                     Message('SendRemainderEmail Function Runs');
//                 end;
//             }

//         }
//     }

//     local procedure LoadOverDueCustomer()
//     var
//         CustomerLedgerEntryRec: Record "Cust. Ledger Entry";
//         CustomerRec: Record Customer;
//         SetUpRec: Record "SetUp Page";
//     begin
//         CustomerLedgerEntryRec.Reset();

//         CustomerLedgerEntryRec.SetRange("Document Type", CustomerLedgerEntryRec."Document Type"::Invoice);
//         CustomerLedgerEntryRec.SetRange("Posting Date", SetUpRec."Start Date", SetUpRec."End Date");
//         CustomerLedgerEntryRec.SetRange(Open, true);
//         CustomerLedgerEntryRec.SetFilter("Due Date", '<%1', Today);

//         if CustomerLedgerEntryRec.FindSet() then begin
//             repeat
//                 if CustomerRec.Get(CustomerLedgerEntryRec."Document No.") then begin
//                     Rec.Reset();
//                     Rec.SetRange("No.", CustomerRec."No.");

//                     if Rec.IsEmpty() then begin
//                         Rec.Init();
//                         Rec."No." := CustomerRec."No.";
//                         Rec.Name := CustomerRec.Name;
//                         Rec."E-Mail" := CustomerRec."E-Mail";
//                         Rec.Insert();
//                     end;
//                 end;
//             until CustomerLedgerEntryRec.Next() = 0;
//             Message('OverDue Customer Entered');
//         end;
//     end;

//     local procedure SendReMainderEmail()
//     var
//         EmailRec: Codeunit Email;
//         EmailMessageRec: Codeunit "Email Message";
//         Subject: Text;
//         Body: Text;
//         countSent: Integer;
//     begin
//         Rec.Reset();
//         if Rec.FindSet() then begin
//             repeat
//                 if Rec."E-Mail" <> '' then begin
//                     Subject := 'OverDue Invoice Remainder';
//                     Body := 'Dear ' + Rec."Name" + ' This is the Remainder regarding your overdue invoice';
//                     EmailMessageRec.Create(Rec."E-Mail", Subject, Body, true);
//                     EmailRec.Send(EmailMessageRec);
//                     countSent := countSent + 1;
//                 end;
//             until Rec.Next() = 0;
//         end;
//         Message('Remainder Email Sent');
//     end;
// }