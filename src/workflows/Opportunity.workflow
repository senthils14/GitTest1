<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Email_to_the_Owner</fullName>
        <description>Send Email to the Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Stage_to_Closed</template>
    </alerts>
    <alerts>
        <fullName>sample_Testing</fullName>
        <description>sample Testing</description>
        <protected>false</protected>
        <recipients>
            <recipient>senthils14@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_Stage_to_Closed</template>
    </alerts>
    <outboundMessages>
        <fullName>First_Testing</fullName>
        <apiVersion>27.0</apiVersion>
        <description>Testing</description>
        <endpointUrl>http://requestb.in/1gxbtv31</endpointUrl>
        <fields>Amount</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>StageName</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>senthils14@gmail.com</integrationUser>
        <name>First Testing</name>
        <protected>true</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>First Testing</fullName>
        <actions>
            <name>First_Testing</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>equals</operation>
            <value>999999</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>send mail once the stage closed</fullName>
        <actions>
            <name>Send_Email_to_the_Owner</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost,Closed Won</value>
        </criteriaItems>
        <description>send mail to the owner, once the opportunity stage changed to closed Won/ Lost</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Request_Approved</fullName>
        <assignedTo>senthils14@gmail.com2</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CloseDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Request Approved</subject>
    </tasks>
    <tasks>
        <fullName>Request_Approved1</fullName>
        <assignedTo>senthils14@gmail.com2</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CloseDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Request Approved1</subject>
    </tasks>
    <tasks>
        <fullName>sample</fullName>
        <assignedTo>senthils14@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>sample</subject>
    </tasks>
</Workflow>
