# Performance-analysis-of-Keylime

## 1.   Vision and Goals Of The Project:

This project is based on an open-source remote attestation system called Keylime. To be specific, we focus on at-scale data profiling, data collection and visualization. For the short term, by the end of this semester, our project should satisfy the following requirements:

- Displaying information in a concise way while dealing with a large number of machines.
- Collecting information for display without affecting attestation itself.
- Tracking over time: attestation is a time series event.
- Minimizing changes in Keylime itself.

As for stretch goals, we expect our project can do the following as well:

- If time permits, merge our codebase to Keylime.
- Give an acceptable engineering solution for visualization at large scale.


## 2. Users/Personas Of The Project:

This project utilizes/extends keylime to provide integrity monitoring to a cluster of nodes(with TPM chip installed) scattered around clouds. The visualization of performance analysis can be used by any end-users who wants to monitor their clouds. Amongst many scenarios, it well suited to tenants who need to remotely attest machines not under their own full control (such as a consumer of hybrid cloud or a remote Edge / IoT device in an insecure physical tamper prone location.)


** **

## 3.   Scope and Features Of The Project:

The scope of the visualization methodology includes the following parts:

- Being able to visualize the time series data in real-time.
- A prototype of the large scale visualization, which lets the user tell what’s going on in the remote cluster without too much effort.
- A web front-end project that implements all of the functionalities in the prototype.

As for the data-pipeline, the scope consists of:
- Collecting meaningful data (e.g. via DB queries)
- Processing data efficiently
- A service that periodically send the collected and processed data to the front-end


** **

## 4. Solution Concept
<img src="https://i.ibb.co/ZgxqjyD/Blank-diagram.png">

## 5. Acceptance criteria

Minimum acceptance criteria:
- Backend: Tracking and collecting Information(time series data) from a cluster of nodes. Formatting the data for displaying purpose. 
- Frontend: Displaying information(run-time system integrity) in a concise way. 

Stretch goals:
- Be able to scale up for monitoring up-to 5k nodes.
- If time permits, upstream to Open Source Keylime project.

## 6.  Release Planning:

Detailed group plan and coverage can be found on the Trello board: to be created
- Release #1(due by Week 7):  
    Build a visualization front-end prototype for data profiling  
    Back-end implementation supporting a relative small number of nodes.  
    ...

- Release #2(due by Week 9):  
	Front-end implementation  supporting a relative small number of nodes.  
    ...  

- Release #3(due by Week 13):  
	Scale-up to support a relatively large number of nodes.  
    ...  


