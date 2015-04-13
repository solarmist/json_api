class ApiController < ApplicationController
    # No layout for AJAX actions
  # TODO: replace with "check the controller" proc with .xhr?
  layout false
  def stats
    ent_type = params[:entity_type]
    ent_id = params[:entity_id]
    # Show all stats

    # Pull record if ent_id isn't empty
    render :text => {:test => true,
                     :type => ent_type,
                     :id => ent_id}.to_json
  end

  def tag

  end

  def tags
    ent_type = params[:entity_type]
    ent_id = params[:entity_id]
    # Show all stats
    render :text => {:test => true,
                     :type => ent_type,
                     :id => ent_id}.to_json
  end

  def del_entity
    ent_type = params[:entity_type]
    ent_id = params[:entity_id]
    # Show all stats
    render :text => {:test => true,
                     :type => ent_type,
                     :id => ent_id}.to_json
  end
end
