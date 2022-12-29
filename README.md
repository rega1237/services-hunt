![](https://i.ibb.co/42JK9VD/logo-wb.png)
  

#  Services Hunt

> Services Hunt is a web app who allow the users to share they services, the users can find the services they need and make reviews about the services they have used.

##  Screenshots
- Authentication
![Login](https://i.ibb.co/r4DZ9zS/Screenshot-from-2022-12-29-11-44-57.png)
  
- Home
![enter image description here](https://i.ibb.co/8DnZ6fX/Screenshot-from-2022-12-29-11-47-01.png)

- User dashboard  
![enter image description here](https://i.ibb.co/3NqKBGr/Screenshot-from-2022-12-29-11-49-19.png)
  
- All services
![enter image description here](https://i.ibb.co/sCh3grk/Screenshot-from-2022-12-29-11-50-27.png)

## Live Demo URL
[Live Demo](https://serviceshunt.onrender.com/)

##  Built With

- Ruby on Rails

- PostgreSQL

- Tailwind

###  Getting Started

To get a local copy up and running follow these simple steps:

###  Prerequisites

- Ruby ruby-3.1.2 installed

- PostgreSQL dbms running

###  Setup

- Open your terminal and navigate to the folder you would like to save the project.

- Type these commands into the terminal:

```

git clone https://github.com/rega1237/services-hunt

cd services-hunt

bundle install

bundle exec figaro install

```

- The bundle exec figaro install is to install and create the `application.yml` file and create the environment variables

- You will need to configure your `application.yml` file before you install and run the project. The `application.yml` file contains environment variables needed to deploy the webpage. You can find this file in the folder config/application.yml. There is a commented `application_example.txt` file you can use as a guide to configure your own.

  

- Edit file application.yml

- Provide the values for the variables

 ```
 GMAIL_USERNAME => To use config SMTP gmail to send email devise confimation

GMAIL_PASSWORD => To use config SMTP gmail to send email devise confimation

GOOGLE_CLIENT_ID => You get thi in developer api from google to use onniauth 

GOOGLE_CLIENT_SECRET => You get thi in developer api from google to use onniauth 
``` 

- Type this commands into the terminal:

```

rails db:create

rails db:reset

```
###  Run application


- Type this command into the terminal:

```

bin/dev

```
- Open your web browser at [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

 
###  Testing

- Type this command into the terminal:

```

rails db:migrate RAILS_ENV=test

rails db:seed RAILS_ENV=test

rspec

```

##  Author

👤 **Rafael E. Guzman Arias**

- GitHub: [@rega1237](https://github.com/rega1237)

- LinkedIn: [Rafael E. Guzman Arias](https://www.linkedin.com/in/rafael-eduardo-guzman/)

##  🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

##  Show your support

Give a ⭐️ if you like this project!

##  📝 License

This project is [MIT](./MIT.md) licensed.