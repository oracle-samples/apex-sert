# APEX-SERT User Guide

## 1. Overview

APEX-SERT is an APEX application that evaluates a selected APEX application for security vulnerabilities. The selected application will be evaluated on many topics including: Authentication, Authorization, SQL Injection, Cross Site Scripting (XSS), URL Tampering and many more. After an evaluation is complete, the user will receive a score for their application and a dashboard to review and modify any security vulnerabilities (issues). Each point of risk is described and a suggested action available to make correcting any security risks quick and easy. APEX-SERT also allows a user to provide exceptions to any issues that may not necessarily be vulnerabilities. A user with the Approver role can then approve or reject the exception based on the provided input and the score can then be reevaluated.

The APEX-SERT User Guide is provided as a reference for using APEX-SERT v21.2. It is intended for any APEX application developer, development manager and those with similar roles. This User Guide defines the different security terminology, attributes and attribute sets and categories used for the evaluation scores, and the different exceptions statuses used throughout APEX-SERT.

This User Guide also covers the following processes that a user can do within APEX-SERT:

[How to Run APEX-SERT](#2-running-apex-sert)

[How to Run an Evaluation on an App](#33-evaluate-application)

How to Download and Upload Exceptions

How to Filter Issues By Page

How to Edit/Fix an Issue directly in the builder

How to Create an Exception for the Issue

How to Create Exceptions in bulk for an attribute

How to Edit or Delete an Exception

How to Approve or Reject an Exception(s)

How to Add a Note to an Issue

How to View an Issue's Details

How to Check for more information on the issue

How to Look up Information on How to fix the Issue Step by Step

Refer to the APEX-SERT Administration Guide for information on administrative tasks that can be performed throughout the APEX-SERT, APEX-SERT Admin, and APEX Maintenance applications.

### 1.1. Security - Why You Should Care

Security is hard. If it’s not, then you’re probably not doing it right. And unfortunately, more and more companies of all sizes and demographics are failing to get security right. Whether it be a major game manufacturer or credit card issuer being hacked, or a federal employee with privileges to too much data handing documents over to WikiLeaks, the news is filled with examples of companies that should have, and you would expect would have known better having their security compromised in a very public way.

This guide, along with APEX-SERT, will help you understand the potential security risks that may occur within an APEX application, how to identify them, and how to do your best to mitigate them.

NOTE : APEX-SERT focuses specifically on application level security. There are many other areas of security that should be addressed, including but not limited to: the application server, firewalls, database security, APEX instance level settings, etc.

### 1.2. Security Terminology

When talking about web security, there are many common terms of which you should have at least a basic understanding. Outlined in this section are the areas which web-based systems are potentially vulnerable.

#### 1.2.1. Authentication

Authentication is the act of “logging in” to an application. Within APEX you can dictate which pages require a user to be logged-in to be able to view them. While this is a very basic level of security, the wrong setting on a page could potentially allow un-authenticated user to access data that they should not see.

#### 1.2.2. Authorization

Authorization is a layer below Authentication. Even though the user may be logged into the application, are they authorized to see the certain aspects of the application? Authorization schemes can be applied at various levels within APEX from the Page all the way down to individual items on a form or columns within a report, allowing you to restrict specific data on a page to only those who are authorized to see it.

#### 1.2.3. SQL Injection

SQL Injection is a code injection technique that exploits a security vulnerability occurring in the database layer of an application. The vulnerability is present when user input is either incorrectly filtered for string literal escape characters embedded in SQL statements or user input is not strongly typed and thereby unexpectedly executed.

Within APEX, SQL injection attacks can be introduced in one of 3 general ways:

• Use of &ITEM. notation within a SQL statement
• Calls to DBMS_SQL that could potentially make use of user input
• Calls to EXECUTE IMMEDIATE that could potentially make use of user input

In each of these circumstances, the possibility that user entered data might be used as part of the SQL Statement being executed is what introduces the risk. For example, suppose there is a a form online that allows a user to sign on with a username and password which ultimately executes this query:

```sql
  SELECT COUNT(*) FROM users
  WHERE username = '&USERNAME.'
    AND password = '&PASSWORD.'
```
If the user were to enter this as their password: `i_dont_know' OR 'x' = 'x`


The resulting SQL would be:

```sql
  SELECT COUNT(*) FROM users
  WHERE  username = 'SCOTT'
  AND    password = 'i_dont_know' OR 'x' = 'x'
```

This will erroneously return 1 rather than No Data Found and allow the user to log in. By using bind variables, this can be avoided:

```sql
  SELECT COUNT(*) FROM users
  WHERE  username = :USERNAME
  AND    password = :PASSWORD
```


Now, if you enter this as your password: `i_dont_know' OR 'x' = 'x`

Unless that is specifically your password, the database will return No Data Found.

Because of the potential risk, great care should be taken when using any of these methods inside of any SQL or PL/SQL executed by APEX.

#### 1.2.4. Cross Site Scripting (XSS)

Cross Site Scripting (XSS) is a type of computer security vulnerability typically found in web applications that enables attackers to inject client-side script (such as JavaScript) into web pages viewed buy others. XSS attacks may be used to bypass access control, expose cookie information, capture and send data to other sites, etc.

An example of XSS within APEX would be a form where a user is allowed to enter free-form text and later that text is rendered back to the screen without being properly escaped. For instance if the user were to enter the following value in a COMMENT field:

```javascript
<script type=”text/javascript”>
 alert('Hello world');
</script>
```

If the data were emitted unescaped into an APEX page, the javascript would actually be run. Therefore great care should be taken when displaying user input back to an APEX page.

#### 1.2.5. URL Tampering

URL Tampering is potentially the most dangerous and most likely form of security breach as it does not take any programming skills to initiate and it is not an attack that most developers are trained to protect against. Any curious or malicious user can access and manipulate the URL and, if proper security measures are not in place, may be able to access data that was not meant for them.

Historically, APEX links have been coded to pass arguments un-checked on the URL as shown :

   `http://server/apex/f?p=134:10:24612647691::NO::P10_ATTRIBUTE_ID:83`

It would be very easy for a user to simply change the value being passed to P10_ATTRIBUTE_ID and potentially see something they may not be authorized to see.



## 2. Running APEX-SERT

To run APEX-SERT, select Launch APEX-SERT through the builder extension link

1. Click the "Extensions" icon to the left of the Administration icon
1. select SERT then Evaluations

![image of builder Extension menu APEX-SERT -> Evaluations](./images/sert-extension-75p.png)

There is no need to re-enter your credentials; APEX-SERT will securely verify that you are authenticated as a workspace developer or administrator when you click on the Launch APEX-SERT link.

APEX-SERT will open in a new browser tab:

<!-- ![GIF image clicking on extension builder menu > Sert > Evaluations ](./images/launch-sert.gif) -->

<img src="./images/launch-sert.gif" alt="GIF of user launching SERT" width=50% height=50%>



## 3. Home Page

The APEX homepage is the starting point for all evaluations.

![image of APEX-SERT homepage, showing the selection of Application and Ruleset with  run in background switch on and 2 recent scans in a report](./images/sert-apex-homepage.png)

* APEX-SERT provides for a *single* evaluation of a given application & Rule Set combination at any one time.
* Any developer can log into SERT and see, review, rescan, or work on the Evaluation
* Application Evaluations become *stale* when the applciation has been modified since the last time the evaluation was executed
* Evaluations can be executed in the background by enabling the Background switch, and clicking evaulate
* Existing Evaluations can be repeated in the report by clicking the right side icons
  * Triangle icon "Re-evaluate" to evaluate immediately
  * Clock icon to "Re-Evaluate in Background"
  * Trash icon to delete the Scan.

> [!TIP]
> Deleting an evaluation will also delete any associated Exceptions you have created.

### 3.1. Exception Statuses

The home page will display any Recent Evaluations that have been run and high-level metrics about exceptions. The simplified homepage shows the number of Exceptions that have been created, and required some action.
This includes exceptions that are:

* **Pending Approvals** - requested approvals that are pending the logged on user's approval or rejection.
* **Requested** - the logged on user's exceptions that have been requested for approval.
* **Stale** - Security is not an event, but rather a process. If an exception is put in place and then approved, and then the underlying value of that attribute is changed, is the exception still valid? Perhaps not. Therefore, APEX-SERT exceptions can go “stale” if the data for which they were approved changes. This process occurs automatically each time that an APEX-SERT evaluation is run.
* **Rejected** - Rejected exceptions. rejected exceptions must be withdrawn and resubmitted or deleted.

### 3.2. Recent Evaluations Table

The Recent Evaluations table displays the following information for each evaluation:

* **Score badge** - The Score is made up of a combination of the raw score plus any exceptions that have been both added and approved.
* **Rule Set** - The Rule Set used in the evaluation
* **ID** - The application ID.
* **Application** - The application name.
* **Evaluated** - How long ago the evaluation was last run.
* **User** - The user that ran the evaluation.
* **Exceptions** - Count of exceptions requiring some form of Action
* **Status badge** - Status of the Evaluation, this could be Completed,Stale, or Failed
* **Triangle icon** - Re-evaluate immediately
* **Clock icon** - Re-Evaluate in Background
* **Trash icon** - Delete the Scan

### 3.3. Evaluate Application

The vast majority of time spent in APEX-SERT will be spent browsing the results of an evaluation.

To evaluate an application complete the following steps:

1. Select **Application** to be evaluated
1. Select **Rule Set** to be used.
1. Select whether to execute Evaluation in background or foreground
1. Click Evaluate.

Rule Sets are specific to each version of APEX. It is part of APEX-SERT's design that you should run the Rule Set designed for the version of APEX on your database.  For example 24.1, or 24.2 as the case may be.

> [!WARNING] admin guide TBD

Reference the [Administration Guide](./samples.md) for more information

APEX-SERT will begin evaluating your application. Note: It may take anywhere from a couple of seconds to a minute or even longer, depending on the size of your application, size/complexity of the application being evaluated and processing power of your server.

## 4. Evaluation Dashboard

After running the evaluation, you are presented with the Evaluation Dashboard. When running an evaluation, the Application ID and Name being evaluated is displayed in bold type, as part of the breadcrumbs. As the application being evaluated changes, so will this title.

<img src="./images/eval-dashboard.png" alt="GIF of user launching SERT" width=50% height=50%>

You have three Action buttons alongside the evaluation title
* Reports
  * Various reports for the evaluation
* Exceptions
  * Download Exceptions - Download all exceptions in JSON format
  * Upload Exceptions - uploade a JSON file of exceptions
  * Bulk Exceptions - process buulk Exceptions for a Rule
  * Bulk Approve/Reject Exceptions - Approve or reject Exceptions by Rule
* Evaluation
  * Re-Evaluate - re-evaluate immediately
  * Re-Evaluate in Background - run the evaluation in the background
  * Run Evaluation for Page - run the evaluation for a specific page
  * Schedule Evaluation - schedule an evaluation for a future time
  * Delete Evaluation - delete this evaluation

The Evaluation results report uses the Smart-search feature of APEX, with built-in chips for:
  * Result - Search by Result
  * Page - filter on a specific page
  * Rule - filter by Rule
  * Category - filter by category of finding
  * Raised by ( exception raised by)

<img src="./images/sert-dash-search-l.gif" alt="GIF of Smart search using text searching" width=50% height=50%>


### 4.1. Rule Sets and Rules

APEX-SERT evaluates application accoridng to a rule set. Rule Sets are precisely as named, set of individual rules, and a rule set can comprise any combination or subset of rules.

Each rule is configured to search for and report on potential security vulnerabilities in an application. Some rules are simple in that they inspect a single component and look for a specific value, while others are more sophisticated and require a SQL query and function to determine if a threat exists. Some rules utilise  *Criteria* to raise findings. *Criteria* are individual tests that are grouped together as a *Criteria Type*, and a rule assigned a *Criteria Type* will test all grouped Criteria to evaluate a component.

As an end user of APEX-SERT, it is not important to understand how the attributes are computed as much as it is to understand how to interpret the results of the evaluation and take any corrective action if needed.

Each time an evaluation is run in APEX-SERT, it is done in conjunction with a rule set. A rule set is simply a list of rules that are grouped together. The APEX-SERT Security (<version.>) rule set includes all of APEX- SERT’s ~110 rules, and should be modified in any way. Additional rule sets can be created by a user with the Administrator role, and any number of rules can be included.

for example, Administrators can combine a subset of existing rules into a new rule set to focus of the most critical findings.

### 4.2. Categories

APEX-SERT evaluates Rules that can be divided into 4 Categories

1. Access Control
1. Cross-Site Scripting
1. Misconfiguration
1. SQL Injection

The Category of a rule is simply a broad classification of the area or Security that the rule is associated with.

Use the dashboard to filter by Category

### 4.3 Risks

 Each rule is further assigned a *Risk* from the OWASP Top 10

### 4.3. Sidebar

The left sidebar serves as a mini-dashboard within an Evaluation.




#### 4.3.1. Evaluation Scores


Beginning at the top of the left side-bar are the three scores for the evaluation:

Approved - The approved score is made up of a combination of the raw score plus any exceptions that have been both added and approved.
Pending - The pending score is made up of a combination of the raw score plus any exceptions that have been added but not yet approved.
Raw - The raw score represents the actual results of the evaluation. Any attribute that returned a FAIL deducts one point from the total possible raw score.
When an evaluation is run, the three separate scores are generated. Each score is a percentage and represents the number of vulnerabilities detected, divided by the number of components evaluated. The more complex the application, the more components that will have to be evaluated. These scores are represented by the percentage of issues that have been identified and remedied by APEX-SERT. Immediately below the three percentage scores is the number of current and potential points for an evaluation.

As a first step, developers should examine the results and attempt to fix as many vulnerabilities as possible. When a group of vulnerabilities are fixed, the developer can re-evaluate the page or the entire application to update the scores.

At some point, all vulnerabilities that can be fixed will have been addressed. When this occurs, the score will still not be 100%. In fact, if you get a raw score of 100%, your application likely won’t run at all! To achieve a score of 100%, it will be necessary to create exceptions. An Exception is simply a reason as to why the developer feels that even though APEX-SERT flagged an attribute as failed, the risk is mitigated elsewhere. It can be as brief as a couple of words or as long as a few sentences.

Essentially, it should state why it is OK for a component to be configured the way that it is, despite it failing the evaluation.

For example, one of the attributes in APEX-SERT checks to ensure that all pages require authentication. However, if by design, there are several pages that are set to public, APEX-SERT will still fail those pages. Setting those pages to require authentication is not an option, as it would break the intended functionality of the application. In this case, the developer can create an exception and justify why it is OK that these pages failed the evaluation.

#### 4.3.2. Reevaluate Entire Score


This button will be available on all pages within the evaluation, and can be clicked after identified issues are fixed in the APEX application. After the button is a select list containing all Attribute Sets .

Selecting any attribute set will re-evaluate the current application using that specific attribute set. This will be a full evaluation.

#### 4.3.3. App Deficiency Chart


A small bar chart highlights the number of failures for each major classification, eg: Settings , Page/Report , XSS , SQLi and URL Tampering . Clicking on any of the bars in the chart will display a modal window summarizing the component attributes. Clicking on a Category will bring you to the Issues by Page.



#### 4.3.4. Defects Chart

The Defects Chart displays the different defect categories.



Select a defect category group to see the failures for that category and their corresponding attributes. For example, select Page Access Protection to see the different attribute failures that fall underneath that category.



#### 4.3.5. Importing & Exporting Exceptions

This is a feature for environments where an application being evaluated is transferred across different Database instances, and reduces re-work in re-justifying exceptions already raised. A lot of work will go into developers entering, approving and/or rejecting exceptions. As applications move from the development server to the QA server, it is important to be able to move the exceptions in tandem with the applications. Thus, APEX-SERT provides the ability for an administrator to import and export exceptions, similar to how APEX applications are imported and exported.

However, there are a couple of restrictions when importing and exporting exceptions: first of all, the source and target applications should be as similar as possible. If there are any differences between them and the exception from the source cannot be mapped to the target, it will be displayed in the exception report after the import completes. Second, the Attribute Set used must be the same in both applications. Currently it is not possible to export & import a group of exceptions from one attribute set to another.

#### 4.3.5.1. Export/Download Exceptions

To export exceptions, select the Download Exceptions item from the Evaluation Dashboard sidebar mini dashboard.



Depending on your browser settings, the file may automatically download or you may be prompted for an action. If the later is the case, then select to save the file to your local disk.

#### 4.3.5.2. Import/Upload Exceptions

Next, switch to the target application. This can be a copy of the source application in the same workspace, a different workspace, or on a completely different server. Evaluate the target application, and once that is complete, select the Upload Exceptions item from the Evaluation Dashboard sidebar mini dashboard.



Click on Browse and locate the file that was just created. Also, decide if you want to purge any existing exceptions that exist for this application & attribute set. Setting this option to No may result in some exceptions not being successfully imported.

When you are ready, click Import to begin importing the exceptions. It will take from a few seconds to a couple of minutes to complete the import, as APEX-SERT will also perform a full evaluation of the application as part of the import process.

Upon completion of the exception import, a report will display any exceptions that could not be imported.

At this point, all exceptions should be imported and visible from APEX-SERT just like those entered into the application natively.

#### 4.3.6. Exception Statuses

There is a card region relating to exceptions for the current evaluation, eg: Requested, Pending, Rejected and Stale Exceptions. Exceptions that are in an Approved state are not shown, since there is no need to actively monitor or handle them. This grid is a useful tool to see where there are exceptions that need to be approved or which are still pending from anywhere within the tool.



Clicking on any quadrant in the grid will display the component attributes for that specific quadrant. You can then select the attribute to view the details further.



## 5. Navigation Bar

There is a navigation bar on the top of the page that appears on every page of the APEX-SERT application.



### 5.1. Menu

Selecting the menu icon will expand the available navigation tabs.



These tabs - Home , Reports , Preferences , Scheduler, and Admin - will also be available on every page of APEX-SERT. Depending on which role your user is a member of will determine which tabs are displayed.



Selecting a menu option will bring you to that corresponding section of APEX-SERT. Some menus - such as Scheduler and Admin - have sub-menus. Refer to GIU Scheduler and the APEX-SERT Administration Guide for more information.

APEX-SERT makes use of breadcrumbs throughout the application. These breadcrumbs can be used to assist with navigation.

### 5.2. APEX-SERT


Selecting APEX-SERT will return the user to the APEX-SERT Home page.

### 5.3. Logged in User
The available options that display under the logged in user is dependent on the user's role.



#### 5.3.1. APEX Builder

Selecting APEX Builder will return the user to the APEX Builder. This requires logging in again to the Workspace.



#### 5.3.2. APEX SERT Admin

This option is only available for users with the Administrator role. Selecting APEX-SERT Admin will direct the user to the APEX-SERT Administration app. See APEX-SERT Administration Guide - DRAFT for more details.



#### 5.3.3. Sign Out

Selecting Sign Out will log you out of the APEX-SERT application.



Issues By Page
SERT Reports
