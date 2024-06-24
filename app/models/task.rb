class Task < ApplicationRecord
  belongs_to :user
  enum status: { backlog: 0, in_progress: 1, done: 2 }
  after_create :add_to_google_calendar

  def self.check_deadlines
    Task.where(status: :in_progress).each do |task|
      if task.deadline < 1.day.from_now
        DeadlineReminderWorker.perform_async(task.id)
      elsif task.deadline < 1.hour.from_now
        DeadlineReminderWorker.perform_async(task.id)
      end
    end
  end

  def add_to_google_calendar
    google_calendar_service = GoogleCalendarService.new
    google_calendar_service.create_event(self)
  end
end