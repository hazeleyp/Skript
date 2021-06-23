require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  setup do
    @script = scripts(:one)
    @step = steps(:one)
  end

  test "should get index" do
    get :index, params: { script_id: @script }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { script_id: @script }
    assert_response :success
  end

  test "should create step" do
    assert_difference('Step.count') do
      post :create, params: { script_id: @script, step: @step.attributes }
    end

    assert_redirected_to script_step_path(@script, Step.last)
  end

  test "should show step" do
    get :show, params: { script_id: @script, id: @step }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { script_id: @script, id: @step }
    assert_response :success
  end

  test "should update step" do
    put :update, params: { script_id: @script, id: @step, step: @step.attributes }
    assert_redirected_to script_step_path(@script, Step.last)
  end

  test "should destroy step" do
    assert_difference('Step.count', -1) do
      delete :destroy, params: { script_id: @script, id: @step }
    end

    assert_redirected_to script_steps_path(@script)
  end
end
