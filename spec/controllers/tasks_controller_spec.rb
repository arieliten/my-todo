require 'spec_helper'

describe TasksController do
  def login_user
    @user = FactoryGirl.create(:user)
    sign_in @user
    controller.stub(current_user: @user)
  end

  def valid_attributes
    {title: 'Go shopping', priority: '2', due_at: '2012-10-28'}
  end


  context 'without logged in user' do
    before { get :index }
    it { should respond_with 302 }
  end

  context "with a logged in user" do
    let(:task){ FactoryGirl.create(:task, user: @user) }
    let(:task_1){ FactoryGirl.create(:task, user: @user, priority: 1) }
    let(:task_2){ FactoryGirl.create(:task, user: @user, priority: 2) } 

    before { login_user }

    describe "GET /index" do
      it { get(:index); should respond_with 200 }

      it "assigns a new task as @task" do
        get :index
        assigns(:task).should be_a_new(Task)
      end

      it "assigns user's tasks as @tasks" do
        task = FactoryGirl.create(:task, user: @user)
        get :index
        assigns(:tasks).should eq([task])
      end

      context "when params[:sort] present" do
        it 'sort by given field asc' do
          get :index, {sort: 'priority asc'}
          assigns(:tasks).should eq([task_1,task_2])
        end

        it 'sort by given field desc' do
          get :index, {sort: 'priority desc'}
          assigns(:tasks).should eq([task_2,task_1])
        end
      end
    end


    describe "GET /new" do
      before { get :new }

      it { assigns(:task).should be_a_new(Task) }
      it { should respond_with(200) }
    end


    describe "GET /1/edit" do
      before { get :edit, {id: task.to_param} }

      it { assigns(:task).should eq(task) }
    end


    describe "DELETE /1" do
      it "destroys the requested task" do
        task
        expect {
          delete :destroy, {id: task.to_param}
        }.to change(@user.tasks, :count).by(-1)
      end

      it "redirects to the tasks list" do
        delete :destroy, {id: task.to_param}
        response.should redirect_to(root_url)
      end
    end


    describe "POST /" do
      context "with valid params" do
        it "creates a new Task for current user" do
          expect {
            post :create, {task: valid_attributes}
          }.to change(@user.tasks, :count).by(1)
        end

        it "assigns a newly created task as @task" do
          post :create, {task: valid_attributes}
          assigns(:task).should be_a(Task)
          assigns(:task).should be_persisted
        end

        it "redirects to root path" do
          post :create, {task: valid_attributes}
          response.should redirect_to(root_url(hide_completed: false, sort: '', reset: true))
        end

        it "keep sorted and hide completed params" do
          post :create, {task: valid_attributes, hide_completed: true, sort: 'title desc'}
          response.should redirect_to(root_url(hide_completed: true, sort: 'title desc', reset: true))
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved task as @task" do
          Task.any_instance.stub(:save).and_return(false)
          post :create, {task: {}}
          assigns(:task).should be_a_new(Task)
        end

        it "re-renders the 'new' template" do
          Task.any_instance.stub(:save).and_return(false)
          post :create, {task: {}}
          response.should render_template("new")
        end
      end
    end


    describe "PUT /1" do
      context "with valid params" do
        it "updates the requested task" do
          put :update, {id: task.to_param, task: {'title' => 'changed'}}
          task.reload.title.should eq('changed')
        end

        it "assigns the requested task as @task" do
          put :update, {id: task.to_param, task: valid_attributes}
          assigns(:task).should eq(task)
        end

        it "redirects to root path" do
          put :update, {id: task.to_param, task: valid_attributes}
          response.should redirect_to(root_url(hide_completed: false, sort: ''))
        end
      end

      describe "with invalid params" do
        it "assigns the task as @task" do
          Task.any_instance.stub(:save).and_return(false)
          put :update, {id: task.to_param, task: {}}
          assigns(:task).should eq(task)
        end

        it "re-renders the 'edit' template" do
          Task.any_instance.stub(:save).and_return(false)
          put :update, {id: task.to_param, task: {}}
          response.should render_template("edit")
        end
      end
    end


    describe "PUT /1/toggle" do
      it "toggle the 'completed' value" do
        put :toggle, {id: task.to_param}
        task.reload.completed.should eq(true)
        put :toggle, {id: task.to_param}
        task.reload.completed.should eq(false)
      end

      it "redirects to root path" do
        put :toggle, {id: task.to_param}
        response.should redirect_to(root_url(hide_completed: false, sort: ''))
      end
    end
  end

end