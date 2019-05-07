require 'test_helper'

class MedicalUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_unit = medical_units(:one)
  end

  test "should get index" do
    get medical_units_index_url, as: :json
    assert_response :success
  end

  test "should create medical_unit" do
    assert_difference('MedicalUnits.count') do
      post medical_units_index_url, params: { medical_unit: { created_at: @medical_unit.created_at, locatie: @medical_unit.locatie, nume: @medical_unit.nume, sigla: @medical_unit.sigla, tip_unitate: @medical_unit.tip_unitate, updated_at: @medical_unit.updated_at } }, as: :json
    end

    assert_response 201
  end

  test "should show medical_unit" do
    get medical_unit_url(@medical_unit), as: :json
    assert_response :success
  end

  test "should update medical_unit" do
    patch medical_unit_url(@medical_unit), params: { medical_unit: { created_at: @medical_unit.created_at, locatie: @medical_unit.locatie, nume: @medical_unit.nume, sigla: @medical_unit.sigla, tip_unitate: @medical_unit.tip_unitate, updated_at: @medical_unit.updated_at } }, as: :json
    assert_response 200
  end

  test "should destroy medical_unit" do
    assert_difference('MedicalUnits.count', -1) do
      delete medical_unit_url(@medical_unit), as: :json
    end

    assert_response 204
  end
end
