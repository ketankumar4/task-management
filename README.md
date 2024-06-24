# README

1. Used devise gem to register and login users
2. Configure Devise in development.rb
3. Task model to include status enum
4. Users are authenticated before accessing tasks by using before_action :authenticate_user! in tasks_controller
5. used sidekiq gem for background jobs.
6. created a mailer for notifications and send deadlines.
7. schedule a job for checking checking the deadlines method defined in task.rb model which will run each day at 12 am and schedule a mail. (used whenever gem for scheduling)
8. used google-api-client gem for integrating Google calendar API and created credentials for that.
9. in task.rb model added after_create :add_to_google_calendar method.