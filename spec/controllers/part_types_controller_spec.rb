require 'spec_helper'

describe PartTypesController do

  render_views
  
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all part_types as @part_types" do
      part_type = PartType.create! valid_attributes
      get :index
      assigns(:part_types).should eq([part_type])
    end
    it "should be successful" do
      get "index"
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested part_type as @part_type" do
      part_type = PartType.create! valid_attributes
      get :show, :id => part_type.id.to_s
      assigns(:part_type).should eq(part_type)
    end
    it "should be sucessful" do
      get "show"
      response.should be_success
    end
  end

  describe "GET new" do
    it "assigns a new part_type as @part_type" do
      get :new
      assigns(:part_type).should be_a_new(PartType)
    end
    it "should be successful" do
      get "new"
      response.should be_success
    end
  end

  describe "GET edit" do
    it "assigns the requested part_type as @part_type" do
      part_type = PartType.create! valid_attributes
      get :edit, :id => part_type.id.to_s
      assigns(:part_type).should eq(part_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PartType" do
        expect {
          post :create, :part_type => valid_attributes
        }.to change(PartType, :count).by(1)
      end

      it "assigns a newly created part_type as @part_type" do
        post :create, :part_type => valid_attributes
        assigns(:part_type).should be_a(PartType)
        assigns(:part_type).should be_persisted
      end

      it "redirects to the created part_type" do
        post :create, :part_type => valid_attributes
        response.should redirect_to(PartType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved part_type as @part_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        PartType.any_instance.stub(:save).and_return(false)
        post :create, :part_type => {}
        assigns(:part_type).should be_a_new(PartType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PartType.any_instance.stub(:save).and_return(false)
        post :create, :part_type => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested part_type" do
        part_type = PartType.create! valid_attributes
        # Assuming there are no other part_types in the database, this
        # specifies that the PartType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PartType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => part_type.id, :part_type => {'these' => 'params'}
      end

      it "assigns the requested part_type as @part_type" do
        part_type = PartType.create! valid_attributes
        put :update, :id => part_type.id, :part_type => valid_attributes
        assigns(:part_type).should eq(part_type)
      end

      it "redirects to the part_type" do
        part_type = PartType.create! valid_attributes
        put :update, :id => part_type.id, :part_type => valid_attributes
        response.should redirect_to(part_type)
      end
    end

    describe "with invalid params" do
      it "assigns the part_type as @part_type" do
        part_type = PartType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PartType.any_instance.stub(:save).and_return(false)
        put :update, :id => part_type.id.to_s, :part_type => {}
        assigns(:part_type).should eq(part_type)
      end

      it "re-renders the 'edit' template" do
        part_type = PartType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PartType.any_instance.stub(:save).and_return(false)
        put :update, :id => part_type.id.to_s, :part_type => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested part_type" do
      part_type = PartType.create! valid_attributes
      expect {
        delete :destroy, :id => part_type.id.to_s
      }.to change(PartType, :count).by(-1)
    end

    it "redirects to the part_types list" do
      part_type = PartType.create! valid_attributes
      delete :destroy, :id => part_type.id.to_s
      response.should redirect_to(part_types_url)
    end
  end

end
