// codeunit 50114 "Event SubTask 17"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
//     local procedure OnAfterValidateEvent(var Rec: Record "Sales Line")
//     var
//         itemRec: Record Item;
//         itemJnLineRec: Record "Item Journal Line";
//         ItemJnPostRec: Codeunit "Item Jnl.-Post Line";
//         journalTemplateName: Code[10];
//         journalBatchName: Code[10];
//         AvailableQuantity: Decimal;
//         ShortageQuantity: Decimal;
//         NextLineNo: Integer;
//     begin
//         NextLineNo := 10000;
//         ItemRec.Get(Rec."No.");
//         ItemRec.SetRange("Location Filter", Rec."Location Code");
//         ItemRec.SetAutoCalcFields(Inventory);

//         AvailableQuantity := ItemRec.Inventory;

//         if AvailableQuantity > Rec.Quantity then begin
//             exit;
//             ShortageQuantity := Rec.Quantity - AvailableQuantity;
//             ItemJnLineRec.Reset();
//             ItemJnLineRec.SetRange("Journal Template Name", journalTemplateName);
//             ItemJnLineRec.SetRange("Journal Batch Name", journalBatchName);
//             if ItemJnLineRec.FindLast() then begin
//                 NextLineNo := ItemJnLineRec."Line No." + NextLineNo;
//             end
//             else
//                 nextLineNo := 10000;
//             ItemJnLineRec.Init();
//             ItemJnLineRec.Validate("Journal Template Name", journalTemplateName);
//             ItemJnLineRec.Validate("Journal Batch Name", journalBatchName);
//             ItemJnLineRec.Validate("Line No.", NextLineNo);
//             ItemJnLineRec.Validate("Posting Date", workDate);
//             ItemJnLineRec.Validate("Entry Type", ItemJnLineRec."Entry Type"::"Positive Adjmt.");
//             ItemJnLineRec.Validate("Document No.", Rec."Document No.");
//             ItemJnLineRec.Validate("Item No.", Rec."No.");
//             ItemJnLineRec.Validate("Location Code", Rec."Location Code");
//             ItemJnLineRec.Validate("Quantity", ShortageQuantity);
//             ItemJnLineRec.Insert(true);
//             ItemJnPostRec.RunWithCheck(ItemJnLineRec);
//             Message('Item Journal Line created for shortage quantity: %1', ShortageQuantity);
//         end;
//     end;
// }