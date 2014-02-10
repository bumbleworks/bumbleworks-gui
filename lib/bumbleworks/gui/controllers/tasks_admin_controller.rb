class TasksAdminController < Rory::Controller
  def layout
    'default'
  end

  def index
    @tasks = Bumbleworks::Task.all
  end

  def show
    @task = Bumbleworks::Task.find_by_id(@params[:id])
  end
end
