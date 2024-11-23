# swift_reservation

Reservation management system named Swift Reservation built using Flutter and Firebase

## How to run

Run command below to start the app
    
```bash
flutter run 
```

## How to test
- Run the app and login using the below credentials
  - Email: moumipal2002@gmail.com
  - Password: test1234
- Go to Create Reservation page 
- Fill in the form 
- Click on the "Create Reservation" button 
- It will take you to the table selector page, select available tables if any 
- Click on the "Confirm Booking" button 
- You'll now find the reservation in the Manage Reservation Tab 
- You can change reservation status from the dropdown 
- Filters for date and status are also available below the appbar 
- Also find the weekly and daily stats in the dashboard page

## Logics used for key features

    ### Create Reservation
    - Used a form to take input from the user
    - On submit, the form data is sent to the table selector page
    - The user can select available tables and confirm the booking
    - Firebase is used to store the reservation data
    
    ### Manage Reservation
    - Used a firestore list view to display all the reservations with realtime updates
    - Added filters for date and status to update Firestore query
    - Added a dropdown to change reservation status by updating Firestore data for a specific reservation
    - Statuses like Cancelled, Checkout and Waiting have added functionality to remove table from the reservation

    ### Dashboard
    - Used Firestore queries to get weekly reservations and build the weekly bar chart
    - Checked the reservations for today from weekly reservations and displayed the count of tables remaining

    ### Authentication
    - Used Firebase authentication to authenticate users based on email and password
    - Users need to be created in Firebase manually as based on my research reservation systems are invite-only and not open to the public



