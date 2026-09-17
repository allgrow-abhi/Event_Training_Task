codeunit 50124 "Event Sub Task 11"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Item", OnBeforeCopyItem, '', false, false)]
    local procedure OnBeforeCopyItem(SourceItem: Record Item)
    begin
        SourceItem.Description := SourceItem.Description + ' Copied Item';
        SourceItem.Modify();
        Message('OnBeforeCopyItem Runs');
    end;
}