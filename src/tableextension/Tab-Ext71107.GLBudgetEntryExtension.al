tableextension 71107 "G/L Budget Entry Extension" extends "G/L Budget Entry"
{
    // Add your fields, actions, or modifications here

    fields
    {
        field(71100; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }

        field(71101; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }

        field(71102; "G/L Account Type"; Enum "MASQ G/L Account Type")
        {
            Caption = 'G/L Account Type';

        }
        field(71103; "Project Number"; Code[20])
        {
            Caption = 'Project Number';
            TableRelation = "Job"."No.";
            DataClassification = ToBeClassified;
        }

    }
}