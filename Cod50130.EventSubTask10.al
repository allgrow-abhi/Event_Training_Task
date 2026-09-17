// codeunit 50130 "Event Sub Task 10"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
//     local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
//     begin
//         GenJournalLine."Sales Code" := SalesHeader."Sales Code";
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnAfterCustLedgEntryInsert, '', False, False)]
//     local procedure OnAfterUpdateSalesHeader(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
//     begin
//         CustLedgerEntry."Sales Code" := GenJournalLine."Sales Code";
//         CustLedgerEntry.Modify();
//     end;
// }