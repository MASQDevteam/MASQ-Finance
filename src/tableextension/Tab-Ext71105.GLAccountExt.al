tableextension 71105 "GLAccountExt" extends "G/L Account"
{
    fields
    {
        field(71100; "Project Number Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = job
            ;
        }
    }
}