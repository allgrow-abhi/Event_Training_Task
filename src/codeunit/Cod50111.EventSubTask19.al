// codeunit 50111 "Event SubTask 19"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", false, false)]
//     local procedure OnAfterInsertEvent(var Rec: Record "Sales Line")
//     var
//         TrackingSpecificationRec: record "Tracking Specification";
//     begin
//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if Rec."No." = '' then
//             exit;

//         if Rec."Qty. to Ship" = 0 then
//             exit;
//         if TrackingSpecificationRec.FindLast() then
//             TrackingSpecificationRec."Entry No." := TrackingSpecificationRec."Entry No." + 1
//         else
//             TrackingSpecificationRec."Entry No." := 1;
//         TrackingSpecificationRec.Init();
//         TrackingSpecificationRec."Source Type" := Database::"Sales Line";
//         TrackingSpecificationRec."Source ID" := Rec."Document No.";
//         TrackingSpecificationRec."Source Ref. No." := Rec."Line No.";
//         TrackingSpecificationRec."Item No." := Rec."No.";
//         TrackingSpecificationRec."Qty. to Handle" := Rec."Qty. to Ship";
//         TrackingSpecificationRec."Qty. to Handle (Base)" := Rec."Qty. to Ship (Base)";
//         TrackingSpecificationRec."Quantity (Base)" := Rec."Qty. to Ship (Base)";

//         TrackingSpecificationRec.insert();

//         Message('OnAfterValidateEvent runs');
//         Message('Tracking SpecificationRec "Quantity (Base)" :%1', TrackingSpecificationRec."Quantity (Base)");
//     end;
// }