// codeunit 50115 "Event SubTask 33"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", "OnBeforePostSalesDoc", '', false, false)]
//     local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header")
//     var
//         CustomerLedgerEntryRec: Record "Cust. Ledger Entry";
//         overDueAmount: Decimal;
//         OverDueInvoiceEmailRec: Record "Overdue Invoice Email";
//     begin
//         overDueAmount := 0;
//         CustomerLedgerEntryRec.Reset();
//         CustomerLedgerEntryRec.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
//         CustomerLedgerEntryRec.SetRange("Document Type", CustomerLedgerEntryRec."Document Type"::Invoice);
//         CustomerLedgerEntryRec.SetRange(Open, true);
//         CustomerLedgerEntryRec.SetFilter("Due Date", '<%1', Today);
//         CustomerLedgerEntryRec.SetAutoCalcFields("Remaining Amount");
//         if CustomerLedgerEntryRec.FindSet() then begin
//             repeat
//                 if (CustomerLedgerEntryRec."Remaining Amount" > 0) and (CustomerLedgerEntryRec."Due Date" < Today) then begin
//                     OverDueInvoiceEmailRec.Init();
//                     OverDueInvoiceEmailRec."Due Date" := CustomerLedgerEntryRec."Due Date";
//                     OverDueInvoiceEmailRec."Invoice No" := CustomerLedgerEntryRec."Document No.";
//                     OverDueInvoiceEmailRec.Amount := CustomerLedgerEntryRec.Amount;
//                     OverDueInvoiceEmailRec."Customer No" := CustomerLedgerEntryRec."Customer No.";
//                     OverDueInvoiceEmailRec."Customer Name" := CustomerLedgerEntryRec."Customer Name";
//                     OverDueInvoiceEmailRec.Insert();
//                 end;
//             until CustomerLedgerEntryRec.Next() = 0;
//         end;


//     end;
// }