class DeadlineReminderWorker
  include Sidekiq::Worker

  def perform(task_id)
    task = Task.find(task_id)
    TaskMailer.deadline_reminder(task).deliver_now if task.deadline > Time.now
  end
end