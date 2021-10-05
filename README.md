# Complete Web app Telecom. company

The purpose of this work is to create a complete web application for issuing accounts and managing mobile customers. The application includes categories of users such as customers, sellers and application administrators, with different rights and functions for each category of users.

### Used

* 3-tier model
* Tomcat
* Java
* Jsp
* Servlets
* HTML
* css
* MySQL

## App Preview with explanation
* The function of the login: Each user has a unique username and unique password which are stored as information in the Database and in particular in the Users panel. These two fields identify the user on the home page of the application. The user password is stored encrypted using the << Encryption.java >> class which contains methods for encrypting using salt and hash.

* Session management: When the user logs in to the application, his personal information (username) is stored and retained in the session. Regarding the status of the user (Admin, Seller, Client) it is not necessary to maintain this information since different pages have been created for each category of users. The session information "follows" the user as he navigates the application, until he logs off. 

* The logout function: When a user logs out, he is returned to the home page of the application (login page). This clears the cache and cancels the session.

* Through this login page, all users have the ability to log in to the application and transfer to their respective page depending on their status (Admin, Seller, Client).
This page is called << login.jsp >> and is shown below.

![sreen1](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen1.png)

## Client Functions

* Account View: The view of a user account is implemented through the servlet named << ClientYourBillsServlet.java >> which dynamically creates the page and displays the following.

![sreen2](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen2.png)

* Call History View: Call history is viewed through the << ClientsCallAnalysisServlet.java >> servlet which displays the calls that have been made and included in an account.

![sreen11](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen11.png)

* Account payment: Account payment is made through the servlet << ClientYourBillsServlet2.java >>.

## Administrator Functions

* Creating a seller: This process is implemented through the static page << admin_register_seller.jsp >> and when you press the << Register >> button the servlet << AdminRegisterSellerServlet.java >> is called.

![sreen10](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen10.png)


* Creating a client: This process is implemented through the static page << admin_register_client.jsp >> and when you press the << Register >> button the servlet << AdminRegisterClientServlet.java >> is called.

![sreen9](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen9.png)


* Creating an administrator: This process is implemented through the static page << admin_register_admin.jsp >> and when you press the << Register >> button the servlet << AdminRegisterServlet.java >> is called.

![sreen3](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen3.png)


* Customizing a seller: This process is implemented through the servlet << AdminSellersViewServlet.java >> and allows you to change some or all of the features of a seller.

![sreen4](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen4.png)


* Customizing a client: This process is implemented through the servlet << AdminClientsViewServlet.java >> and allows you to change some or all of the characteristics of a client.

![sreen5](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen5.png)


* Deleting a seller: This process is implemented through the servlet << AdminSellerViewDeleteServlet.java >> and allows you to delete a seller.

![sreen6](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen6.png)


* Deleting a client: This process is implemented through the servlet << AdminClientsViewDeleteServlet.java >> and it is possible to delete a client.

![sreen7](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen7.png)


* Creating new plan: This process is implemented through the static page << admin_create_plan.jsp >> and when you press the << Create >> button the servlet << PlanCreateServlet.java >> is called.

![sreen8](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen8.png)


* Plan configuration: This process is implemented through the servlet << PlansViewServlet.java >> and allows the plan to be configured.

![sreen12](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen12.png)


* Deleting plan: This process is implemented through the servlet << PlansViewDeleteServlet.java >> and it is possible to delete a plan.

![sreen13](https://github.com/StefanosGregory/telecom_company_manage_web_app/blob/main/screenshots/screen13.png)

## Seller Functions

* Seller functions are vary similar with administrators with some restrictions. 
  - Can't register admin
  - Can't edit/delete admin etc.

##### The repository include the Database used for the application.
