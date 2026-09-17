codeunit 50125 "Event Sub Task 8"
{
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromPurchHeader, '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromPurchHeader(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Purchase Vendor Code" := PurchaseHeader."Purchase Vendor Code";
        Message('OnAfterCopyGenJnlLineFromPurchHeader');
    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", OnAfterCopyGLEntryFromGenJnlLine, '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Purchase Vendor Code" := GenJournalLine."Purchase Vendor Code";

        Message('OnCreateGLEntryOnBeforeInsertGLEntry');
    end;
}