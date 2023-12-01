class UsersController < ApplicationController
  def on_call
    @user = current_user
    @on_call = Booking.all.where(on_call: true, user_id: current_user)
    if Booking.all.where(on_call: true, user_id: current_user).first.date.to_date == Date.today
      @on_call = @on_call.second
    else
      @on_call = @on_call.first
    end

    @on_duty = Booking.all.where(on_call: false, user_id: current_user)
    if Booking.all.where(on_call: false, user_id: current_user).first.date.to_date == Date.today
      @on_duty = @on_duty.second
    else
      @on_duty = @on_duty.first
    end
  end

  def on_duty
    @user = current_user
    @on_call = Booking.all.where(on_call: true, user_id: current_user)
    if Booking.all.where(on_call: true, user_id: current_user).first.date.to_date == Date.today
      @on_call = @on_call.second
    else
      @on_call = @on_call.first
    end

    @on_duty = Booking.all.where(on_call: false, user_id: current_user)
    if Booking.all.where(on_call: false, user_id: current_user).first.date.to_date == Date.today
      @on_duty = @on_duty.second
    else
      @on_duty = @on_duty.first
    end
  end

  def default

  end
end
