class ApiController < ApplicationController
  # No layout for AJAX actions
  layout false

  def stats
    ent_type = params[:entity_type]
    ent_id = params[:entity_id]
    # Show all stats
    if not ent_id
      result = Tag.group(:tag).count
    else
      result = Entity.find(ent_id).tags.all
    end
    # Pull record if ent_id isn't empty
    render :text => result.as_json
  end

  def tag
    # Add or replace tags
    ent_type = params[:entity_type]
    ent_id = params[:entity_id]
    ent_tags = params[:tags]

    # Clean up tags first
    Tag.where(entity_id: ent_id).destroy_all

    entity = Entity.find_or_initialize_by({id: ent_id})
    entity.ent_type = ent_type
    entity.save

    puts ent_tags
    ent_tags.each do |tag|
      new_tag = Tag.new
      new_tag.entity_id = ent_id
      new_tag.tag = tag
      new_tag.save
    end

    ent = Entity.find(ent_id).tags.all

    render :text => ent.as_json
  end

  def tags
    ent_type = params[:entity_type]
    ent_id = params[:entity_id]
    # Show all stats
    result = Entity.find(ent_id).tags.all

    render :text => result.to_json
  end

  def del_entity
    ent_type = params[:entity_type]
    ent_id = params[:entity_id]

    # Clean up tags first
    Tag.where(entity_id: ent_id).destroy_all
    Entity.where(id: ent_id).destroy_all

    render :text => {:test => true,
                     :type => ent_type,
                     :id => ent_id}.to_json
  end
end
