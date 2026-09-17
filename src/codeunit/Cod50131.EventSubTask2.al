// codeunit 50131 "Event Sub Task 2"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromPurchHeader, '', false, false)]
//     local procedure OnAfterCopyGenJnlLineFromPurchHeader(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
//     begin
//         GenJournalLine."Vendor Code" := PurchaseHeader."Vendor code";
//         // Message('OnAfterCopyGenJnlLineFromPurchHeader Run');
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnAfterInitVendLedgEntry, '', false, false)]
//     local procedure OnAfterInitVendLedgEntry(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
//     begin
//         VendorLedgerEntry."Vendor Code" := GenJournalLine."Vendor Code";
//         // Message('OnPostVendOnBeforeInitVendLedgEntry Run');
//     end;
// }