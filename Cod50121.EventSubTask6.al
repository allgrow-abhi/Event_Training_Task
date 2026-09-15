codeunit 50121 "Event Sub Task6"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchLine, '', false, false)]
    local procedure OnBeforePostPurchLine(var PurchLine: Record "Purchase Line")
    begin
        if PurchLine."No." = '1896-S' then begin
            Error('1896-S is not for posting in Purchase order');
        end;
    end;
}