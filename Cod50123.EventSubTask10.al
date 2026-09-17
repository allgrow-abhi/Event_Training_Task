// codeunit 50123 "Event Sub Task 10"
// {
//     [EventSubscriber(ObjectType::CodeUnit, Codeunit::"Purch.-Post", OnPostItemJnlLineOnBeforePostItemJnlLineCopyDocumentFields, '', false, false)]
//     local procedure OnPostItemJnlLineOnBeforePostItemJnlLineCopyDocumentFields(var ItemJournalLine: Record "Item Journal Line"; PurchaseHeader: Record "Purchase Header")
//     begin
//         ItemJournalLine."Item Code AS" := PurchaseHeader."Item Code AS";
//         Message('OnAfterPostItemJnlLine is run');
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
//     local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line")
//     begin
//         NewItemLedgEntry."Item Code AS" := ItemJournalLine."Item Code AS";
//         Message('OnAfterInitItemLedgEntry is run');
//     end;
// }