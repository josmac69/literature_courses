#### Data pipelines as graphs

* data pipelines represented as graphs containing tasks and dependencies between them
  * Directed Acyclic Graph - DAG
  * no circular dependencies which could lead into deadlocks
* Task can have states
  * ready for execution - if all upstream dependencies are satisfied
  * running
  * finished execution / failed
* there can be several parallel upstream dependencies
* graphs allow us to separate tasks into small incremental steps

#### Workflow managers

* I personally worked with Argo (yaml / Go) and Airflow (Python - workflows as code)

### Airflow architecture

- scheduler - reads code, parses DAGs, starts scheduling
  - scheduling to descrete intervals like in crontab
  - scheduling with time delta
- workers - pick up tasks
- webserver - main user interface, visualization of DAGs dependencies,
  - graph viewh, tree view, tasks duration graph, landing times graph, logs for each task
  - ability to restart
  - info about last and next restart
-
