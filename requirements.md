# Requirements 

- [ ] The application must be comprised of at least two microservices plus the web client code that integrates them all and provides the user interface.
- [ ] Each microservice must be implemented as an AWS Lambda function in Ruby and provide a RESTful API with JSON requests and responses.
- [ ] Each microservice should have its own independent persistent data store (if it actually needs one), shared with no other microservice. For read only data stores you can use plain text files (for example YAML or JSON files). For read & write data stores you must use the Amazon DynamoDB NoSQL database.
- [ ] The web client must be developed in Ruby using the Sinatra DSL using the Model–View–Controller (MVC) architectural pattern. You can also check [HARRIS].
- [ ] The user interface must be intuitive and easy to use. You may use a web front-end framework (for example Bootstrap or W3.CSS) if you wish.
- [ ] The application must allow the user to select how many different questions (between one and ten) she/he wants to answer.
- [ ] The questions must be selected randomly from a bank of at least 50 multiple choice items. All questions must be related to design patterns, antipatterns and refactorings. Please use the following resources: [OLSEN] Design Patterns in Ruby, [FIELDS] Refactoring: Ruby Edition, SourceMaking web site (Design Patterns and AntiPatterns).
- [ ] Each question must appear all by itself in the web browser window.
- [ ] Once the user answers a question, the application must give the user the corresponding feedback, indicating if the answer was right or wrong, and displaying the correct answer if the user’s choice was wrong. After this, the user can proceed to see and answer the next question.
- [ ]  Once all questions have been answered, the application must display the final score. Also, a score table with the initials and scores (in descending order) of all previous users should be displayed.
- [ ] Finally, the user should be given the option to restart the quiz application.