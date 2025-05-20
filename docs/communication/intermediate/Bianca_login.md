# PLEASE COMPLETE THE FOLLOWING STEPS BEFORE THE WORKSHOP STARTS

See more details about each point below.  

- `1.` **Create an account in SUPR.**  
- `2.` **Apply for membership in the workshop project.**  
- `3.` **Apply for an UPPMAX account.**  
- `4.` **Wait for an email from UPPMAX with your UPPMAX account details.**  
- `5.` **Set up two factor authentication (2FA) for UPPMAX (can be done while waiting for earlier steps).**  
- `6.` **Optional step for login outside of SUNET**  
- `7.` **Log in with your new UPPMAX account**  
- `8.` **Create a new file with your username in the designated folder. This way we will know who has completed these steps.**

Please complete these steps before the workshop starts in order to avoid having to waste time with account issues during the actual workshop.

- `1.` **Create an account in SUPR.**

    - If you already have a SUPR account, please continue to step 2\.

    - Go to [https://supr.naiss.se/](https://supr.naiss.se/) and click “Register New Person” at the bottom of the first page. Registration via SWAMID is preferred. Complete the registration process and log in.

    - *Note that registration can take several days if you have no SWAMID.*

    - Check your email for the confirmation mail and click the link in it.

- `2.` **Apply for membership in the workshop project.**

    - Log in to SUPR.

    - Under the “**Projects**” heading, press the “**View and Manage Projects**” button.

    - Search for the project ID: **sens2025560**

    - Press the “**Request**” button to apply for membership in the project. The workshop instructor will approve it within one working day. Please note that step 6 will fail unless the project membership request has been approved.

- `3.` **Apply for an UPPMAX account.**

    - After your project membership has been approved, you can log in to SUPR and apply for a login account at UPPMAX if you do not have one already.

    - Go to [https://supr.naiss.se/account/](https://supr.naiss.se/account/) and click on “Request Account at UPPMAX”.

    - If you already have an UPPMAX account, wait until your project membership is processed (it may take up to a few hours even after you receive the email confirmation) and continue to step 5\.


- `4.` **Wait for an email from UPPMAX with your UPPMAX account details.**

    - Within about 2 working days you will get an email with your username, and another email with a link to your temporary password. **NOTE:** the link is only valid for 1 **VISIT** or 7 days. Save the temporary password when you click the link as the link only works once.

- `5.` **Set up two factor authentication (2FA) for UPPMAX. (can be done while waiting for earlier steps).**

    - For security reasons you need to use 2FA for logging in to Bianca. Please follow the instructions described on [https://docs.uppmax.uu.se/getting\_started/get\_uppmax\_2fa/](https://docs.uppmax.uu.se/getting_started/get_uppmax_2fa/) for setting it up.

- `6.` **Optional step for login outside of SUNET**

  **If your computer is not connected to a university network, SUNET, you will need to log in via a VPN.**

  You need to use the **VPN connected to your affiliated university.**  
  **As an example here is a [Link to VPN for UU](https://www.uu.se/en/staff/service-and-tools/it-and-telephony-services/it-services/network-and-vpn)**  
  You may find instructions at web pages of the IT office of your university.

  **If you are a student you may not be allowed to use a VPN. Instead you may need to use the Eduroam connection or similar at Campus.**

  **When you’re finished setting up your VPN:**

    - **Click Connect using VPN**  
    - **You can get VPN credentials from all Swedish universities. Choose the one you are affiliated to.**

- `7.` **Log in with your new UPPMAX account.**

    - Open your terminal program (Terminal in OSX and Linux, otherwise download [MobaXterm](http://mobaxterm.mobatek.net/download-home-edition.html) (portable edition) if you have Windows). For more *Linux Tools for Windows*, please refer to this page: [https://hackmd.io/@pmitev/Linux4WinUsers](https://hackmd.io/@pmitev/Linux4WinUsers).

    - Windows: If you have GitBash or Cygwin it will work nicely as well.

        - Type this command in your terminal program (TRY THIS INSTEAD OF THE EARLIER):

    **ssh *your\_uppmax\_username*@bianca.uppmax.uu.se**

          where *your\_uppmax\_username* should be replaced by your UPPMAX username 

        - You will be asked for which project you would like to use, choose **sens2025560**

        - You will be asked for your password now and you will not see any response in the terminal while typing your password. This is normal behaviour, it hides the length of your password. As password you should use your UPPMAX password *immediately followed* by the six digits from the second factor authentication and press Enter.

        - If you provided the correct password and 2FA number, you should see

  ```bash
  ****************************************************************************  
  * Login node up and running. Redirecting now\!                             *  
  * Notice\! No second factor if you use password.                           *  
  * If you use ssh keys, you can get rid of this (second) prompt.            *  
  ****************************************************************************  
  ```

    - You will be prompted to input your password again. This time only the  
      UPPMAX password is required, without the 2FA number.  

    - You may change your password by typing: **passwd**


- `8.` **Create a new file with your username in the designated folder.**

    - You should now be logged in and ready to create the file that tells us that you have completed the steps. Type the command:

     **touch  /proj/sens2025560/workshop/completed/$USER**

           Please note that you will get the error “Permission denied” if you

            have not completed step 2\. Also, re-login to UPPMAX if you were added to the

            workshop project after you logged in to the Bianca cluster.

    - Unless you got some kind of error message you should now be finished. To make sure the file was created you can type (NOW CORRECT PATH )

      ```bash
      ls  /proj/sens2025560/workshop/completed/$USER
      ```

      It should print out the name of the file if the file exists.


  If you encounter any issues in setting up your account, please contact UPPMAX support via [https://supr.naiss.se/support/](https://supr.naiss.se/support/) or email [support@uppmax.uu.se](mailto:support@uppmax.uu.se). For general questions about the workshop, please email [bjorn.claremar@uppmax.uu.se](mailto:bjorn.claremar@uppmax.uu.se).
