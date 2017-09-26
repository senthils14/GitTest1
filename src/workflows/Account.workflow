<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Description_for_Test</fullName>
        <field>Description</field>
        <formula>Description + &apos; ,  &apos; + &apos;Newly Inserted&apos;</formula>
        <name>Update Description for Test</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Description for Test</fullName>
        <actions>
            <name>Update_Description_for_Test</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Industry</field>
            <operation>equals</operation>
            <value>Banking,Education</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
