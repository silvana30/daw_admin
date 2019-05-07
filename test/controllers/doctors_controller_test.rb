require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get doctors_index_url, as: :json
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctors.count') do
      post doctors_index_url, params: { doctor: { an_absolvire: @doctor.an_absolvire, created_at: @doctor.created_at, nume: @doctor.nume, poza_profil: @doctor.poza_profil, specializare: @doctor.specializare, updated_at: @doctor.updated_at } }, as: :json
    end

    assert_response 201
  end

  test "should show doctor" do
    get doctor_url(@doctor), as: :json
    assert_response :success
  end

  test "should update doctor" do
    patch doctor_url(@doctor), params: { doctor: { an_absolvire: @doctor.an_absolvire, created_at: @doctor.created_at, nume: @doctor.nume, poza_profil: @doctor.poza_profil, specializare: @doctor.specializare, updated_at: @doctor.updated_at } }, as: :json
    assert_response 200
  end

  test "should destroy doctor" do
    assert_difference('Doctors.count', -1) do
      delete doctor_url(@doctor), as: :json
    end

    assert_response 204
  end
end
