# Trip Fuel Cost Estimator

Trip Fuel Cost Estimator is a simple flutter application that helps users calculate the estimated fuel cost for a journey. The app will automatically calculate the total fuel expense by compute it with the formula given through user entered the travel distance, efficiency and select a fuel type. It also an easy-to-use and user-friendly interface with basic widgets, validation and splash screen for smooth user experience.

Input

•	Distance(km) is a text field that can be entered by user to represent the total travel distance

•	Fuel Efficiency (km/L) is a text field that can be entered by user to show how many kilometres the vehicle can travel per litre fuel

•	Fuel Type is selected by forming a drop-down menu which conduct RON95, RON97 and diesel. The corresponding fuel price (RM/L) is automatically displayed by side based on the selected fuel type that write in Map.


Process

•	Validate user inputs by checking the distance and efficiency are numeric or not and not empty/null

•	Show inline error message under the Text Field if invalid 

•		Formula to calculate total of estimated fuel cost:

		EstimatedCost=  Distance/Efficiency  x Price 

Output

•	Outputs displayed clearly in a styled Container

•	The selected fuel type and final estimated cost is showed

•	Button option to reset all fields including output section to start a new calculation  
 
Widget List Used

•	Text
•	Text Field
•	Dropdown
•	Elevated Button
•	Row
•	Column
•	Container
•	Expanded
•	Sized Box
•	Center 
•	Padding
•	Scaffold
•	AppBar
•	SnackBar

Basic Validation Approach

•	The application will check all the input Text Fields are empty or not before performing the calculations

•	double.tryParse() is used to safely convert user input from text to numbers. If the input in string format, it will return null instead of crashing the app

•	The application system will show an inline error message below the corresponding Text Fields when an invalid or empty input/null value is detected and also display a SnackBar with text (“Please insert all the current fields correctly.”)

•	This will ensure that only valid numeric values are used in the formula:

				EstimatedCost=  Distance/Efficiency  x Price

•	After the validation process passes, the application will update the User Interface with the calculated output using setState()

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Spinpro_SS.png?raw=true" alt="SplashScreen" width="250"/>
      <br>
      <b>SplashScreen</b>
    </td>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Spinpro_HomeBefore.png?raw=true" alt="HomeBefore" width="250"/>
      <br>
      <b>Home Before</b>
    </td>
    <td align="center">
      <img src="https://github.com/WangWangGiao/my-project-assets/blob/main/Spinpro_HomeAfterCalculation.png?raw=true" alt="HomeAfterCalculation" width="250"/>
      <br>
      <b>Home After Calculation</b>
    </td>
  </tr>
</table>
 


