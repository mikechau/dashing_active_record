# I use allow_overlapping since I don't want jobs to start overlapping if the queries start taking too long
SCHEDULER.every '5s', allow_overlapping: false do
  User.create name: "User_#{User.count}"
  send_event(:user_count, current: User.count.to_s)

  send_event(:latest_users,
    {
      items: User.order('id desc').limit(10).map { |user| { label: user.name } }
    }
  )
end